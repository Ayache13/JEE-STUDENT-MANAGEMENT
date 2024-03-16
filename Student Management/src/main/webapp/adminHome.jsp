<%@include file="header.html"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ENSA</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    
</head>
<body>
    <div class="header">
        <img src="teacher.png" onclick="logout()" title="Logout">
    </div>
    <div class="container">
        <div class="tab">
            <button class="tablink" onclick="openCity(event, 'London')">Add New Student</button>
            <button class="tablink" onclick="openCity(event, 'Paris')">Insert New Result</button>
            <button class="tablink" onclick="openCity(event, 'Tokyo')">Registered Students</button>
            <button class="tablink" onclick="openCity(event, 'Tokyo1')">All Student Result</button>
        </div>
        
        
        <main class="my-form">
         <div id="London" class="city">
            <div class="form-container">
                <h2>Add New Student</h2>
                <form action="addNewStudent.jsp" method="post">
                    <div class="form-group">
                        <label for="course">Course Name</label>
                        <input type="text" name="course" required>
                    </div>
                    <div class="form-group">
                        <label for="branch">Branch Name</label>
                        <input type="text" name="branch" required>
                    </div>
                    <div class="form-group">
                        <label for="rollNo">Roll Number</label>
                        <input type="text" name="rollNo" required>
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="fatherName">Father Name</label>
                        <input type="text" name="fatherName" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <input type="text" name="gender" required>
                    </div>
                    <div class="form-group">
                        <button type="submit">Save</button>
                    </div>
                </form>
            </div>
        </div>
        
        
        </main>
        <main class="my-form">
    <div id="Paris" class="city" style="display:none;">
        <div class="form-container">
            <h2>Insert New Result</h2>
            <form name="my-form" onsubmit="return validform()" action="insertNewResult.jsp" method="post">
                <div class="form-group">
                    <label for="rollNo">Roll Number</label>
                    <input type="text" class="form-control" name="rollNo" required>
                </div>
                <div class="form-group">
                    <label for="s1">Engg. Physics-I</label>
                    <input type="text" class="form-control" name="s1" required>
                </div>
                <div class="form-group">
                    <label for="s2">Engg. Chemistry</label>
                    <input type="text" class="form-control" name="s2" required>
                </div>
                <div class="form-group">
                    <label for="s3">Engg. Mathematics-I</label>
                    <input type="text" class="form-control" name="s3" required>
                </div>
                <div class="form-group">
                    <label for="s4">Basic Electrical Engg</label>
                    <input type="text" class="form-control" name="s4" required>
                </div>
                <div class="form-group">
                    <label for="s5">Electronic Engg.</label>
                    <input type="text" class="form-control" name="s5" required>
                </div>
                <div class="form-group">
                    <label for="s6">Engg. Chemistry Lab</label>
                    <input type="text" class="form-control" name="s6" required>
                </div>
                <div class="form-group">
                    <label for="s7">Engg. Physics Lab</label>
                    <input type="text" class="form-control" name="s7" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</main>
       
    </div>
    

    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("city");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " w3-red";
        }

        function logout() {
            window.location.href = "adminLogin.html";
        }
    </script>
</body>






</body>
  </div>

  <div id="Paris" class="w3-container w3-border city" style="display:none">
  <br>
  	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!doctype html>
<html lang="en">

<body>





<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html> 
  </div>

  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
  
<section>
    <div class="tbl-header">
    <h2>Registred students</h2>
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Branch Name</th>
                    <th>Roll Number</th>
                    <th>Name</th>
                    <th>Father Name</th>
                    <th>Gender</th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
            <tbody>
                <%@ page import="java.sql.*" %>
                <%@ page import="Project.ConnectionProvider" %>
                <% try {
                    Connection con = ConnectionProvider.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select *from students");
                    while(rs.next()) { %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                        </tr>
                <% }
                } catch(Exception e) { } %>
            </tbody>
        </table>
    </div>
</section>



</div>
<div id="Tokyo1" class="w3-container w3-border city" style="display:none">
   
<section>
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Roll Number</th>
          <th>Engg. Physics-I</th>
          <th>Engg. Chemistry</th>
          <th>Engg. Mathematics-I</th>
          <th>Basic Electrical Engg</th>
          <th>Electronic Engg.</th>
          <th>Engg. Chemistry Lab</th>
          <th>Engg. Physics Lab</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
       <%@page import = "java.sql.*" %>
      <%@page import = "Project.ConnectionProvider" %>
      <%try{
      	Connection con = ConnectionProvider.getConnection();
		  Statement st = con.createStatement();
		  ResultSet rs = st.executeQuery("select *from results");
		  while(rs.next())
		  {
			  %>
        <tr>
          <td><%= rs.getString(1)%></td>
          <td><%= rs.getString(2)%></td>
          <td><%= rs.getString(3)%></td>
          <td><%= rs.getString(4)%></td>
          <td><%= rs.getString(5)%></td>
          <td><%= rs.getString(6)%></td>
          <td><%= rs.getString(7)%></td>
          <td><%= rs.getString(8)%></td>
        </tr>
          </tbody>
         <%}}
     
      
       
    
      catch(Exception e){}%>
    </table>
  </div>
</section>

</div>

</body>
</html>