import { useEffect, useState } from 'react';
import { useAuthContext } from '../components/layout/AuthProvider';
import { useCgpaData } from '../hooks/useCgpaData';
import { getStudentGrades, getSubjects } from '../services/database';
import type { Grade, Subject } from '../types';
import {
  History as HistoryIcon,
  Clock,
  TrendingUp,
  TrendingDown,
  Calendar,
  ChevronDown,
  ChevronUp,
} from 'lucide-react';
import {
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Area,
  ComposedChart,
  ReferenceLine,
} from 'recharts';

interface SemesterGroup {
  semester_number: number;
  grades: (Grade & { subject?: Subject })[];
  sgpa: number;
  totalCredits: number;
}

export function HistoryPage() {
  const { student } = useAuthContext();
  const { semesterData, cgpa, loading, loadData } = useCgpaData();
  const [expandedSemester, setExpandedSemester] = useState<number | null>(null);
  const [semesterGroups, setSemesterGroups] = useState<SemesterGroup[]>([]);

  useEffect(() => {
    if (student) {
      loadData(student.id, student.department);
      loadGradeHistory();
    }
  }, [student]);

  const loadGradeHistory = async () => {
    if (!student) return;

    try {
      const grades = await getStudentGrades(student.id);

      // Get all subjects for reference
      const allSubjects: Subject[] = [];
      for (let sem = 1; sem <= 8; sem++) {
        const semSubjects = await getSubjects(sem, student.department);
        allSubjects.push(...semSubjects);
      }

      const cache = new Map(allSubjects.map(s => [s.id, s]));

      // Group by semester
      const groups: Map<number, (Grade & { subject?: Subject })[]> = new Map();
      grades.forEach(grade => {
        const existing = groups.get(grade.semester_number) || [];
        existing.push({
          ...grade,
          subject: cache.get(grade.subject_id),
        });
        groups.set(grade.semester_number, existing);
      });

      const semesterGroupArray: SemesterGroup[] = Array.from(groups.entries())
        .map(([sem, gradeList]) => {
          const totalCreds = gradeList.reduce((sum, g) => sum + g.credits, 0);
          const totalPoints = gradeList.reduce((sum, g) => sum + (g.grade_point * g.credits), 0);
          const sgpa = totalCreds > 0 ? totalPoints / totalCreds : 0;

          return {
            semester_number: sem,
            grades: gradeList.sort((a, b) => {
              const aCode = a.subject?.subject_code || '';
              const bCode = b.subject?.subject_code || '';
              return aCode.localeCompare(bCode);
            }),
            sgpa,
            totalCredits: totalCreds,
          };
        })
        .sort((a, b) => a.semester_number - b.semester_number);

      setSemesterGroups(semesterGroupArray);
    } catch (error) {
      console.error('Failed to load history:', error);
    }
  };

  const toggleSemester = (sem: number) => {
    setExpandedSemester(prev => prev === sem ? null : sem);
  };

  const trendData = semesterGroups.map((sem) => ({
    name: `Sem ${sem.semester_number}`,
    sgpa: sem.sgpa,
    cgpa: semesterData.find(s => s.semester_number === sem.semester_number)?.sgpa || sem.sgpa,
  }));

  if (loading) {
    return (
      <div className="animate-pulse space-y-6">
        <div className="h-8 w-48 bg-stone-200 rounded" />
        <div className="h-64 bg-stone-200 rounded-2xl" />
        <div className="space-y-4">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="h-24 bg-stone-200 rounded-xl" />
          ))}
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6 animate-fadeIn">
      {/* Header */}
      <div>
        <h1 className="text-2xl md:text-3xl font-serif font-bold text-stone-800">
          Academic History
        </h1>
        <p className="text-stone-500 mt-1">
          Track your semester-wise performance and grade records
        </p>
      </div>

      {/* Summary */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div className="bg-gradient-to-br from-amber-900 to-amber-800 rounded-2xl p-6 text-white">
          <p className="text-amber-200 text-sm font-medium mb-1">Current CGPA</p>
          <p className="text-3xl font-bold">{cgpa.toFixed(2)}</p>
        </div>
        <div className="bg-white rounded-2xl p-6 border border-stone-200">
          <p className="text-stone-500 text-sm font-medium mb-1">Semesters</p>
          <p className="text-3xl font-bold text-stone-800">{semesterGroups.length}</p>
        </div>
        <div className="bg-white rounded-2xl p-6 border border-stone-200">
          <p className="text-stone-500 text-sm font-medium mb-1">Total Subjects</p>
          <p className="text-3xl font-bold text-stone-800">
            {semesterGroups.reduce((sum, g) => sum + g.grades.length, 0)}
          </p>
        </div>
        <div className="bg-white rounded-2xl p-6 border border-stone-200">
          <p className="text-stone-500 text-sm font-medium mb-1">Best SGPA</p>
          <p className="text-3xl font-bold text-emerald-600">
            {semesterGroups.length > 0
              ? Math.max(...semesterGroups.map(g => g.sgpa)).toFixed(2)
              : '0.00'}
          </p>
        </div>
      </div>

      {/* Progress Chart */}
      {semesterGroups.length > 0 && (
        <div className="bg-white rounded-2xl p-6 border border-stone-200">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h3 className="font-semibold text-stone-800">SGPA Progression</h3>
              <p className="text-sm text-stone-500">View your performance trend over semesters</p>
            </div>
          </div>
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <ComposedChart data={trendData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                <defs>
                  <linearGradient id="colorHistory" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="5%" stopColor="#059669" stopOpacity={0.2} />
                    <stop offset="95%" stopColor="#059669" stopOpacity={0} />
                  </linearGradient>
                </defs>
                <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" vertical={false} />
                <XAxis
                  dataKey="name"
                  axisLine={false}
                  tickLine={false}
                  tick={{ fill: '#78716c', fontSize: 12 }}
                />
                <YAxis
                  domain={[0, 10]}
                  axisLine={false}
                  tickLine={false}
                  tick={{ fill: '#78716c', fontSize: 12 }}
                />
                <Tooltip
                  contentStyle={{
                    backgroundColor: '#fff',
                    border: '1px solid #e7e5e4',
                    borderRadius: '12px',
                    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                  }}
                  formatter={(value) => [(value as number).toFixed(2), '']}
                />
                <Area
                  type="monotone"
                  dataKey="sgpa"
                  stroke="#059669"
                  strokeWidth={3}
                  fill="url(#colorHistory)"
                />
                <ReferenceLine y={8} stroke="#d97706" strokeDasharray="5 5" />
                <ReferenceLine y={7} stroke="#78716c" strokeDasharray="3 3" />
              </ComposedChart>
            </ResponsiveContainer>
          </div>
        </div>
      )}

      {/* Semester Details */}
      <div className="space-y-4">
        <h3 className="font-semibold text-stone-800 flex items-center gap-2">
          <HistoryIcon className="w-5 h-5 text-amber-700" />
          Semester Details
        </h3>

        {semesterGroups.length === 0 ? (
          <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-2xl p-8 border border-amber-200 text-center">
            <Clock className="w-12 h-12 mx-auto mb-3 text-amber-600" />
            <p className="text-stone-600">No grade history yet. Add semester grades to see your history.</p>
          </div>
        ) : (
          semesterGroups.map((group) => {
            const isExpanded = expandedSemester === group.semester_number;
            const prevSgpa = semesterGroups.find(g => g.semester_number === group.semester_number - 1)?.sgpa;
            const improved = prevSgpa ? group.sgpa > prevSgpa : false;

            return (
              <div
                key={group.semester_number}
                className="bg-white rounded-2xl border border-stone-200 overflow-hidden shadow-sm"
              >
                {/* Header */}
                <button
                  onClick={() => toggleSemester(group.semester_number)}
                  className="w-full p-5 flex items-center justify-between hover:bg-stone-50 transition-colors"
                >
                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-xl bg-amber-50 flex items-center justify-center">
                      <Calendar className="w-5 h-5 text-amber-700" />
                    </div>
                    <div className="text-left">
                      <h4 className="font-semibold text-stone-800">Semester {group.semester_number}</h4>
                      <p className="text-sm text-stone-500">
                        {group.grades.length} subjects | {group.totalCredits} credits
                      </p>
                    </div>
                  </div>

                  <div className="flex items-center gap-4">
                    <div className="text-right">
                      <p className="text-2xl font-bold text-stone-800">{group.sgpa.toFixed(2)}</p>
                      <div className="flex items-center gap-1 justify-end">
                        {improved ? (
                          <TrendingUp className="w-4 h-4 text-emerald-600" />
                        ) : prevSgpa ? (
                          <TrendingDown className="w-4 h-4 text-red-500" />
                        ) : null}
                        <span className={`text-xs ${improved ? 'text-emerald-600' : 'text-red-500'}`}>
                          {prevSgpa ? `${(group.sgpa - prevSgpa).toFixed(2)}` : ''}
                        </span>
                      </div>
                    </div>
                    {isExpanded ? (
                      <ChevronUp className="w-5 h-5 text-stone-400" />
                    ) : (
                      <ChevronDown className="w-5 h-5 text-stone-400" />
                    )}
                  </div>
                </button>

                {/* Expanded Content */}
                {isExpanded && (
                  <div className="border-t border-stone-100 divide-y divide-stone-100">
                    {group.grades.map((grade) => (
                      <div
                        key={grade.id}
                        className="p-4 md:px-6 flex items-center justify-between gap-4 hover:bg-stone-50/50"
                      >
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2">
                            <span className="text-xs font-mono text-stone-400 bg-stone-100 px-2 py-0.5 rounded">
                              {grade.subject?.subject_code || grade.subject_id.slice(0, 8)}
                            </span>
                            {grade.subject?.is_elective && (
                              <span className="text-xs text-amber-700 bg-amber-50 px-1.5 py-0.5 rounded">
                                Elective
                              </span>
                            )}
                            {grade.is_arrear && (
                              <span className="text-xs text-red-600 bg-red-50 px-1.5 py-0.5 rounded">
                                Arrear
                              </span>
                            )}
                          </div>
                          <p className="text-stone-800 font-medium mt-1 truncate">
                            {grade.subject?.subject_name || 'Unknown Subject'}
                          </p>
                        </div>

                        <div className="flex items-center gap-4">
                          <div className="text-center">
                            <p className="text-xs text-stone-400">Credits</p>
                            <p className="font-semibold text-stone-700">{grade.credits}</p>
                          </div>
                          <div className={`w-14 h-14 rounded-xl flex items-center justify-center ${
                            grade.grade === 'RA' || grade.grade === 'AB'
                              ? 'bg-red-100 text-red-700'
                              : grade.grade === 'O'
                              ? 'bg-emerald-100 text-emerald-700'
                              : 'bg-amber-100 text-amber-800'
                          }`}>
                            <p className="text-xl font-bold">{grade.grade}</p>
                          </div>
                          <div className="text-center">
                            <p className="text-xs text-stone-400">Points</p>
                            <p className="font-semibold text-stone-700">{grade.grade_point}</p>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            );
          })
        )}
      </div>
    </div>
  );
}
