<%
 
      if(((String)session.getAttribute("type"))=="admin" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
          %>
          <li><a href="admin/admin_home.jsp">Admin</a></li>
          
<%
}
     else if(((String)session.getAttribute("type"))=="user" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
          %>
          <li><a href="user/user_home.jsp">User</a></li>
<%
}
else{
         %>
          <li><a href="login.jsp" >Login<img src="images/about_us.jpg" class="img-circle" style="width:20px; height:20px;"></a></li>
<%

}
      %>