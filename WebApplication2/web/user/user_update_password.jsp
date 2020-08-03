<%@page import="java.sql.*" %>
<%! String email, name, old, new_password, update_sql ; int id ,msg; %>
<%
if((session.getAttribute("email")==null || (String)session.getAttribute("email")=="")&& (session.getAttribute("type")==null || (String)session.getAttribute("type")=="" || (String)session.getAttribute("type")!="user"))
{
    response.sendRedirect("../login.jsp");
}
email = (String)session.getAttribute("email");
update_sql = "";
if(request.getParameter("old_password")!=null && request.getParameter("new_password")!=null && request.getParameter("con_password")!=null)
{
    
    new_password = request.getParameter("new_password");
    old = request.getParameter("old_password");
    update_sql = "update user set user_password='"+new_password+"' where user_email='"+email+"' and user_password='"+old+"'";
}
try{
    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system","root","");

Statement stmt=con.createStatement();
Statement update_stmt=con.createStatement();

String sql="select user_name, user_id from user where user_email='"+email+"'";
ResultSet rs=stmt.executeQuery(sql); 
if(rs.next()){
name=rs.getString(1);
id= rs.getInt(2);
}
msg=0;
if(update_sql!="")
{
    
int i=update_stmt.executeUpdate(update_sql);
if(i==1)
{
    msg= 1;
}
if(i==0){
    msg= 2;
}
}


}catch(Exception e){

}

%>
<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>User Home : Update Password</title>

  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">

  <!-- google fonts -->
  <link href="//fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body class="sidebar-menu-collapsed">
  <div class="se-pre-con"></div>
<section>
  <!-- sidebar menu start -->
  <div class="sidebar-menu sticky-sidebar-menu">

    <!-- logo start -->
    <div class="logo">
      <h1><a href="../index.jsp">Airline System</a></h1>
    </div>

  <!-- if logo is image enable this -->
    <!-- image logo --
    <div class="logo">
      <a href="index.html">
        <img src="image-path" alt="Your logo" title="Your logo" class="img-fluid" style="height:35px;" />
      </a>
    </div>
    <!-- //image logo -->

    <div class="logo-icon text-center">
      <a href="../index.jsp" title="logo"><img src="assets/images/logo.png" alt="logo-icon"> </a>
    </div>
    <!-- //logo end -->

    <div class="sidebar-menu-inner">

      <!-- sidebar nav start -->
      <ul class="nav nav-pills nav-stacked custom-nav">
        <li class="active"><a href="user_home.jsp"><i class="material-icons">home</i><span> Dashboard</span></a>
        </li>
        <li class="menu-list">
          <a href="view_flight.jsp"><i class="material-icons">flight_takeoff</i>
            <span>Flight <i class="lnr lnr-chevron-right"></i></span></a>
          <ul class="sub-menu-list">
                <li><a href="view_flight.jsp">View Flight</a> </li>
            
          </ul>
        </li>
        <li class="active"><a href="view_ticket.jsp"><i class="material-icons">receipt</i><span> Ticket</span></a>
        </li>
      </ul>
      <!-- //sidebar nav end -->
      <!-- toggle button start -->
      <a class="toggle-btn">
        <i class="material-icons">
keyboard_arrow_right
</i>
        <i class="material-icons">
keyboard_arrow_left
</i>
      </a>
      <!-- //toggle button end -->
    </div>
  </div>
  <!-- //sidebar menu end -->
  <!-- header-starts -->
  <div class="header sticky-header">

    <!-- notification menu start -->
    <div class="menu-right">
      <div class="navbar user-panel-top">
        
        <div class="user-dropdown-details d-flex">
          
          <div class="profile_details">
            <ul>
              <li class="dropdown profile_details_drop">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu3" aria-haspopup="true"
                  aria-expanded="false">
                  <div class="profile_img">
                    <img src="assets/images/profile/<%if(id==1){out.print(id);}else{out.print("2");}%>.jpg" class="rounded-circle" alt="" />
                    <div class="user-active">
                      <span></span>
                    </div>
                  </div>
                </a>
                <ul class="dropdown-menu drp-mnu" aria-labelledby="dropdownMenu3">
                  <li class="user-info">
                    <h5 class="user-name"><%=name%></h5>
                    <span class="status ml-2">Available</span>
                  </li>
                  <li> <a href="user_home.jsp"><i class="material-icons">person</i>My Profile</a> </li>
                  <li> <a href="user_update_password.jsp"><i class="material-icons">vpn_key</i>Change Password</a> </li>
                  <li class="logout"> <a href="user_logout.jsp"><i class="material-icons">power_settings_new</i> Logout</a> </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--notification menu end -->
  </div>
  <!-- //header-ends -->
  <!-- main content start -->
<div class="main-content">

    <!-- content -->
    <div class="container-fluid content-top-gap">

        <!-- breadcrumbs -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb my-breadcrumb">
                <li class="breadcrumb-item"><a href="user_home.jsp">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Update Password</li>
            </ol>
        </nav>
        <!-- //breadcrumbs -->

        <!-- people -->
        <section class="people">
            
            
            

            <!-- people cards style 3 -->
            <div class="card card_border mb-5">
                <div class="cards__heading">
                    <h3><span> Change Password</span></h3>
                </div>
                <div class="card-body">
                    <div class="row px-2">
                        <div class="col-md-12 mb-4 px-2">
                          <% if(msg==1)
                          {
                              %>
                              <div class="alert alert-success" role="alert">
                                Your password is successfully updated!!
                            </div>
                          <%
                          }
                          if(msg==2){
                            %>
                            <div class="alert alert-danger" role="alert">
                                Error!!
                            </div>
                            <%
                            }
                          %>
                            
                            <form class="update_password" action="user_update_password.jsp" method="post">
                                <label for="old_password"> Old Password</label>
                                <input type="password" name="old_password" id="old_password" class="form-control" placeholder="Password" required>
                                <br>
                                 <label for="new_password"> New Password</label>
                                <input type="password" name="new_password" id="new_password" class="form-control" placeholder="Password" required>
                                <br>
                                <label for="con_password"> Confirm Password</label>
                                <input type="password" name="con_password" id="con_password" class="form-control" placeholder="Password" required>
                                <br>
                                <button class="btn btn-primary " type="submit">Update</button>
                            </form>
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
        <!-- //people -->

    </div>
    <!-- //content -->
</div>
<!-- main content end-->
</section>
  <!--footer section start-->
<footer class="dashboard">
  <p>&copy 2020 Airline System. All Rights Reserved | Design by <a href="#" class="text-primary">Shubham Prajapati</a></p>
</footer>
<!--footer section end-->
<!-- move top -->
<button onclick="topFunction()" id="movetop" class="bg-primary" title="Go to top">
  <span class="material-icons">publish</span>
</button>
<script>
  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function () {
    scrollFunction()
  };

  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.getElementById("movetop").style.display = "block";
    } else {
      document.getElementById("movetop").style.display = "none";
    }
  }

  // When the user clicks on the button, scroll to the top of the document
  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
</script>
<!-- /move top -->


<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/jquery-1.10.2.min.js"></script>

<!-- chart js -->
<script src="assets/js/Chart.min.js"></script>
<script src="assets/js/utils.js"></script>
<!-- //chart js -->

<!-- Different scripts of charts.  Ex.Barchart, Linechart -->
<script src="assets/js/bar.js"></script>
<script src="assets/js/linechart.js"></script>
<!-- //Different scripts of charts.  Ex.Barchart, Linechart -->


<script src="assets/js/jquery.nicescroll.js"></script>
<script src="assets/js/scripts.js"></script>

<!-- close script -->
<script>
  var closebtns = document.getElementsByClassName("close-grid");
  var i;

  for (i = 0; i < closebtns.length; i++) {
    closebtns[i].addEventListener("click", function () {
      this.parentElement.style.display = 'none';
    });
  }
</script>
<!-- //close script -->

<!-- disable body scroll when navbar is in active -->
<script>
  $(function () {
    $('.sidebar-menu-collapsed').click(function () {
      $('body').toggleClass('noscroll');
    })
  });
</script>
<!-- disable body scroll when navbar is in active -->

 <!-- loading-gif Js -->
 <script src="assets/js/modernizr.js"></script>
 <script>
     $(window).load(function () {
         // Animate loader off screen
         $(".se-pre-con").fadeOut("slow");;
     });
 </script>
 <!--// loading-gif Js -->

<!-- Bootstrap Core JavaScript -->
<script src="assets/js/bootstrap.min.js"></script>

</body>

</html>
  