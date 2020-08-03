<%@page import="java.sql.*" %>
<%! String email,password; %>

<%
        if(((String)session.getAttribute("type"))=="admin" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
            response.sendRedirect("admin/admin_home.jsp");
}
      if(((String)session.getAttribute("type"))=="user" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
         response.sendRedirect("user/user_home.jsp");
}

    
    
    
email = request.getParameter("email");
password = request.getParameter("password");

try{
    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system","root","");

Statement stmt=con.createStatement();
	  
String sql="select * from user where user_email='"+email+"' and user_password='"+password+"'";
ResultSet rs=stmt.executeQuery(sql); 
if(rs.next())
{
    session.setAttribute("email", email);
    session.setAttribute("type", "user");
    response.sendRedirect("user/user_home.jsp");
}
else{
    response.sendRedirect("login.jsp");
}
con.close();
}
catch(Exception e){
    
}

%>