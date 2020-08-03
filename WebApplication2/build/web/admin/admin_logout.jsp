<%
if((session.getAttribute("email")!=null || session.getAttribute("email")!="")&& (session.getAttribute("type")!=null || session.getAttribute("type")=="admin"))
{
    session.setAttribute("email", "");
    session.removeAttribute("email");
    session.setAttribute("type", "");
    session.removeAttribute("type");
    session.invalidate();
    response.sendRedirect("../admin_login.jsp");
}
else{
    
    response.sendRedirect("../admin_login.jsp");
}



%>