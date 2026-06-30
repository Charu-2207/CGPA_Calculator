/*
# Fix students table for register-number-based auth

1. Problem
- Students table generates its own UUID (gen_random_uuid())
- But auth-based signup needs student.id to match auth.users.id
- Current INSERT policy requires auth.uid() = id, which fails

2. Solution
- Drop the auto-generated UUID default from students.id
- Make id reference auth.users instead of auto-generating
- Update INSERT policy to allow authenticated users to create their own record
- The student record will use the auth user's id

3. Changes
- Alter students.id to remove gen_random_uuid() default
- Update INSERT policy to allow authenticated users to insert with their auth uid
*/

-- Remove auto-generated UUID so we can use auth.uid() as the id
ALTER TABLE public.students 
ALTER COLUMN id DROP DEFAULT;

-- Drop and recreate the INSERT policy to allow proper signup
DROP POLICY IF EXISTS insert_own_students ON public.students;
CREATE POLICY "insert_own_students" ON public.students
FOR INSERT TO authenticated
WITH CHECK (auth.uid() = id);