import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { useAuthContext } from '../components/layout/AuthProvider';
import { BookOpen, Lock, User, Hash, Building2, Calendar, ArrowRight, GraduationCap } from 'lucide-react';

const DEPARTMENTS = ['AIDS', 'AIML', 'BME', 'CIVIL', 'CSE', 'ECE', 'EEE', 'IT', 'MECH', 'MDE'];
const BATCH_YEARS = [2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028];

export function SignupPage() {
  const [form, setForm] = useState({
    registerNumber: '',
    name: '',
    password: '',
    confirmPassword: '',
    department: 'CSE',
    batchYear: 2024,
  });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const { signUp } = useAuthContext();
  const navigate = useNavigate();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    setForm(prev => ({
      ...prev,
      [e.target.name]: e.target.value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    if (form.password !== form.confirmPassword) {
      setError('Passwords do not match');
      setLoading(false);
      return;
    }

    if (form.password.length < 6) {
      setError('Password must be at least 6 characters');
      setLoading(false);
      return;
    }

    const result = await signUp(form.registerNumber, form.password, {
      name: form.name,
      department: form.department,
      batch_year: parseInt(form.batchYear.toString()),
    });

    if (result.success) {
      navigate('/dashboard');
    } else {
      setError(result.error || 'Failed to create account');
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen flex">
      {/* Left side - Illustration */}
      <div className="hidden lg:flex lg:w-1/2 bg-gradient-to-br from-stone-800 via-stone-700 to-amber-900 relative overflow-hidden">
        <div className="absolute inset-0 opacity-20">
          <div className="absolute top-20 left-20 w-72 h-72 bg-amber-500/30 rounded-full blur-3xl" />
          <div className="absolute bottom-20 right-20 w-96 h-96 bg-orange-400/20 rounded-full blur-3xl" />
          <div className="absolute top-1/2 left-1/3 w-64 h-64 bg-stone-500/30 rounded-full blur-3xl" />
        </div>

        <div className="relative z-10 flex flex-col justify-center items-center w-full p-12 text-amber-50">
          <div className="text-center mb-8">
            <div className="inline-flex items-center justify-center w-24 h-24 rounded-2xl bg-amber-900/30 backdrop-blur-sm border border-amber-500/20 mb-6">
              <GraduationCap className="w-12 h-12" />
            </div>
            <h2 className="text-4xl font-serif font-bold mb-3">
              Join Our Community
            </h2>
            <p className="text-amber-100/80 text-lg max-w-md">
              Begin tracking your academic progress with precision and style
            </p>
          </div>

          <div className="w-full max-w-sm space-y-4 mt-8">
            {[
              'Track SGPA & CGPA in real-time',
              'Compare with department averages',
              'Visualize your academic growth',
              'Plan your semester courses',
            ].map((item, idx) => (
              <div
                key={idx}
                className="flex items-center gap-3 bg-white/5 backdrop-blur-sm rounded-xl p-4 border border-white/10"
              >
                <div className="w-2 h-2 rounded-full bg-amber-400" />
                <span className="text-amber-50/90">{item}</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Right side - Signup Form */}
      <div className="flex-1 flex items-center justify-center p-8 bg-gradient-to-br from-amber-50 via-orange-50 to-stone-100 overflow-y-auto">
        <div className="w-full max-w-md">
          <div className="text-center mb-8">
            <div className="inline-flex items-center justify-center w-16 h-16 rounded-xl bg-gradient-to-br from-amber-900 to-amber-800 mb-6 shadow-lg">
              <BookOpen className="w-8 h-8 text-amber-50" />
            </div>
            <h1 className="text-3xl font-serif font-bold text-stone-800">
              Create Account
            </h1>
            <p className="text-stone-500 mt-2">
              Start your academic analytics journey
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-5">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-stone-700 mb-1.5">
                  Register Number
                </label>
                <div className="relative">
                  <Hash className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                  <input
                    type="text"
                    name="registerNumber"
                    value={form.registerNumber}
                    onChange={handleChange}
                    placeholder="21CS101"
                    required
                    className="w-full pl-10 pr-3 py-2.5 rounded-lg border border-stone-200 bg-white/80 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 outline-none transition-all text-stone-800 placeholder-stone-400 text-sm"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-stone-700 mb-1.5">
                  Batch Year
                </label>
                <div className="relative">
                  <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                  <select
                    name="batchYear"
                    value={form.batchYear}
                    onChange={handleChange}
                    className="w-full pl-10 pr-3 py-2.5 rounded-lg border border-stone-200 bg-white/80 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 outline-none transition-all text-stone-800 text-sm appearance-none cursor-pointer"
                  >
                    {BATCH_YEARS.map(year => (
                      <option key={year} value={year}>{year}</option>
                    ))}
                  </select>
                </div>
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-stone-700 mb-1.5">
                Full Name
              </label>
              <div className="relative">
                <User className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                <input
                  type="text"
                  name="name"
                  value={form.name}
                  onChange={handleChange}
                  placeholder="Your full name"
                  required
                  className="w-full pl-10 pr-3 py-2.5 rounded-lg border border-stone-200 bg-white/80 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 outline-none transition-all text-stone-800 placeholder-stone-400 text-sm"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-stone-700 mb-1.5">
                Department
              </label>
              <div className="relative">
                <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                <select
                  name="department"
                  value={form.department}
                  onChange={handleChange}
                  className="w-full pl-10 pr-3 py-2.5 rounded-lg border border-stone-200 bg-white/80 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 outline-none transition-all text-stone-800 text-sm appearance-none cursor-pointer"
                >
                  {DEPARTMENTS.map(dept => (
                    <option key={dept} value={dept}>{dept}</option>
                  ))}
                </select>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-stone-700 mb-1.5">
                  Password
                </label>
                <div className="relative">
                  <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                  <input
                    type="password"
                    name="password"
                    value={form.password}
                    onChange={handleChange}
                    placeholder="Min 6 chars"
                    required
                    className="w-full pl-10 pr-3 py-2.5 rounded-lg border border-stone-200 bg-white/80 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 outline-none transition-all text-stone-800 placeholder-stone-400 text-sm"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-stone-700 mb-1.5">
                  Confirm Password
                </label>
                <div className="relative">
                  <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-stone-400" />
                  <input
                    type="password"
                    name="confirmPassword"
                    value={form.confirmPassword}
                    onChange={handleChange}
                    placeholder="Confirm"
                    required
                    className="w-full pl-10 pr-3 py-2.5 rounded-lg border border-stone-200 bg-white/80 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 outline-none transition-all text-stone-800 placeholder-stone-400 text-sm"
                  />
                </div>
              </div>
            </div>

            {error && (
              <div className="p-3 rounded-lg bg-red-50 border border-red-100 text-red-700 text-sm">
                {error}
              </div>
            )}

            <button
              type="submit"
              disabled={loading}
              className="w-full py-3.5 px-6 rounded-xl bg-gradient-to-r from-stone-800 to-stone-700 text-amber-50 font-semibold shadow-lg hover:from-stone-700 hover:to-stone-600 disabled:opacity-50 flex items-center justify-center gap-2 transition-all"
            >
              {loading ? (
                <>
                  <div className="w-5 h-5 border-2 border-amber-100/30 border-t-amber-100 rounded-full animate-spin" />
                  Creating Account...
                </>
              ) : (
                <>
                  Create Account
                  <ArrowRight className="w-5 h-5" />
                </>
              )}
            </button>
          </form>

          <div className="mt-6 text-center">
            <p className="text-stone-500 text-sm">
              Already have an account?{' '}
              <Link
                to="/login"
                className="text-amber-800 font-semibold hover:text-amber-700 transition-colors"
              >
                Sign In
              </Link>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
