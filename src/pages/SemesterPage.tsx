import { useState, useEffect } from 'react';
import { useAuthContext } from '../components/layout/AuthProvider';
import { getSubjectsForSemester, upsertGrade, deleteGrade, getArrearSubjects } from '../services/database';
import type { SubjectWithGrade } from '../types';
import { GRADES, GRADE_POINTS } from '../types';
import { calculateSGPA, getTotalCredits, getEarnedCredits } from '../utils/calculations';
import {
  BookOpen,
  ChevronDown,
  Plus,
  X,
  Trash2,
  Check,
  AlertCircle,
  AlertTriangle,
} from 'lucide-react';

export function SemesterPage() {
  const { student } = useAuthContext();
  const [selectedSem, setSelectedSem] = useState(1);
  const [subjects, setSubjects] = useState<SubjectWithGrade[]>([]);
  const [arrearSubjects, setArrearSubjects] = useState<SubjectWithGrade[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState<string | null>(null);
  const [showAddSubject, setShowAddSubject] = useState(false);
  const [showArrearDropdown, setShowArrearDropdown] = useState(false);
  const [newSubject, setNewSubject] = useState({
    code: '',
    name: '',
    credits: 3,
    isElective: false,
  });
  const [customSubjects, setCustomSubjects] = useState<SubjectWithGrade[]>([]);
  const [highlightError, setHighlightError] = useState<string | null>(null);
  const [savedSuccessfully, setSavedSuccessfully] = useState<string | null>(null);

  useEffect(() => {
    loadSubjects();
  }, [selectedSem, student]);

  const loadSubjects = async () => {
    if (!student) return;
    setLoading(true);

    try {
      const [data, arrears] = await Promise.all([
        getSubjectsForSemester(selectedSem, student.department, student.id),
        getArrearSubjects(student.id, selectedSem, student.department),
      ]);
      setSubjects(data);
      setArrearSubjects(arrears);
      setCustomSubjects([]);
    } catch (error) {
      console.error('Failed to load subjects:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleGradeChange = async (subjectId: string, grade: string, isArrear: boolean = false) => {
    if (!student) return;

    const subject = [...subjects, ...customSubjects, ...arrearSubjects].find(s => s.id === subjectId);
    if (!subject) return;

    const gradePoint = GRADE_POINTS[grade] ?? 0;
    const prevGrade = [...subjects, ...customSubjects, ...arrearSubjects].find(s => s.id === subjectId)?.grade;

    setSubjects(prev => prev.map(s =>
      s.id === subjectId
        ? { ...s, grade, grade_point: gradePoint }
        : s
    ));
    setCustomSubjects(prev => prev.map(s =>
      s.id === subjectId
        ? { ...s, grade, grade_point: gradePoint }
        : s
    ));
    setArrearSubjects(prev => prev.map(s =>
      s.id === subjectId
        ? { ...s, grade, grade_point: gradePoint }
        : s
    ));

    setSaving(subjectId);
    try {
      await upsertGrade(student.id, subjectId, selectedSem, grade, subject.credits, isArrear);
      setSavedSuccessfully(subjectId);
      setTimeout(() => setSavedSuccessfully(null), 2000);
    } catch (error) {
      setHighlightError(subjectId);
      setSubjects(prev => prev.map(s =>
        s.id === subjectId
          ? { ...s, grade: prevGrade, grade_point: prevGrade ? GRADE_POINTS[prevGrade] : undefined }
          : s
      ));
      setCustomSubjects(prev => prev.map(s =>
        s.id === subjectId
          ? { ...s, grade: prevGrade, grade_point: prevGrade ? GRADE_POINTS[prevGrade] : undefined }
          : s
      ));
      setArrearSubjects(prev => prev.map(s =>
        s.id === subjectId
          ? { ...s, grade: prevGrade, grade_point: prevGrade ? GRADE_POINTS[prevGrade] : undefined }
          : s
      ));
      setTimeout(() => setHighlightError(null), 3000);
    } finally {
      setSaving(null);
    }
  };

  const handleDeleteGrade = async (gradeId: string, subjectId: string) => {
    if (!student) return;
    try {
      await deleteGrade(gradeId);
      setSubjects(prev => prev.map(s =>
        s.id === subjectId
          ? { ...s, grade: undefined, grade_id: undefined, grade_point: undefined }
          : s
      ));
      setCustomSubjects(prev => prev.map(s =>
        s.id === subjectId
          ? { ...s, grade: undefined, grade_id: undefined, grade_point: undefined }
          : s
      ));
      setArrearSubjects(prev => prev.map(s =>
        s.id === subjectId
          ? { ...s, grade: undefined, grade_id: undefined, grade_point: undefined }
          : s
      ));
    } catch (error) {
      console.error('Failed to delete grade:', error);
    }
  };

  const handleAddCustomSubject = () => {
    if (!newSubject.code || !newSubject.name) return;

    const custom: SubjectWithGrade = {
      id: `custom-${Date.now()}`,
      semester_id: '',
      subject_code: newSubject.code.toUpperCase(),
      subject_name: newSubject.name,
      credits: newSubject.credits,
      is_elective: newSubject.isElective,
    };

    setCustomSubjects(prev => [...prev, custom]);
    setNewSubject({ code: '', name: '', credits: 3, isElective: false });
    setShowAddSubject(false);
  };

  const handleAddArrearSubject = (arrear: SubjectWithGrade) => {
    if (!student) return;

    setArrearSubjects(prev => [...prev, { ...arrear, grade: undefined, grade_id: undefined, grade_point: undefined }]);
    setShowArrearDropdown(false);
  };

  const allSubjects = [...subjects, ...customSubjects, ...arrearSubjects];
  const sgpa = calculateSGPA(allSubjects);
  const totalCredits = getTotalCredits(allSubjects);
  const earnedCredits = getEarnedCredits(allSubjects);
  const gradedCount = allSubjects.filter(s => s.grade).length;

  if (loading) {
    return (
      <div className="animate-pulse space-y-6">
        <div className="h-10 w-48 bg-stone-200 rounded" />
        <div className="h-12 bg-stone-200 rounded-2xl" />
        <div className="space-y-3">
          {[...Array(5)].map((_, i) => (
            <div key={i} className="h-20 bg-stone-200 rounded-xl" />
          ))}
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6 animate-fadeIn">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <h1 className="text-2xl md:text-3xl font-serif font-bold text-stone-800">
            Semester Grades
          </h1>
          <p className="text-stone-500 mt-1">
            Enter your grades for each subject to calculate SGPA
          </p>
        </div>
      </div>

      {/* Semester Selector */}
      <div className="flex flex-wrap items-center gap-3">
        <span className="text-sm font-medium text-stone-600">Select Semester:</span>
        <div className="flex flex-wrap gap-2">
          {[1, 2, 3, 4, 5, 6, 7, 8].map((sem) => (
            <button
              key={sem}
              onClick={() => setSelectedSem(sem)}
              className={`px-4 py-2 rounded-xl text-sm font-medium transition-all ${
                selectedSem === sem
                  ? 'bg-gradient-to-r from-amber-900 to-amber-800 text-white shadow-md'
                  : 'bg-white text-stone-600 border border-stone-200 hover:border-amber-300'
              }`}
            >
              Sem {sem}
            </button>
          ))}
        </div>
      </div>

      {/* Stats Bar */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div className="bg-white rounded-xl p-4 border border-stone-200">
          <p className="text-stone-500 text-xs font-medium">SGPA</p>
          <p className="text-2xl font-bold text-stone-800">{sgpa.toFixed(2)}</p>
        </div>
        <div className="bg-white rounded-xl p-4 border border-stone-200">
          <p className="text-stone-500 text-xs font-medium">Total Credits</p>
          <p className="text-2xl font-bold text-stone-800">{totalCredits}</p>
        </div>
        <div className="bg-white rounded-xl p-4 border border-stone-200">
          <p className="text-stone-500 text-xs font-medium">Earned Credits</p>
          <p className="text-2xl font-bold text-stone-800">{earnedCredits}</p>
        </div>
        <div className="bg-white rounded-xl p-4 border border-stone-200">
          <p className="text-stone-500 text-xs font-medium">Subjects Graded</p>
          <p className="text-2xl font-bold text-stone-800">{gradedCount}/{allSubjects.length}</p>
        </div>
      </div>

      {/* Arrear Subjects Section */}
      {arrearSubjects.length > 0 && (
        <div className="bg-gradient-to-br from-red-50 to-orange-50 rounded-2xl border border-red-200 overflow-hidden">
          <div className="p-4 md:p-5 border-b border-red-100 bg-red-100/50">
            <div className="flex items-center gap-3">
              <AlertTriangle className="w-5 h-5 text-red-600" />
              <div>
                <h3 className="font-semibold text-stone-800">Arrear Subjects</h3>
                <p className="text-sm text-stone-500">Clear your pending arrears from previous semesters</p>
              </div>
            </div>
          </div>
          <div className="divide-y divide-red-100">
            {arrearSubjects.map((subject) => {
              const isSaving = saving === subject.id;
              const hasError = highlightError === subject.id;
              const justSaved = savedSuccessfully === subject.id;

              return (
                <div
                  key={subject.id}
                  className={`p-4 md:p-5 flex flex-col md:flex-row md:items-center gap-4 transition-colors ${
                    hasError ? 'bg-red-100' : justSaved ? 'bg-green-50' : 'hover:bg-red-50/50'
                  }`}
                >
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="text-xs font-mono text-stone-400 bg-stone-100 px-2 py-0.5 rounded">
                        {subject.subject_code}
                      </span>
                      <span className="text-xs font-medium text-red-600 bg-red-100 px-2 py-0.5 rounded">
                        Arrear (Sem {subject.original_semester})
                      </span>
                    </div>
                    <p className="text-stone-800 font-medium mt-1 truncate">
                      {subject.subject_name}
                    </p>
                  </div>

                  <div className="flex items-center gap-4">
                    <div className="text-center">
                      <p className="text-xs text-stone-400">Credits</p>
                      <p className="text-lg font-bold text-stone-700">{subject.credits}</p>
                    </div>

                    <div className="relative">
                      <select
                        value={subject.grade || ''}
                        onChange={(e) => handleGradeChange(subject.id, e.target.value, true)}
                        disabled={isSaving}
                        className={`appearance-none px-4 py-2.5 pr-10 rounded-xl border text-sm font-medium outline-none transition-all cursor-pointer ${
                          subject.grade
                            ? 'border-amber-300 bg-amber-50 text-amber-900'
                            : 'border-stone-200 bg-stone-50 text-stone-500'
                        } ${isSaving ? 'opacity-50' : ''}`}
                      >
                        <option value="" disabled>Select Grade</option>
                        {GRADES.map((grade) => (
                          <option key={grade} value={grade}>
                            {grade} ({GRADE_POINTS[grade] === null ? '-' : GRADE_POINTS[grade]})
                          </option>
                        ))}
                      </select>
                      <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400 pointer-events-none" />

                      {isSaving && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          <div className="w-4 h-4 border-2 border-amber-600/30 border-t-amber-600 rounded-full animate-spin" />
                        </div>
                      )}

                      {justSaved && !isSaving && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          <Check className="w-4 h-4 text-green-600" />
                        </div>
                      )}

                      {hasError && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          <AlertCircle className="w-4 h-4 text-red-600" />
                        </div>
                      )}
                    </div>

                    {subject.grade_id && (
                      <button
                        onClick={() => handleDeleteGrade(subject.grade_id!, subject.id)}
                        className="p-2 rounded-lg text-stone-400 hover:text-red-600 hover:bg-red-50 transition-colors"
                        title="Remove grade"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Regular Subjects Table */}
      <div className="bg-white rounded-2xl border border-stone-200 overflow-hidden">
        <div className="p-4 md:p-6 border-b border-stone-100">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <BookOpen className="w-5 h-5 text-amber-700" />
              <h3 className="font-semibold text-stone-800">Semester {selectedSem} Subjects</h3>
            </div>
            <div className="flex gap-2">
              {selectedSem > 1 && (
                <div className="relative">
                  <button
                    onClick={() => setShowArrearDropdown(!showArrearDropdown)}
                    className="flex items-center gap-2 px-4 py-2 rounded-lg bg-red-50 text-red-700 text-sm font-medium hover:bg-red-100 transition-colors"
                  >
                    <AlertTriangle className="w-4 h-4" />
                    Add Arrear
                  </button>
                </div>
              )}
              <button
                onClick={() => setShowAddSubject(!showAddSubject)}
                className="flex items-center gap-2 px-4 py-2 rounded-lg bg-amber-50 text-amber-800 text-sm font-medium hover:bg-amber-100 transition-colors"
              >
                <Plus className="w-4 h-4" />
                Add Subject
              </button>
            </div>
          </div>

          {/* Add Subject Form */}
          {showAddSubject && (
            <div className="mt-4 p-4 bg-stone-50 rounded-xl border border-stone-200">
              <div className="grid grid-cols-1 md:grid-cols-4 gap-3">
                <input
                  type="text"
                  placeholder="Subject Code"
                  value={newSubject.code}
                  onChange={(e) => setNewSubject(prev => ({ ...prev, code: e.target.value }))}
                  className="px-3 py-2 rounded-lg border border-stone-200 focus:border-amber-600 focus:ring-1 focus:ring-amber-600 outline-none text-sm"
                />
                <input
                  type="text"
                  placeholder="Subject Name"
                  value={newSubject.name}
                  onChange={(e) => setNewSubject(prev => ({ ...prev, name: e.target.value }))}
                  className="px-3 py-2 rounded-lg border border-stone-200 focus:border-amber-600 focus:ring-1 focus:ring-amber-600 outline-none text-sm md:col-span-2"
                />
                <div className="flex gap-2">
                  <input
                    type="number"
                    placeholder="Credits"
                    value={newSubject.credits}
                    onChange={(e) => setNewSubject(prev => ({ ...prev, credits: parseInt(e.target.value) || 3 }))}
                    className="px-3 py-2 rounded-lg border border-stone-200 focus:border-amber-600 focus:ring-1 focus:ring-amber-600 outline-none text-sm w-20"
                    min={1}
                    max={6}
                  />
                  <label className="flex items-center gap-1 text-sm text-stone-600">
                    <input
                      type="checkbox"
                      checked={newSubject.isElective}
                      onChange={(e) => setNewSubject(prev => ({ ...prev, isElective: e.target.checked }))}
                      className="rounded border-stone-300"
                    />
                    Elective
                  </label>
                  <button
                    onClick={handleAddCustomSubject}
                    className="px-4 py-2 rounded-lg bg-amber-800 text-white text-sm font-medium hover:bg-amber-700"
                  >
                    Add
                  </button>
                  <button
                    onClick={() => {
                      setShowAddSubject(false);
                      setNewSubject({ code: '', name: '', credits: 3, isElective: false });
                    }}
                    className="p-2 rounded-lg text-stone-500 hover:bg-stone-200"
                  >
                    <X className="w-4 h-4" />
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>

        {/* Subject List */}
        <div className="divide-y divide-stone-100">
          {subjects.length === 0 && customSubjects.length === 0 ? (
            <div className="p-8 text-center text-stone-400">
              <BookOpen className="w-12 h-12 mx-auto mb-3 opacity-50" />
              <p>No subjects found for Semester {selectedSem}</p>
            </div>
          ) : (
            [...subjects, ...customSubjects].map((subject) => {
              const isSaving = saving === subject.id;
              const hasError = highlightError === subject.id;
              const justSaved = savedSuccessfully === subject.id;

              return (
                <div
                  key={subject.id}
                  className={`p-4 md:p-5 flex flex-col md:flex-row md:items-center gap-4 transition-colors ${
                    hasError ? 'bg-red-50' : justSaved ? 'bg-green-50' : 'hover:bg-stone-50'
                  }`}
                >
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="text-xs font-mono text-stone-400 bg-stone-100 px-2 py-0.5 rounded">
                        {subject.subject_code}
                      </span>
                      {subject.is_elective && (
                        <span className="text-xs font-medium text-amber-700 bg-amber-50 px-2 py-0.5 rounded">
                          Elective
                        </span>
                      )}
                    </div>
                    <p className="text-stone-800 font-medium mt-1 truncate">
                      {subject.subject_name}
                    </p>
                  </div>

                  <div className="flex items-center gap-4">
                    <div className="text-center">
                      <p className="text-xs text-stone-400">Credits</p>
                      <p className="text-lg font-bold text-stone-700">{subject.credits}</p>
                    </div>

                    <div className="relative">
                      <select
                        value={subject.grade || ''}
                        onChange={(e) => handleGradeChange(subject.id, e.target.value, false)}
                        disabled={isSaving}
                        className={`appearance-none px-4 py-2.5 pr-10 rounded-xl border text-sm font-medium outline-none transition-all cursor-pointer ${
                          subject.grade
                            ? 'border-amber-300 bg-amber-50 text-amber-900'
                            : 'border-stone-200 bg-stone-50 text-stone-500'
                        } ${isSaving ? 'opacity-50' : ''}`}
                      >
                        <option value="" disabled>Select Grade</option>
                        {GRADES.map((grade) => (
                          <option key={grade} value={grade}>
                            {grade} ({GRADE_POINTS[grade] === null ? '-' : GRADE_POINTS[grade]})
                          </option>
                        ))}
                      </select>
                      <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400 pointer-events-none" />

                      {isSaving && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          <div className="w-4 h-4 border-2 border-amber-600/30 border-t-amber-600 rounded-full animate-spin" />
                        </div>
                      )}

                      {justSaved && !isSaving && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          <Check className="w-4 h-4 text-green-600" />
                        </div>
                      )}

                      {hasError && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          <AlertCircle className="w-4 h-4 text-red-600" />
                        </div>
                      )}
                    </div>

                    {subject.grade_id && (
                      <button
                        onClick={() => handleDeleteGrade(subject.grade_id!, subject.id)}
                        className="p-2 rounded-lg text-stone-400 hover:text-red-600 hover:bg-red-50 transition-colors"
                        title="Remove grade"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    )}
                  </div>
                </div>
              );
            })
          )}
        </div>
      </div>

      {/* Grade Legend */}
      <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-2xl p-6 border border-amber-200">
        <h4 className="font-semibold text-stone-800 mb-3">Grade Point Reference</h4>
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-8 gap-3">
          {GRADES.map((grade) => (
            <div
              key={grade}
              className="bg-white rounded-lg p-3 text-center border border-amber-100"
            >
              <p className="text-2xl font-bold text-amber-900">{grade}</p>
              <p className="text-sm text-stone-500">{GRADE_POINTS[grade] === null ? '-' : `${GRADE_POINTS[grade]} points`}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
