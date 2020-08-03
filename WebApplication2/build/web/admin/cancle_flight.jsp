
<%@page import="java.sql.*" %>
<%! int flight_id; %>
<%
    
if((session.getAttribute("email")==null || session.getAttribute("email")=="")&& (session.getAttribute("type")==null || session.getAttribute("type")=="" ||session.getAttribute("type")!="admin"))
{
    response.sendRedirect("../admin_login.jsp");
}

if(request.getParameter("id")!=null)
{
flight_id = Integer.parseInt(request.getParameter("id"));



try{
    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system","root","");

Statement stmt=con.createStatement();
	  
String sql=" update flight set flight_status=0 where flight_id="+flight_id;
int i=stmt.executeUpdate(sql);
if(i==1){
    session.setAttribute("msg", "103");   // Msg Code: (100-Flight Update Success), (101-Flight Update Error), (103- Cancle Flight Success), (104- Cancle Flight Error),
}
else{
    session.setAttribute("msg", "104");
}
response.sendRedirect("view_flight.jsp");
}

catch(Exception e){
    
}
}
else{
  response.sendRedirect("view_flight.jsp");  
}
%>
