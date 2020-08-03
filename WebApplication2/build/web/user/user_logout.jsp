<%
if((session.getAttribute("email")!=null || (String)session.getAttribute("email")!="")&& (session.getAttribute("type")!=null || (String)session.getAttribute("type")=="user"))
{
    session.setAttribute("email", "");
    session.removeAttribute("email");
    session.setAttribute("type", "");
    session.removeAttribute("type");
    session.invalidate();
    response.sendRedirect("../login.jsp");
}
else{
    
    response.sendRedirect("../login.jsp");
}



%>