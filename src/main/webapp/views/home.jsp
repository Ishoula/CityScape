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
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />

    <style>
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        /* Custom height for map containers */
        .map-frame {
            height: 224px;
            width: 100%;
            z-index: 10;
        }
        .card-media-container {
            height: 224px;
            position: relative;
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
                                <span class="text-gray-800 font-medium">Admin: <span class="text-blue-600">${sessionScope.user.firstName}</span></span>
                                <a href="<c:url value='/admin/logout'/>" class="px-3 py-1 bg-red-50 text-red-500 rounded-md text-xs font-bold hover:bg-red-500 hover:text-white transition">LOGOUT</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/admin/login'/>" class="flex items-center space-x-2 text-gray-700 hover:text-blue-600 font-medium transition group">
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
    <header class="relative h-[400px] flex items-center justify-center text-white">
        <div class="absolute inset-0 z-0">
            <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=1500&q=80" class="w-full h-full object-cover brightness-50" alt="Mountain Landscape">
        </div>
        <div class="relative z-10 text-center px-4">
            <h1 class="text-5xl font-extrabold mb-4 drop-shadow-lg">Global Landmarks</h1>
            <p class="text-lg mb-8 max-w-xl mx-auto opacity-90">An interactive dashboard for managing and exploring world-class destinations.</p>
            <c:if test="${not empty sessionScope.user}">
                <a href="<c:url value='/landmark/newLandmark'/>" class="bg-blue-600 hover:bg-blue-700 text-white px-10 py-3 rounded-full text-lg font-bold transition transform hover:scale-105 shadow-xl">
                    Add New Landmark
                </a>
            </c:if>
        </div>
    </header>

    <%-- Main Content --%>
    <section id="explore" class="max-w-7xl mx-auto py-16 px-4">
        <div class="flex justify-between items-end mb-12 border-b pb-4">
            <h2 class="text-3xl font-bold text-gray-900">Landmark Catalog</h2>
            <p class="text-gray-500 italic">${landmarks.size()} locations active</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">
            <c:forEach var="landmark" items="${landmarks}">
                <div class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex flex-col h-full border border-gray-100">

                    <%-- Media Container (Image and Map) --%>
                    <div class="card-media-container overflow-hidden">
                        <img id="img-${landmark.id}"
                             src="<c:url value='/uploads/${landmark.imageName}'/>"
                             class="w-full h-full object-cover transition duration-500"
                             alt="${landmark.name}">

                        <div id="map-${landmark.id}" class="map-frame hidden"></div>

                        <button onclick="toggleMap(${landmark.id}, ${landmark.address.latitude}, ${landmark.address.longitude}, '${landmark.name}')"
                                class="absolute bottom-4 right-4 z-20 bg-white/90 backdrop-blur text-blue-600 p-2 rounded-full shadow-lg hover:bg-blue-600 hover:text-white transition-all">
                            <i class="fa-solid fa-map-location-dot"></i>
                        </button>
                    </div>

                    <%-- Card Details --%>
                    <div class="p-6 flex flex-col flex-grow">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="text-xl font-bold text-gray-800 capitalize">${landmark.name}</h3>
                            <span class="text-[10px] font-black bg-blue-100 text-blue-700 px-2 py-1 rounded uppercase tracking-tighter">${landmark.category}</span>
                        </div>

                        <p class="text-gray-600 text-sm line-clamp-2 mb-6">${landmark.description}</p>

                        <div class="mt-auto pt-4 border-t border-gray-100 flex justify-between items-center">
                            <div class="text-xs text-gray-400">

                                <i class="fa-solid fa-earth-americas mr-1"></i> ${landmark.address.latitude}, ${landmark.address.longitude}
                            </div>

                            <%-- Admin Controls --%>
                            <c:if test="${not empty sessionScope.user}">
                                <div class="flex space-x-3 text-gray-400">
                                    <a href="<c:url value='/landmark/editLandmark?id=${landmark.id}'/>" class="hover:text-blue-600"><i class="fa-solid fa-pen-to-square"></i></a>
                                    <a href="<c:url value='/landmark/deleteLandmark?id=${landmark.id}'/>" onclick="return confirm('Delete this landmark?')" class="hover:text-red-500"><i class="fa-solid fa-trash-can"></i></a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        const activeMaps = {};

        function toggleMap(id, lat, lon, name) {
            const img = document.getElementById('img-' + id);
            const mapDiv = document.getElementById('map-' + id);

            if (mapDiv.classList.contains('hidden')) {
                // Show Map
                img.classList.add('hidden');
                mapDiv.classList.remove('hidden');

                // Initialize map if not already done
                if (!activeMaps[id]) {
                    const map = L.map('map-' + id).setView([lat, lon], 13);
                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; OpenStreetMap'
                    }).addTo(map);
                    L.marker([lat, lon]).addTo(map).bindPopup(name).openPopup();
                    activeMaps[id] = map;
                } else {
                    // Force Leaflet to recalculate size if it was hidden
                    activeMaps[id].invalidateSize();
                }
            } else {
                // Show Image
                img.classList.remove('hidden');
                mapDiv.classList.add('hidden');
            }
        }
    </script>

</body>
</html>