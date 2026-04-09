<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Edit Landmark</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

    <div class="max-w-2xl mx-auto bg-white p-8 rounded-2xl shadow-lg mt-10 mb-10">
        <div class="flex items-center justify-between mb-6 border-b pb-4">
            <h2 class="text-2xl font-bold text-gray-800">Edit Destination</h2>
            <span class="bg-yellow-100 text-yellow-700 text-xs font-bold px-3 py-1 rounded-full uppercase">Update Mode</span>
        </div>

        <c:choose>
            <c:when test="${not empty landmark}">
                <form action="<c:url value='/landmark/updateLandmark'/>"
                      method="POST"
                      enctype="multipart/form-data"
                      class="space-y-5">

                    <input type="hidden" name="id" value="${landmark.id}">

                    <div>
                        <label class="block text-sm font-semibold text-gray-700">Landmark Name</label>
                        <input type="text" name="name" required
                               value="${landmark.name}"
                               class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700">Category</label>
                        <select name="category" required
                                class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                            <c:forEach items="${categories}" var="cat">
                                <option value="${cat.name()}" ${cat.name() eq landmark.category.name() ? 'selected' : ''}>
                                    ${cat.name()}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="pt-4 border-t">
                        <h3 class="text-lg font-bold text-gray-700 mb-3 text-blue-600">Location Details</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-semibold text-gray-700">Province</label>
                                <select name="province" required
                                        class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                                    <c:forEach items="${provinces}" var="prov">
                                        <option value="${prov.name()}" ${prov.name() eq landmark.address.province.name() ? 'selected' : ''}>
                                            ${prov.name()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-semibold text-gray-700">City</label>
                                <select name="city" required
                                        class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                                    <c:forEach items="${cities}" var="ct">
                                        <option value="${ct.name()}" ${ct.name() eq landmark.address.city.name() ? 'selected' : ''}>
                                            ${ct.name()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="mt-4">
                            <label class="block text-sm font-semibold text-gray-700">Village / Area Name</label>
                            <input type="text" name="village"
                                   value="${landmark.address.village}"
                                   class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                        </div>

                        <div class="grid grid-cols-2 gap-4 mt-4">
                            <div>
                                <label class="block text-sm font-semibold text-gray-700">Latitude</label>
                                <input type="text" name="latitude" required
                                       value="${landmark.address.latitude}"
                                       class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700">Longitude</label>
                                <input type="text" name="longitude" required
                                       value="${landmark.address.longitude}"
                                       class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                            </div>
                        </div>
                    </div>

                    <div class="pt-4 border-t">
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Current Image</label>
                        <div class="flex items-center space-x-4 mb-4">
                            <img src="<c:url value='/uploads/${landmark.imagePath}'/>"
                                 class="w-24 h-24 object-cover rounded-lg border shadow-sm"
                                 onerror="this.src='https://via.placeholder.com/100?text=No+Image'"
                                 alt="Current">
                            <div class="text-xs text-gray-500 italic">
                                <p>Current: ${landmark.imagePath}</p>
                                <p>Upload new to replace.</p>
                            </div>
                        </div>

                        <label class="block text-sm font-semibold text-gray-700">Upload New Image (Optional)</label>
                        <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-lg hover:border-blue-400 transition-colors">
                            <div class="space-y-1 text-center">
                                <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-blue-600 hover:text-blue-500">
                                    <span id="file-label-text">Select new file</span>
                                    <input id="file-upload" name="imageFile" type="file" accept="image/*" class="sr-only">
                                </label>
                            </div>
                        </div>
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700">Description</label>
                        <textarea name="description" rows="4"
                                  class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">${landmark.description}</textarea>
                    </div>

                    <div class="flex justify-end space-x-4 pt-6 border-t">
                        <a href="<c:url value='/landmark/listLandmarks'/>"
                           class="px-6 py-2.5 text-sm font-medium text-gray-600 hover:text-gray-800 transition">
                            Cancel
                        </a>
                        <button type="submit"
                                class="bg-yellow-500 text-white px-8 py-2.5 rounded-lg font-bold hover:bg-yellow-600 shadow-lg transition">
                            Update Landmark
                        </button>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <div class="text-center py-10">
                    <p class="text-red-500 font-bold">Error: Landmark data not found.</p>
                    <a href="<c:url value='/landmark/listLandmarks'/>" class="text-blue-600 underline">Return to Dashboard</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        document.getElementById('file-upload').onchange = function() {
            const fileName = this.files[0] ? this.files[0].name : "Select new file";
            const labelSpan = document.getElementById('file-label-text');
            labelSpan.textContent = fileName;
            labelSpan.classList.add('text-green-600', 'font-bold');
        };
    </script>
</body>
</html>