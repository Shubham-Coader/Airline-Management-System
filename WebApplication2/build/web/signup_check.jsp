<%@page import="java.sql.*"%>

<%! String name, email, password, mobile, add, gender, dob;%>
<%
    
        if(((String)session.getAttribute("type"))=="admin" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
            response.sendRedirect("admin/admin_home.jsp");
}
      if(((String)session.getAttribute("type"))=="user" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
         response.sendRedirect("user/user_home.jsp");
}

name=request.getParameter("first_name")+" "+request.getParameter("last_name");
email=request.getParameter("email");
password=request.getParameter("password");
mobile = request.getParameter("contact");
add = request.getParameter("address");
gender = request.getParameter("gender");
dob = request.getParameter("dob");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system", "root", "");
Statement smt=conn.createStatement();
String sql="insert into user(user_name,user_email,user_password,user_mobile,user_address,user_gender,user_dob,user_aacount_time) values('"+name+"','"+email+"','"+password+"','"+mobile+"','"+add+"','"+gender+"','"+dob+"',now())";
;
//out.print(sql);
int i=smt.executeUpdate(sql);

if(i==1){
    session.setAttribute("email", email);
    session.setAttribute("type", "user");
    response.sendRedirect("user/user_home.jsp");
}
else{
 response.sendRedirect("signup.jsp?msg=error");   
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
