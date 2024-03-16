<%
	String username1 = request.getParameter("username");
	String password1 = request.getParameter("password");

    if (username1.equalsIgnoreCase("admin") && password1.equalsIgnoreCase("admin")) {
       
        response.sendRedirect("adminHome.jsp");
    } else {
        // If authentication fails, redirect back to the login page with an error message
        response.sendRedirect("errorAdminLogin.html");
    }




%>
