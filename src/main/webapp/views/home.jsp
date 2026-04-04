<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Wanderer | Discover the World</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-50 font-sans">

    <nav class="bg-white shadow-lg sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center h-16">
                <div class="flex items-center">
                    <a href="${pageContext.request.contextPath}/admin/" class="text-2xl font-bold text-blue-600">
                        <i class="fa-solid @WebServlet("/admin/*")-map-location-dot mr-2"></i>CityScape
                    </a>
                </div>

                <div class="hidden md:flex items-center space-x-8">
                    <a href="#" class="text-gray-600 hover:text-blue-600 transition">Destinations</a>
                    <a href="#" class="text-gray-600 hover:text-blue-600 transition">Packages</a>
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <span class="text-gray-800 font-medium">Hi, ${sessionScope.user.firstName}!</span>
                            <a href="${pageContext.request.contextPath}/admin/logout" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/admin/login'/>" class="text-gray-600 hover:text-blue-600 font-medium">Login</a>
                            <a href="<c:url value='/admin/register'/>" class="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700 transition">Sign Up</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <header class="relative h-[600px] flex items-center justify-center text-white">
        <div class="absolute inset-0 z-0">
            <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80"
                 class="w-full h-full object-cover brightness-50" alt="Mountain Landscape">
        </div>

        <div class="relative z-10 text-center px-4">
            <h1 class="text-5xl md:text-7xl font-extrabold mb-6 drop-shadow-lg">Adventure Awaits</h1>
            <p class="text-xl md:text-2xl mb-8 max-w-2xl mx-auto">Discover hidden gems and breathtaking landscapes with our curated travel experiences.</p>
            <div class="flex flex-col md:flex-row gap-4 justify-center">
                <a href="${pageContext.request.contextPath}/admin/register" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-full text-lg font-bold transition transform hover:scale-105">Start Planning</a>
                <a href="#explore" class="bg-white/20 backdrop-blur-md border border-white/30 hover:bg-white/30 text-white px-8 py-4 rounded-full text-lg font-bold transition">View Destinations</a>
            </div>
        </div>
    </header>

    <section id="explore" class="max-w-7xl mx-auto py-20 px-4">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold text-gray-900 mb-4">Popular Destinations</h2>
            <div class="h-1 w-20 bg-blue-600 mx-auto"></div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition group">
                <div class="h-64 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1506929113675-b92417b3f17e?auto=format&fit=crop&w=600&q=80"
                         class="w-full h-full object-cover group-hover:scale-110 transition duration-500">
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2">Santorini, Greece</h3>
                    <p class="text-gray-600 mb-4">Experience the iconic blue domes and stunning Mediterranean sunsets.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-blue-600 font-bold text-lg">$1,200</span>
                        <button class="text-sm font-semibold uppercase tracking-wider text-gray-400 hover:text-blue-600">Details <i class="fa-solid fa-arrow-right ml-1"></i></button>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition group">
                <div class="h-64 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?auto=format&fit=crop&w=600&q=80"
                         class="w-full h-full object-cover group-hover:scale-110 transition duration-500">
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2">Kyoto, Japan</h3>
                    <p class="text-gray-600 mb-4">Walk through ancient temples and beautiful cherry blossom gardens.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-blue-600 font-bold text-lg">$1,550</span>
                        <button class="text-sm font-semibold uppercase tracking-wider text-gray-400 hover:text-blue-600">Details <i class="fa-solid fa-arrow-right ml-1"></i></button>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition group">
                <div class="h-64 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?auto=format&fit=crop&w=600&q=80"
                         class="w-full h-full object-cover group-hover:scale-110 transition duration-500">
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2">Bali, Indonesia</h3>
                    <p class="text-gray-600 mb-4">Find peace in tropical forests and pristine white sand beaches.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-blue-600 font-bold text-lg">$980</span>
                        <button class="text-sm font-semibold uppercase tracking-wider text-gray-400 hover:text-blue-600">Details <i class="fa-solid fa-arrow-right ml-1"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-gray-900 text-white py-12 mt-10">
        <div class="max-w-7xl mx-auto px-4 text-center">
            <p class="mb-4 text-gray-400">&copy; 2026 Global CityScape. All rights reserved.</p>
            <div class="flex justify-center space-x-6">
                <a href="#" class="hover:text-blue-500"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#" class="hover:text-blue-500"><i class="fa-brands fa-instagram"></i></a>
                <a href="#" class="hover:text-blue-500"><i class="fa-brands fa-twitter"></i></a>
            </div>
        </div>
    </footer>

</body>
</html>