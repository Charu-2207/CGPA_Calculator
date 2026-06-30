import { useState, useEffect, useCallback } from 'react';
import { supabase, isSupabaseConfigured } from '../lib/supabase';
import type { Student } from '../types';
import { getStudentById } from '../services/database';
import type { Session, User } from '@supabase/supabase-js';

interface AuthState {
  session: Session | null;
  user: User | null;
  student: Student | null;
  loading: boolean;
  error: string | null;
}

export function useAuth() {
  const [state, setState] = useState<AuthState>({
    session: null,
    user: null,
    student: null,
    loading: true,
    error: null,
  });

  const loadStudentData = useCallback(async (userId: string) => {
    try {
      if (!isSupabaseConfigured) {
        setState(prev => ({ ...prev, loading: false }));
        return;
      }
      const student = await getStudentById(userId);
      if (student) {
        setState(prev => ({ ...prev, student, loading: false }));
      } else {
        setState(prev => ({ ...prev, student: null, loading: false }));
      }
    } catch (error) {
      console.error('Failed to load student data:', error);
      setState(prev => ({
        ...prev,
        error: 'Failed to load student data',
        loading: false,
      }));
    }
  }, []);

  useEffect(() => {
    if (!isSupabaseConfigured) {
      setState(prev => ({ ...prev, loading: false }));
      return;
    }

    let mounted = true;

    const initAuth = async () => {
      try {
        const { data: { session } } = await supabase.auth.getSession();

        if (!mounted) return;

        setState(prev => ({
          ...prev,
          session,
          user: session?.user ?? null,
          loading: !!session?.user,
        }));

        if (session?.user) {
          await loadStudentData(session.user.id);
        } else {
          setState(prev => ({ ...prev, loading: false }));
        }
      } catch (error) {
        console.error('Auth init error:', error);
        if (mounted) {
          setState(prev => ({ ...prev, loading: false, error: 'Auth initialization failed' }));
        }
      }
    };

    initAuth();

    const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
      if (!mounted) return;

      (async () => {
        setState(prev => ({
          ...prev,
          session,
          user: session?.user ?? null,
          loading: !!session?.user,
          error: null,
        }));

        if (session?.user) {
          // On first sign-in after signup, create the student row from auth metadata
          // if it doesn't already exist.
          if (event === 'SIGNED_IN') {
            const meta = session.user.user_metadata;
            if (meta?.register_number && meta?.name) {
              const existing = await getStudentById(session.user.id);
              if (!existing) {
                  await supabase.from('students').insert({
                  id: session.user.id,
                  register_number: meta.register_number,
                  student_name: meta.name,
                  department: meta.department ?? 'CSE',
                  batch_year: meta.batch_year ?? new Date().getFullYear(),
                });
              }
            }
          }
          await loadStudentData(session.user.id);
        } else {
          setState(prev => ({ ...prev, student: null, loading: false }));
        }
      })();
    });

    return () => {
      mounted = false;
      subscription.unsubscribe();
    };
  }, [loadStudentData]);

  const signUp = useCallback(async (
    registerNumber: string,
    password: string,
    options: {
      name: string;
      department: string;
      batch_year: number;
    }
  ) => {
    if (!isSupabaseConfigured) {
      return { success: false, error: 'Supabase not configured' };
    }

    setState(prev => ({ ...prev, loading: true, error: null }));

    const syntheticEmail = `${registerNumber.toLowerCase()}@student.local`;

    try {
      const { data, error } = await supabase.auth.signUp({
        email: syntheticEmail,
        password,
        options: {
          data: {
            register_number: registerNumber,
            name: options.name,
            department: options.department,
            batch_year: options.batch_year,
          },
        },
      });

      if (error) {
        // Check if user already exists - try to sign them in
        if (error.message.includes('already registered') || error.message.includes('already been registered')) {
          const signInResult = await supabase.auth.signInWithPassword({
            email: syntheticEmail,
            password,
          });
          if (signInResult.data.session) {
            setState(prev => ({
              ...prev,
              user: signInResult.data.user,
              session: signInResult.data.session,
              loading: false,
            }));
            return { success: true };
          }
        }
        setState(prev => ({ ...prev, loading: false, error: error.message }));
        return { success: false, error: error.message };
      }

      if (!data.user) {
        return { success: false, error: 'Failed to create account' };
      }

      // Try to get a session - if no session, the auto-confirm trigger may need a moment
      // so we'll try to sign in immediately
      let session = data.session;
      let user = data.user;

      if (!session) {
        // Auto-confirm trigger should have fired, try to sign in
        const signInResult = await supabase.auth.signInWithPassword({
          email: syntheticEmail,
          password,
        });
        if (signInResult.data.session) {
          session = signInResult.data.session;
          user = signInResult.data.user;
        }
      }

      // Insert the student row with the user's id
      if (user) {
        const { error: insertError } = await supabase.from('students').insert({
          id: user.id,
          register_number: registerNumber,
          student_name: options.name,
          department: options.department,
          batch_year: options.batch_year,
        });

        if (insertError && !insertError.message.includes('duplicate key')) {
          console.error('Insert error:', insertError);
          // Continue anyway - the auth user was created
        }
      }

      setState(prev => ({
        ...prev,
        user,
        session,
        loading: false,
      }));

      return { success: true };
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Unknown error';
      setState(prev => ({ ...prev, loading: false, error: message }));
      return { success: false, error: message };
    }
  }, []);

  const signIn = useCallback(async (registerNumber: string, password: string) => {
    if (!isSupabaseConfigured) {
      return { success: false, error: 'Supabase not configured' };
    }

    setState(prev => ({ ...prev, loading: true, error: null }));

    const syntheticEmail = `${registerNumber.toLowerCase()}@student.local`;

    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email: syntheticEmail,
        password,
      });

      if (error) {
        setState(prev => ({ ...prev, loading: false, error: error.message }));
        return { success: false, error: error.message };
      }

      setState(prev => ({
        ...prev,
        session: data.session,
        user: data.user,
        loading: false,
      }));

      return { success: true };
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Unknown error';
      setState(prev => ({ ...prev, loading: false, error: message }));
      return { success: false, error: message };
    }
  }, []);

  const signOut = useCallback(async () => {
    if (!isSupabaseConfigured) {
      return { success: false, error: 'Supabase not configured' };
    }

    setState(prev => ({ ...prev, loading: true }));

    try {
      const { error } = await supabase.auth.signOut();

      if (error) {
        setState(prev => ({ ...prev, loading: false, error: error.message }));
        return { success: false, error: error.message };
      }

      setState({
        session: null,
        user: null,
        student: null,
        loading: false,
        error: null,
      });

      return { success: true };
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Unknown error';
      setState(prev => ({ ...prev, loading: false, error: message }));
      return { success: false, error: message };
    }
  }, []);

  return {
    ...state,
    isAuthenticated: !!state.session && !!state.student,
    needsOnboarding: !!state.session && !state.student,
    signUp,
    signIn,
    signOut,
  };
}
