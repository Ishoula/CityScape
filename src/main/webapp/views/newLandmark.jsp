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
                       placeholder="e.g. Eiffel Tower">
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-semibold text-gray-700">Latitude</label>
                    <input type="number" name="latitude" step="any" required
                           class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                           placeholder="48.8584">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700">Longitude</label>
                    <input type="number" name="longitude" step="any" required
                           class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                           placeholder="2.2945">
                </div>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-700">Category</label>
                <select name="category" required
                        class="w-full mt-1 p-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white">
                    <option value="" disabled selected>Select a category</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.name()}">${category.name()}</option>
                    </c:forEach>
                </select>
                <p class="text-xs text-gray-500 mt-1">Classify this landmark for easier searching.</p>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-700">Landmark Image</label>
                <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-lg hover:border-blue-400 transition-colors">
                    <div class="space-y-1 text-center">
                        <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                            <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                        <div class="flex text-sm text-gray-600">
                            <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-blue-600 hover:text-blue-500">
                                <span>Upload a file</span>
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
                          placeholder="Provide a brief history or details about the location..."></textarea>
            </div>

            <div class="flex justify-end space-x-4 pt-6 border-t">
                <a href="<c:url value='/admin/dashboard'/>"
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
        // Update the label text when a file is selected
        document.getElementById('file-upload').onchange = function() {
            const fileName = this.files[0] ? this.files[0].name : "Upload a file";
            const labelSpan = this.parentElement.querySelector('span');
            labelSpan.textContent = fileName;
            labelSpan.classList.add('text-green-600', 'font-bold');
        };
    </script>

</body>
</html>