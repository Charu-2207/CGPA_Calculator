import {
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Area,
  ComposedChart,
  Line,
} from 'recharts';
import type { SemesterData, DepartmentStats } from '../../types';

interface CgpaTrendChartProps {
  semesterData: SemesterData[];
  deptStats: DepartmentStats[];
}

export function CgpaTrendChart({ semesterData, deptStats }: CgpaTrendChartProps) {
  const data = semesterData.map((sem) => ({
    name: `Sem ${sem.semester_number}`,
    cgpa: sem.sgpa,
    deptAvg: deptStats.find(d => d.semester_number === sem.semester_number)?.average_sgpa || 0,
  }));

  if (data.length === 0) {
    return (
      <div className="h-64 flex items-center justify-center text-stone-400">
        <p>Add semester grades to see your CGPA trend</p>
      </div>
    );
  }

  return (
    <div className="h-64">
      <ResponsiveContainer width="100%" height="100%">
        <ComposedChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
          <defs>
            <linearGradient id="colorCgpa" x1="0" y1="0" x2="0" y2="1">
              <stop offset="5%" stopColor="#92400e" stopOpacity={0.2} />
              <stop offset="95%" stopColor="#92400e" stopOpacity={0} />
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
            dataKey="cgpa"
            stroke="#92400e"
            strokeWidth={3}
            fill="url(#colorCgpa)"
          />
          <Line
            type="monotone"
            dataKey="deptAvg"
            stroke="#d6d3d1"
            strokeWidth={2}
            strokeDasharray="5 5"
            dot={false}
          />
        </ComposedChart>
      </ResponsiveContainer>
    </div>
  );
}
