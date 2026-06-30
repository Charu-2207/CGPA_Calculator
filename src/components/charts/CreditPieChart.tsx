import { PieChart, Pie, Cell, ResponsiveContainer, Tooltip } from 'recharts';
import type { SemesterData } from '../../types';

interface CreditPieChartProps {
  semesterData: SemesterData[];
}

const COLORS = [
  '#92400e',
  '#a16207',
  '#b45309',
  '#d97706',
  '#eab308',
  '#8b5cf6',
  '#6366f1',
  '#3b82f6',
];

export function CreditPieChart({ semesterData }: CreditPieChartProps) {
  const data = semesterData.map((sem) => ({
    name: `Sem ${sem.semester_number}`,
    value: sem.earned_credits,
  }));

  const totalCredits = data.reduce((sum, d) => sum + d.value, 0);

  if (data.length === 0) {
    return (
      <div className="h-48 flex items-center justify-center text-stone-400">
        <p>No credits earned yet</p>
      </div>
    );
  }

  return (
    <div className="h-48 relative">
      <ResponsiveContainer width="100%" height="100%">
        <PieChart>
          <Pie
            data={data}
            innerRadius={50}
            outerRadius={70}
            paddingAngle={3}
            dataKey="value"
          >
            {data.map((_, index) => (
              <Cell
                key={`cell-${index}`}
                fill={COLORS[index % COLORS.length]}
                stroke="none"
              />
            ))}
          </Pie>
          <Tooltip
            contentStyle={{
              backgroundColor: '#fff',
              border: '1px solid #e7e5e4',
              borderRadius: '12px',
              boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
            }}
            formatter={(value) => [`${value} credits`, '']}
          />
        </PieChart>
      </ResponsiveContainer>
      <div className="absolute inset-0 flex items-center justify-center pointer-events-none">
        <div className="text-center">
          <p className="text-2xl font-bold text-stone-800">{totalCredits}</p>
          <p className="text-xs text-stone-500">Total</p>
        </div>
      </div>
    </div>
  );
}
