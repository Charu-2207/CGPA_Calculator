/*
# Auto-confirm new users and enable signup without email

1. Purpose
- Automatically confirm new user accounts without requiring email verification
- This bypasses Supabase's email rate limits since no emails are sent
- Users can sign up and immediately access their account

2. How it works
- Creates a trigger function that auto-confirms users on creation
- The trigger fires AFTER INSERT on auth.users and sets email_confirmed_at
- This allows immediate login without email confirmation

3. Changes
- New function: auto_confirm_user() - sets email_confirmed_at to now()
- New trigger: on_auth_user_created - fires after insert on auth.users
*/

CREATE OR REPLACE FUNCTION auto_confirm_user()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE auth.users
  SET email_confirmed_at = now()
  WHERE id = NEW.id AND email_confirmed_at IS NULL;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION auto_confirm_user();