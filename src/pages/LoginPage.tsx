import { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { useAuthContext } from '../components/layout/AuthProvider';
import { BookOpen, Lock, ArrowRight, GraduationCap, Hash } from 'lucide-react';

export function LoginPage() {
  const [registerNumber, setRegisterNumber] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const { signIn } = useAuthContext();
  const navigate = useNavigate();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    const result = await signIn(registerNumber, password);
    if (result.success) {
      navigate('/dashboard');
    } else {
      setError(result.error || 'Failed to sign in');
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen flex">
      {/* Left side - Illustration */}
      <div className="hidden lg:flex lg:w-1/2 bg-gradient-to-br from-stone-100 via-amber-50 to-orange-100 relative overflow-hidden">
        <div className="absolute inset-0 opacity-30">
          <div className="absolute top-20 left-20 w-72 h-72 bg-amber-200/50 rounded-full blur-3xl" />
          <div className="absolute bottom-20 right-20 w-96 h-96 bg-orange-200/40 rounded-full blur-3xl" />
          <div className="absolute top-1/2 left-1/3 w-64 h-64 bg-stone-200/50 rounded-full blur-3xl" />
        </div>

        <div className="relative z-10 flex flex-col justify-center items-center w-full p-12">
          <div className="text-center mb-8">
            <div className="inline-flex items-center justify-center w-20 h-20 rounded-2xl bg-gradient-to-br from-amber-900 to-amber-800 shadow-lg shadow-amber-900/20 mb-6">
              <GraduationCap className="w-10 h-10 text-amber-50" />
            </div>
            <h2 className="text-4xl font-serif font-bold text-stone-800 mb-3">
              Academic Excellence
            </h2>
            <p className="text-stone-600 text-lg max-w-md">
              Track your academic journey with precision and insight
            </p>
          </div>

          <div className="grid grid-cols-2 gap-4 max-w-md mt-8">
            {[
              { label: 'CGPA Tracking', desc: 'Real-time calculations' },
              { label: 'Analytics', desc: 'Department comparisons' },
              { label: 'History', desc: 'Semester records' },
              { label: 'Insights', desc: 'Performance trends' },
            ].map((item, idx) => (
              <div
                key={idx}
                className="bg-white/60 backdrop-blur-sm rounded-xl p-4 border border-amber-100/50"
              >
                <p className="font-semibold text-stone-800">{item.label}</p>
                <p className="text-sm text-stone-500">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Right side - Login Form */}
      <div className="flex-1 flex items-center justify-center p-8 bg-white">
        <div className="w-full max-w-md">
          <div className="text-center mb-10">
            <div className="inline-flex items-center justify-center w-16 h-16 rounded-xl bg-gradient-to-br from-stone-800 to-stone-700 mb-6 shadow-lg">
              <BookOpen className="w-8 h-8 text-amber-100" />
            </div>
            <h1 className="text-3xl font-serif font-bold text-stone-800">
              Welcome Back
            </h1>
            <p className="text-stone-500 mt-2">
              Sign in to continue your academic journey
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-stone-700 mb-2">
                Register Number
              </label>
              <div className="relative">
                <Hash className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-stone-400" />
                <input
                  type="text"
                  value={registerNumber}
                  onChange={(e) => setRegisterNumber(e.target.value)}
                  placeholder="21CS101"
                  required
                  className="w-full pl-12 pr-4 py-3.5 rounded-xl border border-stone-200 bg-stone-50/50 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 focus:bg-white outline-none transition-all text-stone-800 placeholder-stone-400"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-stone-700 mb-2">
                Password
              </label>
              <div className="relative">
                <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-stone-400" />
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="Enter your password"
                  required
                  className="w-full pl-12 pr-4 py-3.5 rounded-xl border border-stone-200 bg-stone-50/50 focus:border-amber-700 focus:ring-2 focus:ring-amber-700/10 focus:bg-white outline-none transition-all text-stone-800 placeholder-stone-400"
                />
              </div>
            </div>

            {error && (
              <div className="p-4 rounded-xl bg-red-50 border border-red-100 text-red-700 text-sm">
                {error}
              </div>
            )}

            <button
              type="submit"
              disabled={loading}
              className="w-full py-4 px-6 rounded-xl bg-gradient-to-r from-amber-900 to-amber-800 text-amber-50 font-semibold shadow-lg shadow-amber-900/20 hover:from-amber-800 hover:to-amber-700 disabled:opacity-50 flex items-center justify-center gap-2 transition-all"
            >
              {loading ? (
                <>
                  <div className="w-5 h-5 border-2 border-amber-100/30 border-t-amber-100 rounded-full animate-spin" />
                  Signing in...
                </>
              ) : (
                <>
                  Sign In
                  <ArrowRight className="w-5 h-5" />
                </>
              )}
            </button>
          </form>

          <div className="mt-8 text-center">
            <p className="text-stone-500">
              New student?{' '}
              <Link
                to="/signup"
                className="text-amber-800 font-semibold hover:text-amber-700 transition-colors"
              >
                Create Account
              </Link>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
