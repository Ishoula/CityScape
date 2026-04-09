<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Add Landmark</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

    <div class="max-w-2xl mx-auto bg-white p-8 rounded-2xl shadow-lg mt-10 mb-10">
        <div class="flex items-center justify-between mb-6 border-b pb-4">
            <h2 class="text-2xl font-bold text-gray-800">Create New Destination</h2>
            <span class="bg-blue-100 text-blue-700 text-xs font-bold px-3 py-1 rounded-full uppercase">Admin Portal</span>
        </div>

        <form action="<c:url value='/landmark/insertLandmark'/>"
              method="POST"
              enctype="multipart/form-data"
              class="space-y-5">

            <div>
                <label class="block text-sm font-semibold text-gray-700">Landmark Name</label>
                <input type="text" name="name" required
                       class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                       placeholder="e.g. Sigiriya Rock">
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-700">Category</label>
                <select name="category" required
                        class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                    <option value="" disabled selected>Select a category</option>
                    <c:forEach items="${categories}" var="cat">
                        <option value="${cat.name()}">${cat.name()}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="pt-4 border-t">
                <h3 class="text-lg font-bold text-gray-700 mb-3">Location Details</h3>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-semibold text-gray-700">Province</label>
                        <select name="province" required
                                class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                            <option value="" disabled selected>Select Province</option>
                            <c:forEach items="${provinces}" var="prov">
                                <option value="${prov.name()}">${prov.name()}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700">City</label>
                        <select name="city" required
                                class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                            <option value="" disabled selected>Select City</option>
                            <c:forEach items="${cities}" var="ct">
                                <option value="${ct.name()}">${ct.name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="mt-4">
                    <label class="block text-sm font-semibold text-gray-700">Village / Area Name</label>
                    <input type="text" name="village"
                           class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                           placeholder="e.g. Dambulla">
                </div>

                <div class="grid grid-cols-2 gap-4 mt-4">
                    <div>
                        <label class="block text-sm font-semibold text-gray-700">Latitude</label>
                        <input type="text" name="latitude" required
                               class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                               placeholder="7.9570">
                    </div>
                    <div>
                        <label class="block text-sm font-semibold text-gray-700">Longitude</label>
                        <input type="text" name="longitude" required
                               class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                               placeholder="80.7603">
                    </div>
                </div>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-700">Landmark Image</label>
                <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-lg hover:border-blue-400 transition-colors">
                    <div class="space-y-1 text-center">
                        <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                            <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                        <div class="flex text-sm text-gray-600">
                            <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-blue-600 hover:text-blue-500">
                                <span id="file-label-text">Upload a file</span>
                                <input id="file-upload" name="imageFile" type="file" accept="image/*" required class="sr-only">
                            </label>
                            <p class="pl-1">or drag and drop</p>
                        </div>
                        <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
                    </div>
                </div>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-700">Description</label>
                <textarea name="description" rows="4"
                          class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                          placeholder="Provide history or details..."></textarea>
            </div>

            <div class="flex justify-end space-x-4 pt-6 border-t">
                <a href="<c:url value='/landmark/listLandmarks'/>"
                   class="px-6 py-2.5 text-sm font-medium text-gray-600 hover:text-gray-800 transition">
                    Cancel
                </a>
                <button type="submit"
                        class="bg-blue-600 text-white px-8 py-2.5 rounded-lg font-bold hover:bg-blue-700 focus:ring-4 focus:ring-blue-200 transition shadow-lg">
                    Save Landmark
                </button>
            </div>
        </form>
    </div>

    <script>
        // Enhanced script to update the label UI when a file is picked
        document.getElementById('file-upload').onchange = function() {
            const fileName = this.files[0] ? this.files[0].name : "Upload a file";
            const labelSpan = document.getElementById('file-label-text');
            labelSpan.textContent = fileName;
            labelSpan.classList.add('text-green-600', 'font-bold');
        };
    </script>

</body>
</html>