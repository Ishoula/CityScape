<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | Global Wanderer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-cover bg-center h-screen flex items-center justify-center"
      style="background-image: url('https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=1500&q=80');">

    <div class="absolute inset-0 bg-black/40 backdrop-blur-sm"></div>

    <div class="relative bg-white/90 p-10 rounded-3xl shadow-2xl w-full max-w-md backdrop-blur-md">
        <div class="text-center mb-8">
            <a "<c:url value='/'/>"" class="text-3xl font-bold text-blue-600">
                <i class="fa-solid fa-map-location-dot"></i> CityScape
            </a>
            <h2 class="text-2xl font-bold text-gray-800 mt-4">Welcome Back</h2>
            <p class="text-gray-500">Login to access the admin portal</p>
        </div>

        <%-- Error Message Handling --%>
        <% if ("invalid".equals(request.getParameter("error"))) { %>
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-3 mb-6 text-sm">
                Invalid email or password. Please try again.
            </div>
        <% } %>

        <form action="<c:url value='/admin/login'/>"  method="post" class="space-y-5">
            <div>
                <label class="block text-gray-700 text-sm font-semibold mb-2">Email Address</label>
                <input type="email" name="email" required
                       class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:outline-none">
            </div>

            <div>
                <label class="block text-gray-700 text-sm font-semibold mb-2">Password</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:outline-none">
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 rounded-xl transition duration-300 shadow-lg">
                Sign In
            </button>
        </form>


    </div>
</body>
</html>