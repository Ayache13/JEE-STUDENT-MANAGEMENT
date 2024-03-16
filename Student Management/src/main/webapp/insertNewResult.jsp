<%@page import="java.sql.*"%>
<%@page import="Project.ConnectionProvider"%>

<%
// Retrieve the parameters from the request
String rollNo = request.getParameter("rollNo");
String s1 = request.getParameter("s1");
String s2 = request.getParameter("s2");
String s3 = request.getParameter("s3");
String s4 = request.getParameter("s4");
String s5 = request.getParameter("s5");
String s6 = request.getParameter("s6");
String s7 = request.getParameter("s7");

Connection con = ConnectionProvider.getConnection(); // Assuming ConnectionProvider provides a method to get a Connection object
PreparedStatement ps = con.prepareStatement("INSERT INTO results (rollNo, s1, s2, s3, s4, s5, s6, s7) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

// Set the parameters for the PreparedStatement
ps.setString(1, rollNo);
ps.setString(2, s1);
ps.setString(3, s2);
ps.setString(4, s3);
ps.setString(5, s4);
ps.setString(6, s5);
ps.setString(7, s6);
ps.setString(8, s7);

// Execute the insertion query
int rowsAffected = ps.executeUpdate();

// Check if insertion was successful
if (rowsAffected > 0) {
    out.println("Data inserted successfully.");
} else {
    out.println("Failed to insert data.");
}

// Close the PreparedStatement and Connection
ps.close();
con.close();
%>
