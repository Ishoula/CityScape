<div class="max-w-2xl mx-auto bg-white p-8 rounded-2xl shadow-lg mt-10">
    <h2 class="text-2xl font-bold mb-6 text-gray-800 border-b pb-4">Create New Destination</h2>

    <form action="${pageContext.request.contextPath}/admin/landmarks/save" method="POST" class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700">Landmark Name</label>
                <input type="text" name="name" required class="w-full mt-1 p-2 border rounded-lg">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Location</label>
                <input type="text" name="location" required class="w-full mt-1 p-2 border rounded-lg">
            </div>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Image URL</label>
            <input type="url" name="imageUrl" class="w-full mt-1 p-2 border rounded-lg" placeholder="https://unsplash.com/...">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Price (USD)</label>
            <input type="number" name="price" step="0.01" class="w-full mt-1 p-2 border rounded-lg">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Description</label>
            <textarea name="description" rows="4" class="w-full mt-1 p-2 border rounded-lg"></textarea>
        </div>

        <div class="flex justify-end space-x-4 pt-4">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="px-6 py-2 text-gray-500">Cancel</a>
            <button type="submit" class="bg-blue-600 text-white px-8 py-2 rounded-lg font-bold hover:bg-blue-700 transition">
                Save Landmark
            </button>
        </div>
    </form>
</div>