<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard| CityScape</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex">

    <aside class="w-64 bg-slate-900 text-white hidden md:flex flex-col">
        <div class="p-6">
            <a href="${pageContext.request.contextPath}/admin/" class="text-2xl font-bold text-blue-400">
                <i class="fa-solid fa-map-location-dot mr-2"></i>CityScape
            </a>
        </div>
        <nav class="flex-1 px-4 space-y-2">
            <a href="#" class="block py-2.5 px-4 rounded bg-blue-600 text-white">
                <i class="fa-solid fa-gauge mr-2"></i> Dashboard
            </a>
            <a href="#" class="block py-2.5 px-4 rounded hover:bg-slate-800 transition text-gray-400 hover:text-white">
                <i class="fa-solid fa-suitcase-rolling mr-2"></i> My Bookings
            </a>
            <a href="#" class="block py-2.5 px-4 rounded hover:bg-slate-800 transition text-gray-400 hover:text-white">
                <i class="fa-solid fa-heart mr-2"></i> Wishlist
            </a>
            <a href="#" class="block py-2.5 px-4 rounded hover:bg-slate-800 transition text-gray-400 hover:text-white">
                <i class="fa-solid fa-user-gear mr-2"></i> Settings
            </a>
        </nav>
        <div class="p-4 border-t border-slate-800">
            <a href="${pageContext.request.contextPath}/admin/logout" class="block py-2.5 px-4 rounded text-red-400 hover:bg-red-500/10 transition">
                <i class="fa-solid fa-right-from-bracket mr-2"></i> Logout
            </a>
        </div>
    </aside>

    <main class="flex-1 flex flex-col">
        <header class="bg-white shadow-sm h-16 flex items-center justify-between px-8">
            <h1 class="text-xl font-semibold text-gray-800">Welcome Back, ${sessionScope.user.firstName}!</h1>
            <div class="flex items-center space-x-4">
                <button class="text-gray-500 hover:text-blue-600"><i class="fa-solid fa-bell"></i></button>
                <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-bold">
                    ${sessionScope.user.firstName.charAt(0)}
                </div>
            </div>
        </header>

        <div class="p-8">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-500 uppercase font-bold tracking-wider">Upcoming Trips</p>
                            <h3 class="text-3xl font-bold text-gray-800">02</h3>
                        </div>
                        <div class="bg-blue-100 p-3 rounded-xl text-blue-600"><i class="fa-solid fa-plane-departure fa-xl"></i></div>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-500 uppercase font-bold tracking-wider">Countries Visited</p>
                            <h3 class="text-3xl font-bold text-gray-800">12</h3>
                        </div>
                        <div class="bg-green-100 p-3 rounded-xl text-green-600"><i class="fa-solid fa-earth-americas fa-xl"></i></div>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-500 uppercase font-bold tracking-wider">Reward Points</p>
                            <h3 class="text-3xl font-bold text-gray-800">4,250</h3>
                        </div>
                        <div class="bg-amber-100 p-3 rounded-xl text-amber-600"><i class="fa-solid fa-star fa-xl"></i></div>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    <h2 class="text-lg font-bold text-gray-800 mb-4">Current Trip Status</h2>
                    <div class="relative pl-8 border-l-2 border-blue-200 space-y-8">
                        <div class="relative">
                            <div class="absolute -left-10 mt-1 w-4 h-4 rounded-full bg-blue-600 border-4 border-white shadow-sm"></div>
                            <h4 class="font-bold text-gray-800">Flight to Paris, FR</h4>
                            <p class="text-sm text-gray-500">Boarding starts in 3 hours • Terminal 2</p>
                        </div>
                        <div class="relative">
                            <div class="absolute -left-10 mt-1 w-4 h-4 rounded-full bg-gray-300 border-4 border-white shadow-sm"></div>
                            <h4 class="font-bold text-gray-400">Hotel Check-in</h4>
                            <p class="text-sm text-gray-400">Le Meurice • Tomorrow at 2:00 PM</p>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    <h2 class="text-lg font-bold text-gray-800 mb-4">Account Overview</h2>
                    <div class="space-y-4">
                        <div class="flex justify-between py-2 border-b border-gray-50">
                            <span class="text-gray-500">Full Name</span>
                            <span class="font-medium text-gray-800">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                        </div>
                        <div class="flex justify-between py-2 border-b border-gray-50">
                            <span class="text-gray-500">Email</span>
                            <span class="font-medium text-gray-800">${sessionScope.user.email}</span>
                        </div>
                        <div class="pt-4">
                            <form action="${pageContext.request.contextPath}/admin/delete" method="post" onsubmit="return confirm('Are you sure you want to delete your account?')">
                                <input type="hidden" name="email" value="${sessionScope.user.email}">
                                <button type="submit" class="text-sm text-red-500 hover:text-red-700 font-semibold underline">
                                    Delete My Account
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>