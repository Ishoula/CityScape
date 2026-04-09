<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | CityScape</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-100">

    <div class="flex">
        <aside class="w-64 bg-gray-900 h-screen sticky top-0 text-white p-6 shadow-2xl">
            <h1 class="text-2xl font-bold mb-10 text-blue-400 flex items-center">
                <i class="fa-solid fa-city mr-3"></i>CityScape
            </h1>
            <nav class="space-y-4">
                <a href="<c:url value='/landmark/listLandmarks'/>" class="block py-2.5 px-4 rounded bg-blue-600 shadow-lg">
                    <i class="fa-solid fa-gauge mr-2"></i>Dashboard
                </a>
                <a href="<c:url value='/landmark/newLandmark'/>" class="block py-2.5 px-4 rounded hover:bg-gray-800 transition">
                    <i class="fa-solid fa-plus-circle mr-2"></i>Add Landmark
                </a>
                <div class="border-t border-gray-700 my-4"></div>
                <a href="<c:url value='/admin/logout'/>" class="block py-2.5 px-4 rounded text-red-400 hover:bg-red-900/20 transition">
                    <i class="fa-solid fa-right-from-bracket mr-2"></i>Logout
                </a>
            </nav>
        </aside>

        <main class="flex-1 p-8">
            <div class="flex justify-between items-center mb-8">
                <div>
                    <h2 class="text-3xl font-bold text-gray-800">Landmarks Management</h2>
                    <p class="text-gray-500">Manage your city's destinations and attractions.</p>
                </div>
                <a href="<c:url value='/landmark/newLandmark'/>"
                   class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-xl font-bold shadow-lg transition transform hover:-translate-y-1">
                    <i class="fa-solid fa-plus mr-2"></i>Add New Landmark
                </a>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                <div class="bg-white p-6 rounded-2xl shadow-sm border-l-8 border-blue-500">
                    <div class="flex items-center">
                        <div class="p-3 bg-blue-100 rounded-lg text-blue-600 mr-4">
                            <i class="fa-solid fa-map-location-dot fa-xl"></i>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 uppercase font-bold tracking-wider">Total Landmarks</p>
                            <p class="text-3xl font-black text-gray-800">${landmarks.size()}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-2xl shadow-sm overflow-hidden border border-gray-100">
                <table class="w-full text-left">
                    <thead class="bg-gray-50 border-b">
                        <tr>
                            <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase">Preview</th>
                            <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase">Landmark Details</th>
                            <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase">Category</th>
                            <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase">Location</th>
                            <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <c:forEach var="landmark" items="${landmarks}">
                            <tr class="hover:bg-blue-50/30 transition">
                                <td class="px-6 py-4">
                                    <img src="<c:url value='/uploads/${landmark.imageName}'/>"
                                         alt="Landmark"
                                         class="w-12 h-12 rounded-lg object-cover border border-gray-200 shadow-sm"
                                         onerror="this.src='https://via.placeholder.com/50?text=No+Image'">
                                </td>

                                <td class="px-6 py-4">
                                    <div class="font-bold text-gray-900">${landmark.name}</div>
                                    <div class="text-xs text-gray-400 truncate w-48">${landmark.description}</div>
                                </td>

                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-600">
                                        ${landmark.category}
                                    </span>
                                </td>

                                <td class="px-6 py-4">
                                    <div class="text-sm text-gray-700">${landmark.address.city}, ${landmark.address.province}</div>
                                    <div class="text-xs text-gray-400 italic">${landmark.address.latitude}, ${landmark.address.longitude}</div>
                                </td>

                                <td class="px-6 py-4 text-right space-x-2">
                                    <a href="<c:url value='/landmark/editLandmark?id=${landmark.id}'/>"
                                       class="inline-block p-2 text-gray-400 hover:text-blue-600 hover:bg-blue-100 rounded-lg transition"
                                       title="Edit Landmark">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>

                                    <a href="<c:url value='/landmark/deleteLandmark?id=${landmark.id}'/>"
                                       onclick="return confirm('Are you sure you want to delete this landmark?');"
                                       class="inline-block p-2 text-gray-400 hover:text-red-600 hover:bg-red-100 rounded-lg transition"
                                       title="Delete Landmark">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <c:if test="${empty landmarks}">
                    <div class="p-20 text-center">
                        <i class="fa-regular fa-folder-open text-gray-300 text-5xl mb-4"></i>
                        <p class="text-gray-500 italic">No landmarks found. Start by adding one!</p>
                    </div>
                </c:if>
            </div>
        </main>
    </div>

</body>
</html>