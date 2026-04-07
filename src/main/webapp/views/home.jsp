<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CityScape | Admin Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-50 font-sans">

    <nav class="bg-white shadow-lg sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center h-16">
                <div class="flex items-center">
                    <a href="${pageContext.request.contextPath}/" class="text-2xl font-bold text-blue-600">
                        <i class="fa-solid fa-map-location-dot mr-2"></i>CityScape
                    </a>
                </div>

                <div class="hidden md:flex items-center space-x-8">
                    <a href="#explore" class="text-gray-600 hover:text-blue-600 transition">Destinations</a>
                    <a href="#" class="text-gray-600 hover:text-blue-600 transition">Packages</a>

                    <%-- Simplified Admin Access --%>
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <div class="flex items-center space-x-4">
                                <span class="text-gray-800 font-medium border-l pl-4 border-gray-200">
                                    Admin: <span class="text-blue-600">${sessionScope.user.firstName}</span>
                                </span>
                                <a href="<c:url value='/admin/logout'/>"
                                   class="text-sm font-semibold text-red-500 hover:text-red-700 transition">
                                   Logout
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/admin/login'/>"
                               class="flex items-center space-x-2 text-gray-700 hover:text-blue-600 font-medium transition group">
                                <i class="fa-solid fa-user-shield text-gray-400 group-hover:text-blue-600 transition"></i>
                                <span>Admin Portal</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <header class="relative h-[500px] flex items-center justify-center text-white">
        <div class="absolute inset-0 z-0">
            <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=1500&q=80"
                 class="w-full h-full object-cover brightness-50" alt="Mountain Landscape">
        </div>

        <div class="relative z-10 text-center px-4">
            <h1 class="text-5xl md:text-6xl font-extrabold mb-4 drop-shadow-lg">Discover the World</h1>
            <p class="text-lg md:text-xl mb-8 max-w-xl mx-auto opacity-90">Manage and explore breathtaking landscapes and curated travel experiences from your central dashboard.</p>
            <a href="#explore" class="bg-blue-600 hover:bg-blue-700 text-white px-10 py-3 rounded-full text-lg font-bold transition transform hover:scale-105 shadow-xl">
                Explore Destinations
            </a>
        </div>
    </header>

    <%-- Main Content Section --%>
    <section id="explore" class="max-w-7xl mx-auto py-16 px-4">
        <div class="flex justify-between items-end mb-12">
            <div>
                <h2 class="text-3xl font-bold text-gray-900">Popular Destinations</h2>
                <div class="h-1 w-12 bg-blue-600 mt-2"></div>
            </div>
            <p class="text-gray-500 hidden md:block italic">Showing top results for 2026</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-10">
            <div class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-2xl transition-all duration-300">
                <div class="h-56 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1506929113675-b92417b3f17e?auto=format&fit=crop&w=600&q=80"
                         class="w-full h-full object-cover hover:scale-105 transition duration-500">
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold text-gray-800">Santorini, Greece</h3>
                    <p class="text-gray-600 text-sm mt-2 mb-4">Blue domes and Mediterranean sunsets.</p>
                    <div class="flex justify-between items-center pt-4 border-t border-gray-100">
                        <span class="text-blue-600 font-bold">$1,200</span>
                        <span class="text-xs font-bold text-gray-400 uppercase tracking-widest">Available</span>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-2xl transition-all duration-300">
                <div class="h-56 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?auto=format&fit=crop&w=600&q=80"
                         class="w-full h-full object-cover hover:scale-105 transition duration-500">
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold text-gray-800">Kyoto, Japan</h3>
                    <p class="text-gray-600 text-sm mt-2 mb-4">Ancient temples and cherry blossoms.</p>
                    <div class="flex justify-between items-center pt-4 border-t border-gray-100">
                        <span class="text-blue-600 font-bold">$1,550</span>
                        <span class="text-xs font-bold text-gray-400 uppercase tracking-widest">Available</span>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-2xl transition-all duration-300">
                <div class="h-56 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?auto=format&fit=crop&w=600&q=80"
                         class="w-full h-full object-cover hover:scale-105 transition duration-500">
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold text-gray-800">Bali, Indonesia</h3>
                    <p class="text-gray-600 text-sm mt-2 mb-4">Tropical forests and white sands.</p>
                    <div class="flex justify-between items-center pt-4 border-t border-gray-100">
                        <span class="text-blue-600 font-bold">$980</span>
                        <span class="text-xs font-bold text-gray-400 uppercase tracking-widest">Available</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-gray-900 text-white py-10">
        <div class="max-w-7xl mx-auto px-4 text-center">
            <p class="text-gray-500 text-sm">&copy; 2026 CityScape Admin. Internal Use Only.</p>
        </div>
    </footer>

</body>
</html>