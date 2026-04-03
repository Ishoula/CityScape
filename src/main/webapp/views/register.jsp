<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Join the Adventure | Global Wanderer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-cover bg-center min-h-screen flex items-center justify-center py-10"
      style="background-image: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1500&q=80');">

    <div class="absolute inset-0 bg-black/30 backdrop-blur-sm"></div>

    <div class="relative bg-white/95 p-10 rounded-3xl shadow-2xl w-full max-w-lg">
        <div class="text-center mb-6">
            <h2 class="text-3xl font-extrabold text-gray-900">Create Account</h2>
            <p class="text-gray-500">Start your journey with us today</p>
        </div>

            <form action="<c:url value='/admin/register'/>" method="post" class="space-y-4">            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-gray-700 text-sm font-semibold mb-1">First Name</label>
                    <input type="text" name="firstName" required
                           class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <label class="block text-gray-700 text-sm font-semibold mb-1">Last Name</label>
                    <input type="text" name="lastName" required
                           class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500">
                </div>
            </div>

            <div>
                <label class="block text-gray-700 text-sm font-semibold mb-1">Email Address</label>
                <input type="email" name="email" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label class="block text-gray-700 text-sm font-semibold mb-1">Password</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center text-sm text-gray-600">
                <input type="checkbox" required class="mr-2">
                <span>I agree to the <a href="#" class="text-blue-600 underline">Terms & Conditions</a></span>
            </div>

            <button type="submit"
                    class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded-xl transition duration-300 shadow-lg mt-4">
                Create My Account
            </button>
        </form>

        <div class="mt-6 text-center border-t pt-6">
            <p class="text-gray-600">Already a member?
                <a href="<c:url value='admin/login'/>" class="text-blue-600 font-bold hover:underline">Login here</a>
            </p>
        </div>
    </div>
</body>
</html>