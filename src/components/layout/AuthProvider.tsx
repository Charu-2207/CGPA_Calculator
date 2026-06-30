import { createContext, useContext, ReactNode } from 'react';
import { useAuth } from '../../hooks/useAuth';
import type { Student } from '../../types';
import type { Session, User } from '@supabase/supabase-js';

interface AuthContextType {
  session: Session | null;
  user: User | null;
  student: Student | null;
  loading: boolean;
  error: string | null;
  isAuthenticated: boolean;
  needsOnboarding: boolean;
  signUp: (registerNumber: string, password: string, options: {
    email: string;
    name: string;
    department: string;
    batch_year: number;
  }) => Promise<{ success: boolean; error?: string; requiresConfirmation?: boolean }>;
  signIn: (email: string, password: string) => Promise<{ success: boolean; error?: string }>;
  signOut: () => Promise<{ success: boolean; error?: string }>;
}

const AuthContext = createContext<AuthContextType | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const auth = useAuth();

  return (
    <AuthContext.Provider value={auth}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuthContext(): AuthContextType {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuthContext must be used within an AuthProvider');
  }
  return context;
}
