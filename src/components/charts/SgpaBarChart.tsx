import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Cell,
} from 'recharts';
import type { SemesterData, DepartmentStats } from '../../types';

interface SgpaBarChartProps {
  semesterData: SemesterData[];
  deptStats: DepartmentStats[];
}

export function SgpaBarChart({ semesterData, deptStats }: SgpaBarChartProps) {
  const data = semesterData.map((sem) => {
    const deptAvg = deptStats.find(d => d.semester_number === sem.semester_number);
    return {
      name: `Sem ${sem.semester_number}`,
      sgpa: sem.sgpa,
      deptAvg: deptAvg?.average_sgpa || 0,
    };
  });

  if (data.length === 0) {
    return (
      <div className="h-64 flex items-center justify-center text-stone-400">
        <p>Add semester grades to see SGPA comparison</p>
      </div>
    );
  }

  const getBarColor = (sgpa: number, avg: number) => {
    if (sgpa >= avg + 0.5) return '#92400e';
    if (sgpa >= avg) return '#b45309';
    if (sgpa >= avg - 0.5) return '#d97706';
    return '#fbbf24';
  };

  return (
    <div className="h-64">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
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
          <Bar
            dataKey="sgpa"
            radius={[6, 6, 0, 0]}
            maxBarSize={50}
          >
            {data.map((entry, index) => (
              <Cell key={`cell-${index}`} fill={getBarColor(entry.sgpa, entry.deptAvg)} />
            ))}
          </Bar>
          <Bar
            dataKey="deptAvg"
            fill="#d6d3d1"
            radius={[6, 6, 0, 0]}
            maxBarSize={50}
          />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}
