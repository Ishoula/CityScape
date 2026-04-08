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
    <style>
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
</head>
<body class="bg-gray-50 font-sans">

    <%-- Navigation --%>
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

                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <div class="flex items-center space-x-4 border-l pl-4 border-gray-200">
                                <span class="text-gray-800 font-medium">
                                    Admin: <span class="text-blue-600">${sessionScope.user.firstName}</span>
                                </span>
                                <a href="<c:url value='/admin/logout'/>"
                                   class="px-3 py-1 bg-red-50 text-red-500 rounded-md text-xs font-bold hover:bg-red-500 hover:text-white transition">
                                   LOGOUT
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

    <%-- Hero Section --%>
    <header class="relative h-[500px] flex items-center justify-center text-white">
        <div class="absolute inset-0 z-0">
            <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=1500&q=80"
                 class="w-full h-full object-cover brightness-50" alt="Mountain Landscape">
        </div>

        <div class="relative z-10 text-center px-4">
            <h1 class="text-5xl md:text-6xl font-extrabold mb-4 drop-shadow-lg">Discover the World</h1>
            <p class="text-lg md:text-xl mb-8 max-w-xl mx-auto opacity-90">Manage and explore breathtaking landscapes and curated travel experiences from your central dashboard.</p>
            <div class="flex justify-center space-x-4">
                <a href="#explore" class="bg-blue-600 hover:bg-blue-700 text-white px-10 py-3 rounded-full text-lg font-bold transition transform hover:scale-105 shadow-xl">
                    Explore Destinations
                </a>
                <c:if test="${not empty sessionScope.user}">
                    <a href="<c:url value='/landmark/newLandmark'/>" class="bg-white text-blue-600 hover:bg-gray-100 px-10 py-3 rounded-full text-lg font-bold transition transform hover:scale-105 shadow-xl">
                        Add New
                    </a>
                </c:if>
            </div>
        </div>
    </header>

    <%-- Main Content: Dynamic Landmark Grid --%>
    <section id="explore" class="max-w-7xl mx-auto py-16 px-4">
        <div class="flex justify-between items-end mb-12 border-b pb-4">
            <div>
                <h2 class="text-3xl font-bold text-gray-900">Landmark Catalog</h2>
                <div class="h-1 w-12 bg-blue-600 mt-2"></div>
            </div>
            <p class="text-gray-500 italic">
                <c:out value="${landmarks.size() > 0 ? landmarks.size() : '0'}" /> destinations found
            </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">
            <c:choose>
                <c:when test="${not empty landmarks}">
                    <c:forEach var="landmark" items="${landmarks}">
                        <div class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-2xl transition-all duration-300 flex flex-col h-full">
                            <%-- Image Container --%>
                            <div class="h-56 overflow-hidden relative">
                                <%-- Note: We use the mapped path /cityScape/uploads/ followed by the filename from the DB --%>
                                <img src="<c:url value='/uploads/${landmark.imagePath}'/>"
                                     alt="${landmark.name}"
                                     class="w-full h-full object-cover hover:scale-110 transition duration-700">

                                <div class="absolute top-4 right-4 bg-white/90 backdrop-blur px-3 py-1 rounded-full shadow-sm">
                                    <span class="text-blue-600 font-bold text-sm">${landmark.category}</span>
                                </div>
                            </div>

                            <%-- Card Content --%>
                            <div class="p-6 flex flex-col flex-grow">
                                <div class="mb-2">
                                    <h3 class="text-xl font-bold text-gray-800 capitalize">${landmark.name}</h3>
                                    <span class="text-xs text-gray-400 flex items-center mt-1">
                                        <i class="fa-solid fa-location-dot mr-1"></i> ${landmark.latitude}
                                        <i class="fa-solid fa-location-dot mr-1"></i> ${landmark.longitude}
                                    </span>
                                </div>

                                <p class="text-gray-600 text-sm mt-2 mb-6 line-clamp-2">
                                    ${landmark.description}
                                </p>

                                <%-- Footer/Actions --%>
                                <div class="mt-auto pt-4 border-t border-gray-100 flex justify-between items-center">
                                    <span class="text-xs font-bold text-green-500 uppercase tracking-widest">Active</span>

                                    <%-- Admin Controls --%>
                                    <c:if test="${not empty sessionScope.user}">
                                        <div class="flex space-x-3">
                                            <a href="<c:url value='/landmark/editLandmark?id=${landmark.id}'/>"
                                               class="text-gray-400 hover:text-blue-600 transition" title="Edit">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </a>
                                            <a href="<c:url value='/landmark/deleteLandmark?id=${landmark.id}'/>"
                                               class="text-gray-400 hover:text-red-500 transition"
                                               onclick="return confirm('Are you sure you want to delete this landmark?')"
                                               title="Delete">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>

                <%-- No Landmarks Available --%>
                <c:otherwise>
                    <div class="col-span-full py-20 flex flex-col items-center justify-center text-center bg-white rounded-2xl border-2 border-dashed border-gray-200">
                        <div class="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mb-4">
                            <i class="fa-solid fa-earth-africa text-3xl text-gray-300"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-900">No destinations yet</h3>
                        <p class="text-gray-500 mt-2">The catalog is currently empty. Check back later or add new entries.</p>
                        <c:if test="${not empty sessionScope.user}">
                            <a href="<c:url value='/admin/add-landmark'/>" class="mt-6 text-blue-600 font-bold hover:underline">
                                + Add your first landmark
                            </a>
                        </c:if>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <footer class="bg-gray-900 text-white py-12">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex flex-col md:flex-row justify-between items-center">
                <div class="text-2xl font-bold text-white mb-4 md:mb-0">
                    <i class="fa-solid fa-map-location-dot mr-2"></i>CityScape
                </div>
                <p class="text-gray-500 text-sm">&copy; 2026 CityScape Admin. Internal Use Only.</p>
            </div>
        </div>
    </footer>

</body>
</html>