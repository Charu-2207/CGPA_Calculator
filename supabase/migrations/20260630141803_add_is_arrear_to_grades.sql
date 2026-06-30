-- Add is_arrear column to grades table to track arrear subjects
ALTER TABLE grades ADD COLUMN IF NOT EXISTS is_arrear BOOLEAN DEFAULT FALSE;

-- Add a check constraint to ensure semester_number is consistent with arrear logic
-- Arrear subjects are those being retaken in a later semester than originally failed
COMMENT ON COLUMN grades.is_arrear IS 'TRUE if this grade entry is for an arrear (backlog) subject being retaken in a later semester';