import { useEffect, useState } from 'react';
import { useAuthContext } from '../components/layout/AuthProvider';
import { useCgpaData } from '../hooks/useCgpaData';
import { getDepartmentStats } from '../services/database';
import type { DepartmentStats } from '../types';
import { calculateRankPercentile } from '../utils/calculations';
import { CgpaTrendChart } from '../components/charts/CgpaTrendChart';
import { SgpaBarChart } from '../components/charts/SgpaBarChart';
import { CreditPieChart } from '../components/charts/CreditPieChart';
import {
  Award,
  BookOpen,
  TrendingUp,
  Users,
  Target,
  Calendar,
  ArrowUpRight,
  Sparkles,
} from 'lucide-react';

export function DashboardPage() {
  const { student } = useAuthContext();
  const { semesterData, cgpa, totalCredits, completedSemesters, loadData, loading } = useCgpaData();
  const [deptStats, setDeptStats] = useState<DepartmentStats[]>([]);

  useEffect(() => {
    if (student) {
      loadData(student.id, student.department);
      getDepartmentStats(student.department).then(setDeptStats);
    }
  }, [student, loadData]);

  const avgDeptCgpa = deptStats.length > 0
    ? deptStats.reduce((sum, s) => sum + (s.average_cgpa || 0), 0) / deptStats.length
    : 0;

  const percentile = calculateRankPercentile(cgpa, avgDeptCgpa);

  const currentSemester = student?.batch_year
    ? Math.min(8, new Date().getFullYear() - student.batch_year + 1)
    : 1;

  if (loading) {
    return (
      <div className="animate-pulse space-y-6">
        <div className="h-8 w-48 bg-stone-200 rounded" />
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="h-32 bg-stone-200 rounded-2xl" />
          ))}
        </div>
        <div className="h-96 bg-stone-200 rounded-2xl" />
      </div>
    );
  }

  return (
    <div className="space-y-6 animate-fadeIn">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <h1 className="text-2xl md:text-3xl font-serif font-bold text-stone-800">
            Welcome back, {student?.student_name?.split(' ')[0]}!
          </h1>
          <p className="text-stone-500 mt-1">
            Track your academic progress for {student?.department} - Batch {student?.batch_year}
          </p>
        </div>
        <div className="flex items-center gap-2 px-4 py-2 rounded-xl bg-amber-50 border border-amber-200">
          <Calendar className="w-4 h-4 text-amber-700" />
          <span className="text-sm font-medium text-amber-800">Semester {currentSemester}</span>
        </div>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {/* CGPA Card */}
        <div className="bg-gradient-to-br from-stone-800 to-stone-700 rounded-2xl p-6 text-white shadow-xl shadow-stone-900/20">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-stone-300 text-sm font-medium mb-1">Current CGPA</p>
              <p className="text-4xl font-bold">{cgpa.toFixed(2)}</p>
              <div className="flex items-center gap-1 mt-2 text-amber-300">
                <ArrowUpRight className="w-4 h-4" />
                <span className="text-sm">
                  {completedSemesters > 0 ? 'Above target' : 'Start tracking'}
                </span>
              </div>
            </div>
            <div className="w-12 h-12 rounded-xl bg-white/10 flex items-center justify-center">
              <Award className="w-6 h-6 text-amber-300" />
            </div>
          </div>
        </div>

        {/* Credits Card */}
        <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-stone-500 text-sm font-medium mb-1">Earned Credits</p>
              <p className="text-3xl font-bold text-stone-800">{totalCredits}</p>
              <p className="text-sm text-stone-400 mt-2">
                {completedSemesters} semesters
              </p>
            </div>
            <div className="w-12 h-12 rounded-xl bg-amber-50 flex items-center justify-center">
              <BookOpen className="w-6 h-6 text-amber-700" />
            </div>
          </div>
        </div>

        {/* Department Average */}
        <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-stone-500 text-sm font-medium mb-1">Dept. Average</p>
              <p className="text-3xl font-bold text-stone-800">{avgDeptCgpa.toFixed(2)}</p>
              <p className="text-sm text-stone-400 mt-2">
                {student?.department} CGPA
              </p>
            </div>
            <div className="w-12 h-12 rounded-xl bg-emerald-50 flex items-center justify-center">
              <Users className="w-6 h-6 text-emerald-700" />
            </div>
          </div>
        </div>

        {/* Percentile */}
        <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-stone-500 text-sm font-medium mb-1">Percentile</p>
              <p className="text-3xl font-bold text-stone-800">{percentile}th</p>
              <p className="text-sm text-stone-400 mt-2">
                In your department
              </p>
            </div>
            <div className="w-12 h-12 rounded-xl bg-orange-50 flex items-center justify-center">
              <Target className="w-6 h-6 text-orange-700" />
            </div>
          </div>
        </div>
      </div>

      {/* Charts Row */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* CGPA Trend */}
        <div className="lg:col-span-2 bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h3 className="font-semibold text-stone-800">CGPA Trend</h3>
              <p className="text-sm text-stone-500">Your academic journey</p>
            </div>
            <div className="flex items-center gap-1 px-3 py-1 rounded-lg bg-emerald-50 text-emerald-700 text-sm">
              <TrendingUp className="w-4 h-4" />
              <span>Progress</span>
            </div>
          </div>
          <CgpaTrendChart semesterData={semesterData} deptStats={deptStats} />
        </div>

        {/* Credit Distribution */}
        <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h3 className="font-semibold text-stone-800">Credit Summary</h3>
              <p className="text-sm text-stone-500">Total earned: {totalCredits}</p>
            </div>
          </div>
          <CreditPieChart semesterData={semesterData} />
        </div>
      </div>

      {/* SGPA Bar Chart */}
      <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h3 className="font-semibold text-stone-800">Semester-wise SGPA</h3>
            <p className="text-sm text-stone-500">Compare your performance across semesters</p>
          </div>
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-amber-600" />
              <span className="text-sm text-stone-600">Your SGPA</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-stone-300" />
              <span className="text-sm text-stone-600">Dept. Avg</span>
            </div>
          </div>
        </div>
        <SgpaBarChart semesterData={semesterData} deptStats={deptStats} />
      </div>

      {/* Quick Actions */}
      {semesterData.length === 0 && (
        <div className="bg-gradient-to-br from-amber-50 to-orange-50 rounded-2xl p-8 border border-amber-200 text-center">
          <div className="w-16 h-16 rounded-2xl bg-amber-100 flex items-center justify-center mx-auto mb-4">
            <Sparkles className="w-8 h-8 text-amber-700" />
          </div>
          <h3 className="font-semibold text-stone-800 mb-2">Start Your Journey</h3>
          <p className="text-stone-600 mb-4">
            Add your semester grades to see your CGPA analytics
          </p>
          <a
            href="/semester"
            className="inline-flex items-center gap-2 px-6 py-3 rounded-xl bg-amber-900 text-white font-semibold hover:bg-amber-800 transition-colors"
          >
            Add Grades
            <ArrowUpRight className="w-4 h-4" />
          </a>
        </div>
      )}
    </div>
  );
}
