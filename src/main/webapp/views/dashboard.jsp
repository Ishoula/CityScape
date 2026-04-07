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
        <aside class="w-64 bg-gray-900 h-screen sticky top-0 text-white p-6">
            <h1 class="text-2xl font-bold mb-10 text-blue-400">CityScape Admin</h1>
            <nav class="space-y-4">
                <a href="#" class="block py-2.5 px-4 rounded bg-blue-600">Dashboard</a>
                <a href="${pageContext.request.contextPath}/admin/landmarks/add" class="block py-2.5 px-4 rounded hover:bg-gray-800 transition">Add Landmark</a>
                <a href="${pageContext.request.contextPath}/admin/logout" class="block py-2.5 px-4 rounded text-red-400 hover:bg-red-900/20">Logout</a>
            </nav>
        </aside>

        <main class="flex-1 p-8">
            <div class="flex justify-between items-center mb-8">
                <h2 class="text-3xl font-bold text-gray-800">Landmarks Management</h2>
                <a href="<c:url value='landmark/admin/newLandmark'"
                   class="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded-lg font-bold shadow-lg transition">
                    <i class="fa-solid fa-plus mr-2"></i>Add New Landmark
                </a>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-blue-500">
                    <p class="text-sm text-gray-500 uppercase font-bold">Total Landmarks</p>
                    <p class="text-2xl font-black">${landmarks.size()}</p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-sm overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-gray-50 border-b">
                        <tr>
                            <th class="px-6 py-4 text-sm font-semibold text-gray-600">Name</th>
                            <th class="px-6 py-4 text-sm font-semibold text-gray-600">Location</th>
                            <th class="px-6 py-4 text-sm font-semibold text-gray-600">Price</th>
                            <th class="px-6 py-4 text-sm font-semibold text-gray-600 text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <c:forEach var="landmark" items="${landmarks}">
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-6 py-4 font-medium text-gray-900">${landmark.name}</td>
                                <td class="px-6 py-4 text-gray-600">${landmark.location}</td>
                                <td class="px-6 py-4 text-blue-600 font-bold">$${landmark.price}</td>
                                <td class="px-6 py-4 text-right">
                                    <button class="text-gray-400 hover:text-blue-600 mr-3"><i class="fa-solid fa-pen-to-square"></i></button>
                                    <button class="text-gray-400 hover:text-red-600"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

</body>
</html>