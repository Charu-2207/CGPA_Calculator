import { Navigate, useLocation } from 'react-router-dom';
import { useAuthContext } from './AuthProvider';

interface ProtectedRouteProps {
  children: React.ReactNode;
}

export function ProtectedRoute({ children }: ProtectedRouteProps) {
  const { isAuthenticated, loading, needsOnboarding } = useAuthContext();
  const location = useLocation();

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-amber-50 via-orange-50 to-stone-100">
        <div className="text-center">
          <div className="w-12 h-12 border-4 border-amber-900/20 border-t-amber-900 rounded-full animate-spin mx-auto mb-4" />
          <p className="text-stone-600 font-medium">Loading...</p>
        </div>
      </div>
    );
  }

  if (needsOnboarding) {
    return <Navigate to="/onboarding" state={{ from: location }} replace />;
  }

  if (!isAuthenticated) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  return <>{children}</>;
}
