<%@ page import="java.io.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="java.net.* " %>
<%@ page import="java.util.* " %>
<%! int  no_of_seats, price, source, destination; String email, name, flight_name, company_name, dep_time, dep_date, arr_date, arr_time;%>

<%
    if((session.getAttribute("email")==null || session.getAttribute("email")=="")&& (session.getAttribute("type")==null || session.getAttribute("type")=="" ||session.getAttribute("type")!="admin"))
{
    response.sendRedirect("../admin_login.jsp");
}

if(request.getParameter("flight_name")!=null){ 

flight_name=request.getParameter("flight_name");
company_name=request.getParameter("company_name");
dep_date= request.getParameter("dep_date");
no_of_seats=Integer.parseInt(request.getParameter("no_of_seats"));
source= Integer.parseInt(request.getParameter("source"));
destination= Integer.parseInt(request.getParameter("destination"));

dep_time= request.getParameter("dep_time");
arr_date= request.getParameter("arr_date");
arr_time= request.getParameter("arr_time");
price=Integer.parseInt(request.getParameter("price"));
    
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system", "root", "");
Statement smt1=conn.createStatement();

String sql = "insert into flight(flight_name, company_name, no_of_seats, source, destination, dep_time, arr_time, price, flight_status) values('"+flight_name+"', "+company_name+","+no_of_seats+","+source+","+destination+",'"+dep_date+" "+dep_time+"','"+arr_date+" "+arr_time+"',"+price+",1)";

out.print(sql);
int i=smt1.executeUpdate(sql);
if(i==1){
    session.setAttribute("msg", "105");    // Msg Code: (100-Flight Update Success), (101-Flight Update Error), (103- Cancle Flight Success), (104- Cancle Flight Error),
}
else{
    session.setAttribute("msg", "106");
}
response.sendRedirect("add_flight.jsp");
conn.close();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
else{
   response.sendRedirect("add_flight.jsp"); 
}
%>