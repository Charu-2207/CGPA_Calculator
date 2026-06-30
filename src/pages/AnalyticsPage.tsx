import { useEffect, useState } from 'react';
import { useAuthContext } from '../components/layout/AuthProvider';
import { useCgpaData } from '../hooks/useCgpaData';
import { getDepartmentStats } from '../services/database';
import type { DepartmentStats } from '../types';
import { calculateRankPercentile } from '../utils/calculations';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  ComposedChart,
  Cell,
} from 'recharts';
import {
  TrendingUp,
  Trophy,
  Award,
  ArrowUpRight,
  ArrowDownRight,
} from 'lucide-react';

export function AnalyticsPage() {
  const { student } = useAuthContext();
  const { semesterData, cgpa, loading, loadData } = useCgpaData();
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

  const topperCgpa = deptStats.reduce((max, s) => Math.max(max, s.top_score || 0), 0);
  const percentile = calculateRankPercentile(cgpa, avgDeptCgpa);

  const comparisonData = semesterData.map((sem) => {
    const dept = deptStats.find(d => d.semester_number === sem.semester_number);
    return {
      name: `Sem ${sem.semester_number}`,
      student: sem.sgpa,
      avg: dept?.average_sgpa || 0,
      top: dept?.top_score || 10,
    };
  });

  const trendData = semesterData.map((sem) => {
    const deptAvg = deptStats.find(d => d.semester_number === sem.semester_number)?.average_sgpa || 0;
    return {
      name: `Sem ${sem.semester_number}`,
      student: sem.sgpa,
      deptAvg,
      diff: sem.sgpa - deptAvg,
    };
  });

  const isAboveAverage = cgpa >= avgDeptCgpa;
  const rank = Math.max(1, Math.round((100 - percentile) / 100 * (deptStats[0]?.student_count || 50)));

  if (loading) {
    return (
      <div className="animate-pulse space-y-6">
        <div className="h-8 w-48 bg-stone-200 rounded" />
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="h-40 bg-stone-200 rounded-2xl" />
          ))}
        </div>
        <div className="h-96 bg-stone-200 rounded-2xl" />
      </div>
    );
  }

  return (
    <div className="space-y-6 animate-fadeIn">
      {/* Header */}
      <div>
        <h1 className="text-2xl md:text-3xl font-serif font-bold text-stone-800">
          Department Analytics
        </h1>
        <p className="text-stone-500 mt-1">
          Compare your performance with {student?.department} department averages
        </p>
      </div>

      {/* Summary Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className={`rounded-2xl p-6 ${isAboveAverage ? 'bg-gradient-to-br from-emerald-500 to-emerald-600' : 'bg-gradient-to-br from-orange-500 to-orange-600'} text-white shadow-xl`}>
          <div className="flex items-start justify-between">
            <div>
              <p className="text-white/80 text-sm font-medium mb-1">
                {isAboveAverage ? 'Above Average!' : 'Below Average'}
              </p>
              <p className="text-4xl font-bold">{cgpa.toFixed(2)}</p>
              <div className="flex items-center gap-2 mt-2">
                {isAboveAverage ? (
                  <ArrowUpRight className="w-5 h-5" />
                ) : (
                  <ArrowDownRight className="w-5 h-5" />
                )}
                <span className="text-white/90">
                  {Math.abs(cgpa - avgDeptCgpa).toFixed(2)} from avg
                </span>
              </div>
            </div>
            <div className="w-12 h-12 rounded-xl bg-white/20 flex items-center justify-center">
              <TrendingUp className="w-6 h-6" />
            </div>
          </div>
        </div>

        <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-stone-500 text-sm font-medium mb-1">Estimated Rank</p>
              <p className="text-4xl font-bold text-stone-800">#{rank}</p>
              <p className="text-sm text-stone-400 mt-2">
                Out of ~{deptStats[0]?.student_count || 50} students
              </p>
            </div>
            <div className="w-12 h-12 rounded-xl bg-amber-50 flex items-center justify-center">
              <Trophy className="w-6 h-6 text-amber-700" />
            </div>
          </div>
        </div>

        <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-stone-500 text-sm font-medium mb-1">Top Score</p>
              <p className="text-4xl font-bold text-stone-800">{topperCgpa.toFixed(2)}</p>
              <p className="text-sm text-stone-400 mt-2">
                {student?.department} department topper
              </p>
            </div>
            <div className="w-12 h-12 rounded-xl bg-purple-50 flex items-center justify-center">
              <Award className="w-6 h-6 text-purple-700" />
            </div>
          </div>
        </div>
      </div>

      {/* Comparison Chart */}
      <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h3 className="font-semibold text-stone-800">SGPA vs Department Average</h3>
            <p className="text-sm text-stone-500">Your performance compared to department benchmarks</p>
          </div>
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-amber-700" />
              <span className="text-sm text-stone-600">Your SGPA</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-stone-300" />
              <span className="text-sm text-stone-600">Dept. Avg</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-emerald-300" />
              <span className="text-sm text-stone-600">Top Score</span>
            </div>
          </div>
        </div>

        {comparisonData.length > 0 ? (
          <div className="h-80">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={comparisonData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
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
                  cursor={{ fill: 'rgba(120, 113, 108, 0.1)' }}
                />
                <Bar dataKey="top" fill="#bbf7d0" radius={[6, 6, 0, 0]} maxBarSize={30} />
                <Bar dataKey="avg" fill="#d6d3d1" radius={[6, 6, 0, 0]} maxBarSize={30} />
                <Bar dataKey="student" fill="#92400e" radius={[6, 6, 0, 0]} maxBarSize={30} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        ) : (
          <div className="h-64 flex items-center justify-center text-stone-400">
            <p>Add semester grades to see analytics</p>
          </div>
        )}
      </div>

      {/* Performance Difference */}
      <div className="bg-white rounded-2xl p-6 border border-stone-200 shadow-sm">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h3 className="font-semibold text-stone-800">Performance Gap</h3>
            <p className="text-sm text-stone-500">Difference from department average (positive = above avg)</p>
          </div>
        </div>

        {trendData.length > 0 ? (
          <div className="h-48">
            <ResponsiveContainer width="100%" height="100%">
              <ComposedChart data={trendData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" vertical={false} />
                <XAxis
                  dataKey="name"
                  axisLine={false}
                  tickLine={false}
                  tick={{ fill: '#78716c', fontSize: 12 }}
                />
                <YAxis
                  axisLine={false}
                  tickLine={false}
                  tick={{ fill: '#78716c', fontSize: 12 }}
                  tickFormatter={(value: number) => (value >= 0 ? `+${value}` : `${value}`)}
                />
                <Tooltip
                  contentStyle={{
                    backgroundColor: '#fff',
                    border: '1px solid #e7e5e4',
                    borderRadius: '12px',
                    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
                  }}
                  formatter={(value) => {
                    const num = value as number;
                    return [num >= 0 ? `+${num.toFixed(2)}` : num.toFixed(2), 'Gap'];
                  }}
                />
                <Bar dataKey="diff" maxBarSize={40}>
                  {trendData.map((entry, index) => (
                    <Cell
                      key={`cell-${index}`}
                      fill={entry.diff >= 0 ? '#059669' : '#ea580c'}
                    />
                  ))}
                </Bar>
              </ComposedChart>
            </ResponsiveContainer>
          </div>
        ) : (
          <div className="h-48 flex items-center justify-center text-stone-400">
            <p>No data available</p>
          </div>
        )}
      </div>

      {/* Percentile Gauge */}
      <div className="bg-gradient-to-br from-stone-800 to-stone-700 rounded-2xl p-8 text-white">
        <div className="flex flex-col md:flex-row items-center gap-8">
          <div className="flex-1">
            <h3 className="font-semibold text-amber-200 text-sm mb-2">Department Percentile</h3>
            <p className="text-6xl font-bold mb-4">{percentile}th</p>
            <p className="text-stone-300">
              You are performing better than {percentile}% of students in the {student?.department} department
            </p>
          </div>
          <div className="flex-1">
            <div className="bg-white/10 rounded-xl p-6">
              <div className="flex items-center justify-between mb-3">
                <span className="text-sm text-stone-300">Your CGPA</span>
                <span className="font-bold">{cgpa.toFixed(2)}</span>
              </div>
              <div className="flex items-center justify-between mb-3">
                <span className="text-sm text-stone-300">Dept Average</span>
                <span className="font-semibold">{avgDeptCgpa.toFixed(2)}</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-sm text-stone-300">Top Score</span>
                <span className="text-amber-300 font-semibold">{topperCgpa.toFixed(2)}</span>
              </div>
              <div className="mt-4 h-2 rounded-full bg-white/10 overflow-hidden">
                <div
                  className="h-full bg-gradient-to-r from-amber-400 to-amber-600 rounded-full transition-all duration-500"
                  style={{ width: `${(cgpa / 10) * 100}%` }}
                />
              </div>
              <div className="flex justify-between mt-2 text-xs text-stone-400">
                <span>0</span>
                <span>10</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
