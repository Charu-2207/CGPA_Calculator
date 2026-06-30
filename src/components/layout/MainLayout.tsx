import { useState } from 'react';
import { Outlet, NavLink, useLocation } from 'react-router-dom';
import { useAuthContext } from './AuthProvider';
import {
  LayoutDashboard,
  BookOpen,
  BarChart3,
  History,
  LogOut,
  Menu,
  X,
  User,
  GraduationCap,
} from 'lucide-react';

const navItems = [
  { to: '/dashboard', label: 'Dashboard', icon: LayoutDashboard },
  { to: '/semester', label: 'Semester', icon: BookOpen },
  { to: '/analytics', label: 'Analytics', icon: BarChart3 },
  { to: '/history', label: 'History', icon: History },
];

export function MainLayout() {
  const { student, signOut } = useAuthContext();
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const location = useLocation();

  const handleSignOut = async () => {
    await signOut();
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-stone-100 via-amber-50/30 to-orange-50/20">
      {/* Mobile Header */}
      <header className="lg:hidden sticky top-0 z-50 bg-white/80 backdrop-blur-md border-b border-stone-200">
        <div className="flex items-center justify-between px-4 py-3">
          <button
            onClick={() => setSidebarOpen(true)}
            className="p-2 rounded-lg hover:bg-stone-100 transition-colors"
          >
            <Menu className="w-6 h-6 text-stone-700" />
          </button>
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-amber-900 to-amber-800 flex items-center justify-center">
              <BookOpen className="w-4 h-4 text-amber-50" />
            </div>
            <span className="font-serif font-bold text-stone-800">CGPA Track</span>
          </div>
          <div className="w-10" />
        </div>
      </header>

      {/* Mobile Sidebar Overlay */}
      {sidebarOpen && (
        <div
          className="lg:hidden fixed inset-0 z-50 bg-stone-900/20 backdrop-blur-sm"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside
        className={`fixed top-0 left-0 z-50 h-full w-72 bg-white border-r border-stone-200 transform transition-transform duration-300 ease-out lg:translate-x-0 lg:z-30 ${
          sidebarOpen ? 'translate-x-0' : '-translate-x-full'
        }`}
      >
        <div className="flex flex-col h-full">
          {/* Logo */}
          <div className="p-6 border-b border-stone-100">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-amber-900 to-amber-800 flex items-center justify-center shadow-lg shadow-amber-900/20">
                  <GraduationCap className="w-5 h-5 text-amber-50" />
                </div>
                <div>
                  <h1 className="font-serif font-bold text-stone-800">CGPA Track</h1>
                  <p className="text-xs text-stone-500">Academic Analytics</p>
                </div>
              </div>
              <button
                onClick={() => setSidebarOpen(false)}
                className="lg:hidden p-2 rounded-lg hover:bg-stone-100"
              >
                <X className="w-5 h-5 text-stone-500" />
              </button>
            </div>
          </div>

          {/* User Info */}
          <div className="p-4 mx-4 mt-4 rounded-xl bg-gradient-to-br from-stone-50 to-amber-50/50 border border-stone-100">
            <div className="flex items-center gap-3">
              <div className="w-12 h-12 rounded-full bg-gradient-to-br from-amber-700 to-amber-600 flex items-center justify-center shadow-md">
                <User className="w-6 h-6 text-white" />
              </div>
              <div className="flex-1 min-w-0">
                <p className="font-semibold text-stone-800 truncate">{student?.student_name}</p>
                <p className="text-sm text-stone-500 truncate">{student?.register_number}</p>
                <p className="text-xs text-amber-800 font-medium">{student?.department}</p>
              </div>
            </div>
          </div>

          {/* Navigation */}
          <nav className="flex-1 p-4 space-y-1 overflow-y-auto">
            {navItems.map((item) => {
              const Icon = item.icon;
              const isActive = location.pathname === item.to;

              return (
                <NavLink
                  key={item.to}
                  to={item.to}
                  onClick={() => setSidebarOpen(false)}
                  className={`flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-200 ${
                    isActive
                      ? 'bg-gradient-to-r from-amber-900 to-amber-800 text-white shadow-lg shadow-amber-900/20'
                      : 'text-stone-600 hover:bg-stone-50 hover:text-stone-800'
                  }`}
                >
                  <Icon className="w-5 h-5" />
                  <span className="font-medium">{item.label}</span>
                </NavLink>
              );
            })}
          </nav>

          {/* Sign Out */}
          <div className="p-4 border-t border-stone-100">
            <button
              onClick={handleSignOut}
              className="flex items-center gap-3 px-4 py-3 w-full rounded-xl text-stone-600 hover:bg-red-50 hover:text-red-700 transition-colors"
            >
              <LogOut className="w-5 h-5" />
              <span className="font-medium">Sign Out</span>
            </button>
          </div>
        </div>
      </aside>

      {/* Main Content */}
      <main className="lg:ml-72 min-h-screen">
        <div className="p-4 lg:p-8">
          <Outlet />
        </div>
      </main>
    </div>
  );
}
