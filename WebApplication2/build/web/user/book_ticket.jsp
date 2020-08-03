<%@page import="java.sql.*"%>
<%! String passenger_name,passenger_Id, passenger_phone, email, passenger_dob, passenger_gender; int flight_id,user_id;%>
<%
    
   
if((session.getAttribute("email")==null || (String)session.getAttribute("email")=="")&& (session.getAttribute("type")==null || (String)session.getAttribute("type")=="" ||(String)session.getAttribute("type")!="user"))
{
    response.sendRedirect("../login.jsp");
}

email = (String)session.getAttribute("email");
passenger_name=request.getParameter("passenger_name");
passenger_Id=request.getParameter("passenger_email");
passenger_dob=request.getParameter("passenger_dob");
passenger_gender=request.getParameter("passenger_gender");
passenger_phone = request.getParameter("passenger_phone");
flight_id = Integer.parseInt(request.getParameter("flight_id"));

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system", "root", "");
Statement smt=conn.createStatement();

String sql = "select user_id from user where user_email='"+email+"'";
ResultSet rs=smt.executeQuery(sql);
if(rs.next()){
    user_id = rs.getInt(1);
}
Statement smt1=conn.createStatement();
String sql1="insert into booking(user_id, flight_id, booking_time, passenger_name, passenger_dob, passenger_id, passenger_phone, passenger_gender) values("+user_id+","+flight_id+", now(),'"+passenger_name+"','"+passenger_dob+"','"+passenger_Id+"','"+passenger_phone+"','"+passenger_gender+"')";
int i=smt.executeUpdate(sql1);
if(i==1){
    session.setAttribute("msg", "200");    // Msg Code: (100-Flight Update Success), (101-Flight Update Error), (103- Cancle Flight Success), (104- Cancle Flight Error), 200- User Flight Ticket Book Successfully, 201- Flight Ticket Book Error,
}
else{
    session.setAttribute("msg", "101");
}
response.sendRedirect("user_home.jsp");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>