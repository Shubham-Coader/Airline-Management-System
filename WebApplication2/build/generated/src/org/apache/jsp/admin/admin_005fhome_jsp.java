package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class admin_005fhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String email,name; int id;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

if((session.getAttribute("email")==null || session.getAttribute("email")=="")&& (session.getAttribute("type")==null || session.getAttribute("type")=="" ||session.getAttribute("type")!="admin"))
{
    response.sendRedirect("../admin_login.jsp");
}
email = (String)session.getAttribute("email");
try{
    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system","root","");

Statement stmt=con.createStatement();
	  
String sql="select admin_name, admin_id from admin where admin_email='"+email+"'";
ResultSet rs=stmt.executeQuery(sql); 
if(rs.next()){
name=rs.getString(1);
id= rs.getInt(2);
}
    
}catch(Exception e){

}


      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <!-- Required meta tags -->\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("  <title>Admin Home</title>\n");
      out.write("\n");
      out.write("  <!-- Template CSS -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/css/style-starter.css\">\n");
      out.write("\n");
      out.write("  <!-- google fonts -->\n");
      out.write("  <link href=\"//fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900&display=swap\" rel=\"stylesheet\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/icon?family=Material+Icons\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"sidebar-menu-collapsed\">\n");
      out.write("  <div class=\"se-pre-con\"></div>\n");
      out.write("<section>\n");
      out.write("  <!-- sidebar menu start -->\n");
      out.write("  <div class=\"sidebar-menu sticky-sidebar-menu\">\n");
      out.write("\n");
      out.write("    <!-- logo start -->\n");
      out.write("    <div class=\"logo\">\n");
      out.write("      <h1><a href=\"../index.jsp\">Airline System</a></h1>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("  <!-- if logo is image enable this -->\n");
      out.write("    <!-- image logo --\n");
      out.write("    <div class=\"logo\">\n");
      out.write("      <a href=\"index.html\">\n");
      out.write("        <img src=\"image-path\" alt=\"Your logo\" title=\"Your logo\" class=\"img-fluid\" style=\"height:35px;\" />\n");
      out.write("      </a>\n");
      out.write("    </div>\n");
      out.write("    <!-- //image logo -->\n");
      out.write("\n");
      out.write("    <div class=\"logo-icon text-center\">\n");
      out.write("      <a href=\"../index.jsp\" title=\"logo\"><img src=\"assets/images/logo.png\" alt=\"logo-icon\"> </a>\n");
      out.write("    </div>\n");
      out.write("    <!-- //logo end -->\n");
      out.write("\n");
      out.write("    <div class=\"sidebar-menu-inner\">\n");
      out.write("\n");
      out.write("      <!-- sidebar nav start -->\n");
      out.write("      <ul class=\"nav nav-pills nav-stacked custom-nav\">\n");
      out.write("        <li class=\"active\"><a href=\"admin_home.jsp\"><i class=\"material-icons\">home</i><span> Dashboard</span></a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"menu-list\">\n");
      out.write("          <a href=\"view_flight.jsp\"><i class=\"material-icons\">flight_takeoff</i>\n");
      out.write("            <span>Flight <i class=\"lnr lnr-chevron-right\"></i></span></a>\n");
      out.write("          <ul class=\"sub-menu-list\">\n");
      out.write("              <li><a href=\"view_flight.jsp\">View Flight</a> </li>\n");
      out.write("            <li><a href=\"add_flight.jsp\">Add Flight</a> </li>\n");
      out.write("          </ul>\n");
      out.write("        </li>\n");
      out.write("       \n");
      out.write("      </ul>\n");
      out.write("      <!-- //sidebar nav end -->\n");
      out.write("      <!-- toggle button start -->\n");
      out.write("      <a class=\"toggle-btn\">\n");
      out.write("        <i class=\"material-icons\">keyboard_arrow_right</i>\n");
      out.write("        <i class=\"material-icons\">keyboard_arrow_left</i>\n");
      out.write("      </a>\n");
      out.write("      <!-- //toggle button end -->\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <!-- //sidebar menu end -->\n");
      out.write("  <!-- header-starts -->\n");
      out.write("  <div class=\"header sticky-header\">\n");
      out.write("\n");
      out.write("    <!-- notification menu start -->\n");
      out.write("    <div class=\"menu-right\">\n");
      out.write("      <div class=\"navbar user-panel-top\">\n");
      out.write("        \n");
      out.write("        <div class=\"user-dropdown-details d-flex\">\n");
      out.write("          \n");
      out.write("          <div class=\"profile_details\">\n");
      out.write("            <ul>\n");
      out.write("              <li class=\"dropdown profile_details_drop\">\n");
      out.write("                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" id=\"dropdownMenu3\" aria-haspopup=\"true\"\n");
      out.write("                  aria-expanded=\"false\">\n");
      out.write("                  <div class=\"profile_img\">\n");
      out.write("                    <img src=\"assets/images/profile/");
      out.print(id);
      out.write(".jpg\" class=\"rounded-circle\" alt=\"\" />\n");
      out.write("                    <div class=\"user-active\">\n");
      out.write("                      <span></span>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"dropdown-menu drp-mnu\" aria-labelledby=\"dropdownMenu3\">\n");
      out.write("                  <li class=\"user-info\">\n");
      out.write("                    <h5 class=\"user-name\">");
      out.print(name);
      out.write("</h5>\n");
      out.write("                    <span class=\"status ml-2\">Available</span>\n");
      out.write("                  </li>\n");
      out.write("                  <li> <a href=\"admin_profile.jsp\"><i class=\"material-icons\">person</i>My Profile</a> </li>\n");
      out.write("                  <li> <a href=\"admin_update_password.jsp\"><i class=\"material-icons\">vpn_key</i>Change Password</a> </li>\n");
      out.write("                  <li class=\"logout\"> <a href=\"admin_logout.jsp\"><i class=\"material-icons\">power_settings_new</i> Logout</a> </li>\n");
      out.write("                </ul>\n");
      out.write("              </li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <!--notification menu end -->\n");
      out.write("  </div>\n");
      out.write("  <!-- //header-ends -->\n");
      out.write("  <!-- main content start -->\n");
      out.write("<div class=\"main-content\">\n");
      out.write("\n");
      out.write("  <!-- content -->\n");
      out.write("  <div class=\"container-fluid content-top-gap\">\n");
      out.write("\n");
      out.write("    <nav aria-label=\"breadcrumb\">\n");
      out.write("      <ol class=\"breadcrumb my-breadcrumb\">\n");
      out.write("        <li class=\"breadcrumb-item\"><a href=\"admin_home.jsp\">Home</a></li>\n");
      out.write("        <li class=\"breadcrumb-item active\" aria-current=\"page\">Dashboard</li>\n");
      out.write("      </ol>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"welcome-msg pt-3 pb-4\">\n");
      out.write("     \n");
      out.write("      <h1>Hi <span class=\"text-primary\">");
      out.print(name);
      out.write("</span> Welcome back</h1>\n");
      out.write("      <p>Very detailed & featured admin.</p>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- statistics data -->\n");
      out.write("    <div class=\"statistics\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-xl-6 pr-xl-2\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-6 pr-sm-2 statistics-grid\">\n");
      out.write("              <div class=\"card card_border border-primary-top p-4\">\n");
      out.write("                <i class=\"lnr lnr-users\"> </i>\n");
      out.write("                <h3 class=\"text-primary number\">10000+ K</h3>\n");
      out.write("                <p class=\"stat-text\">Total Users</p>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-6 pl-sm-2 statistics-grid\">\n");
      out.write("              <div class=\"card card_border border-primary-top p-4\">\n");
      out.write("                <i class=\"lnr lnr-eye\"> </i>\n");
      out.write("                <h3 class=\"text-secondary number\">200+</h3>\n");
      out.write("                <p class=\"stat-text\">Daily Visitors</p>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-xl-6 pl-xl-2\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-6 pr-sm-2 statistics-grid\">\n");
      out.write("              <div class=\"card card_border border-primary-top p-4\">\n");
      out.write("                <i class=\"lnr lnr-rocket\"> </i>\n");
      out.write("                <h3 class=\"text-success number\">500+</h3>\n");
      out.write("                <p class=\"stat-text\">Total Flight</p>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-6 pl-sm-2 statistics-grid\">\n");
      out.write("              <div class=\"card card_border border-primary-top p-4\">\n");
      out.write("                <i class=\"lnr lnr-book\"> </i>\n");
      out.write("                <h3 class=\"text-danger number\">15000+k</h3>\n");
      out.write("                <p class=\"stat-text\">Total Booking</p>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <!-- //statistics data -->\n");
      out.write("\n");
      out.write("    <!-- charts -->\n");
      out.write("    <div class=\"chart\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-lg-6 pr-lg-2 chart-grid\">\n");
      out.write("          <div class=\"card text-center card_border\">\n");
      out.write("            <div class=\"card-header chart-grid__header\">\n");
      out.write("              User Visit\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("              <!-- bar chart -->\n");
      out.write("              <div id=\"container\">\n");
      out.write("                <canvas id=\"barchart\"></canvas>\n");
      out.write("              </div>\n");
      out.write("              <!-- //bar chart -->\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-footer text-muted chart-grid__footer\">\n");
      out.write("              Updated 2 hours ago\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-6 pl-lg-2 chart-grid\">\n");
      out.write("          <div class=\"card text-center card_border\">\n");
      out.write("            <div class=\"card-header chart-grid__header\">\n");
      out.write("              Flight Status\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("              <!-- line chart -->\n");
      out.write("              <div id=\"container\">\n");
      out.write("                <canvas id=\"linechart\"></canvas>\n");
      out.write("              </div>\n");
      out.write("              <!-- //line chart -->\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-footer text-muted chart-grid__footer\">\n");
      out.write("              Updated just now\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <!-- //charts -->\n");
      out.write("\n");
      out.write(" \n");
      out.write("  </div>\n");
      out.write("  <!-- //content -->\n");
      out.write("</div>\n");
      out.write("<!-- main content end-->\n");
      out.write("</section>\n");
      out.write("  <!--footer section start-->\n");
      out.write("<footer class=\"dashboard\">\n");
      out.write("  <p>&copy 2020 Airline System. All Rights Reserved | Design by <a href=\"#\" class=\"text-primary\">Shubham Prajapati</a></p>\n");
      out.write("</footer>\n");
      out.write("<!--footer section end-->\n");
      out.write("<!-- move top -->\n");
      out.write("<button onclick=\"topFunction()\" id=\"movetop\" class=\"bg-primary\" title=\"Go to top\">\n");
      out.write("  <span class=\"material-icons\">publish</span>\n");
      out.write("</button>\n");
      out.write("<script>\n");
      out.write("  // When the user scrolls down 20px from the top of the document, show the button\n");
      out.write("  window.onscroll = function () {\n");
      out.write("    scrollFunction()\n");
      out.write("  };\n");
      out.write("\n");
      out.write("  function scrollFunction() {\n");
      out.write("    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {\n");
      out.write("      document.getElementById(\"movetop\").style.display = \"block\";\n");
      out.write("    } else {\n");
      out.write("      document.getElementById(\"movetop\").style.display = \"none\";\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // When the user clicks on the button, scroll to the top of the document\n");
      out.write("  function topFunction() {\n");
      out.write("    document.body.scrollTop = 0;\n");
      out.write("    document.documentElement.scrollTop = 0;\n");
      out.write("  }\n");
      out.write("</script>\n");
      out.write("<!-- /move top -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"assets/js/jquery-3.3.1.min.js\"></script>\n");
      out.write("<script src=\"assets/js/jquery-1.10.2.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- chart js -->\n");
      out.write("<script src=\"assets/js/Chart.min.js\"></script>\n");
      out.write("<script src=\"assets/js/utils.js\"></script>\n");
      out.write("<!-- //chart js -->\n");
      out.write("\n");
      out.write("<!-- Different scripts of charts.  Ex.Barchart, Linechart -->\n");
      out.write("<script src=\"assets/js/bar.js\"></script>\n");
      out.write("<script src=\"assets/js/linechart.js\"></script>\n");
      out.write("<!-- //Different scripts of charts.  Ex.Barchart, Linechart -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"assets/js/jquery.nicescroll.js\"></script>\n");
      out.write("<script src=\"assets/js/scripts.js\"></script>\n");
      out.write("\n");
      out.write("<!-- close script -->\n");
      out.write("<script>\n");
      out.write("  var closebtns = document.getElementsByClassName(\"close-grid\");\n");
      out.write("  var i;\n");
      out.write("\n");
      out.write("  for (i = 0; i < closebtns.length; i++) {\n");
      out.write("    closebtns[i].addEventListener(\"click\", function () {\n");
      out.write("      this.parentElement.style.display = 'none';\n");
      out.write("    });\n");
      out.write("  }\n");
      out.write("</script>\n");
      out.write("<!-- //close script -->\n");
      out.write("\n");
      out.write("<!-- disable body scroll when navbar is in active -->\n");
      out.write("<script>\n");
      out.write("  $(function () {\n");
      out.write("    $('.sidebar-menu-collapsed').click(function () {\n");
      out.write("      $('body').toggleClass('noscroll');\n");
      out.write("    })\n");
      out.write("  });\n");
      out.write("</script>\n");
      out.write("<!-- disable body scroll when navbar is in active -->\n");
      out.write("\n");
      out.write(" <!-- loading-gif Js -->\n");
      out.write(" <script src=\"assets/js/modernizr.js\"></script>\n");
      out.write(" <script>\n");
      out.write("     $(window).load(function () {\n");
      out.write("         // Animate loader off screen\n");
      out.write("         $(\".se-pre-con\").fadeOut(\"slow\");;\n");
      out.write("     });\n");
      out.write(" </script>\n");
      out.write(" <!--// loading-gif Js -->\n");
      out.write("\n");
      out.write("<!-- Bootstrap Core JavaScript -->\n");
      out.write("<script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("  ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
