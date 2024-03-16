<%@ page import = "java.sql.*" %>
<%@ page import = "Project.ConnectionProvider" %>
<% try {
    String rollNo = request.getParameter("rollNo");
    Connection con = ConnectionProvider.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from students inner join results on students.rollNo = results.rollNo where students.rollNo = '"+rollNo+"'");

    if (rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Home</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <a href="dgiOneView.html">Back</a>
    <hr class="new1">
    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
                <tr>
                    <th>institution Name: ENSA</th>
                    <th>Course Name:<%=rs.getString(2) %></th>
                    <th>Branch Name: <%=rs.getString(3) %></th>
                    <th><center>RollNo: <%=rs.getString(4) %></th>
                </tr>
            </thead>
            <thead>
                <tr>
                    <th>Name: <%=rs.getString(5) %></th>
                    <th>Father <%=rs.getString(6) %></th>
                    <th>Gender: <%=rs.getString(7) %></th>
                    <th><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center><img src="print.png"></center></a></th>
                </tr>
            </thead>
        </table>
    </div>

    <hr class="new1">

    <table>
        <thead>
            <tr>
                <td colspan="3">Course</td>
                <td rowspan="2">Type</td>
                <td rowspan="2">Full Marks</td>
                <td rowspan="2">Passing Marks</td>
                <td rowspan="2">Obtained Marks</td>
            </tr>
            <tr>
                <td>Code </td>
                <td colspan="2"> Name </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>NAS101</td>
                <td colspan="2">Engg. Physics-I </td>
                <td>Theory</td>
                <td>100</td>
                <td> 30 </td>
                <td><%=rs.getString(10) %></td>
            </tr>
            <tr>
                <td>NAS102</td>
                <td colspan="2">Engg. Chemistry</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(11) %> </td>
            </tr>
            <tr>
                <td>NAS103</td>
                <td colspan="2">Engg. Mathematics-I </td>
                <td>Theory</td>
                <td>100</td>
                <td> 30 </td>
                <td> <%=rs.getString(12) %></td>
            </tr>
            <tr>
                <td>NEE101</td>
                <td colspan="2">Basic Electrical Engg. </td>
                <td>Theory</td>
                <td>100</td>
                <td> 30 </td>
                <td> <%=rs.getString(13) %></td>
            </tr>
            <tr>
                <td>NEC101</td>
                <td colspan="2">Electronic Engg.</td>
                <td>Theory</td>
                <td>100</td>
                <td> 30 </td>
                <td><%=rs.getString(14) %> </td>
            </tr>
            <tr>
                <td>NAS152</td>
                <td colspan="2">Engg. Chemistry Lab</td>
                <td>Practical</td>
                <td>30</td>
                <td>15</td>
                <td> <%=rs.getString(15) %> </td>
            </tr>
            <tr>
                <td>NAS151</td>
                <td colspan="2">Engg. Physics Lab</td>
                <td>Practical</td>
                <td>30</td>
                <td>15</td>
                <td> <%=rs.getString(16) %> </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="footer">Total Marks</td>
                <td>560</td>
                <td>180</td>
                <td><% int sum = rs.getInt(10) + rs.getInt(11)+ rs.getInt(12)+ rs.getInt(13)+ rs.getInt(14)+ rs.getInt(15)+ rs.getInt(16); out.println(sum); %> </td>
            </tr>
            <tr>
                <td colspan="4" class="footer">Percentage</td>
                <td colspan="3"><% out.println((sum*100)/560); %></td>
            </tr>
        </tfoot>
    </table>

    <hr class="new1">
</body>
</html>

<%
    } else {
        response.sendRedirect("errorDgiOneView.html");
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>
