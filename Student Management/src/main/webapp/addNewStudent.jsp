<%@page import="java.sql.*"%>
<%@page import="Project.ConnectionProvider"%>

<%
String course = request.getParameter("course");
String branch = request.getParameter("branch");
String rollNo = request.getParameter("rollNo");
String name = request.getParameter("name");
String fatherName = request.getParameter("fatherName");
String gender = request.getParameter("gender");

Connection con = null;
PreparedStatement ps = null;

try {
    con = ConnectionProvider.getConnection();
    String query = "INSERT INTO students (course, branch, rollNo, name, fatherName, gender) VALUES (?, ?, ?, ?, ?, ?)";
    ps = con.prepareStatement(query);
    ps.setString(1, course);
    ps.setString(2, branch);
    ps.setString(3, rollNo);
    ps.setString(4, name);
    ps.setString(5, fatherName);
    ps.setString(6, gender);

    int rowsAffected = ps.executeUpdate();
    if (rowsAffected > 0) {
        // Data inserted successfully
        response.sendRedirect("adminHome.jsp");
    } else {
        // Handle insertion failure
        // You may redirect to an error page or display an error message
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    ConnectionProvider.closeConnection(con);
}
%>
