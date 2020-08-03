<%@page import="java.sql.*" %>
<%@page import="java.io.*"%>
<%! int source,  destination, user_status; String departure, sql; %>
<%
 
      if(((String)session.getAttribute("type"))=="admin" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
           user_status =1;
}
      if(((String)session.getAttribute("type"))=="user" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
         user_status =2;
}

      %>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <title>Airline System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link rel="icon" href="images/favicon.png">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/a6a8a159c6.js"></script>
  <style>
  body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #818181;
  }
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #00c1ff;
    color: #fff;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: #00c1ff;
    font-size: 50px;
  }
  .logo {
    color: #00c1ff;
    font-size: 200px;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #00c1ff;
  }
  .carousel-indicators li {
    border-color: #00c1ff;
  }
  .carousel-indicators li.active {
    background-color: #00c1ff;
  }
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid #00c1ff; 
    border-radius:0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
    border: 1px solid #00c1ff;
    background-color: #fff !important;
    color: #00c1ff;
  }
  .panel-heading {
    color: #fff !important;
    background-color: #00c1ff !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
  }
  .panel-footer {
    background-color: white !important;
  }
  .panel-footer h3 {
    font-size: 32px;
  }
  .panel-footer h4 {
    color: #aaa;
    font-size: 14px;
  }
  .panel-footer .btn {
    margin: 15px 0;
    background-color: #00c1ff;
    color: #fff;
  }
  .navbar {
    margin-bottom: 0;
    background-color: #00c1ff;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #00c1ff !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #00c1ff;
  }
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
  .bgcs{
	background-image:url(images/maxresdefault.jpg);
	background-size: cover;
  }
  .ia tr{
	color:#000;
	height:40px;
	background-color:#efefef;
  }
  .ia tr:hover{
	color:#fff;
	background-color:#555555;
  }
  .ia-img{
	width:30px;
	height:30px;
	}
        .fa-color{
            
            color:#00c1ff;
            text-shadow:1px 1px 1px #000;   
        }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
      font-size: 150px;
    }
  }
  
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="index.jsp"> Airline</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#portfolio">TESTIMONIAL</a></li>
        <li><a href="#pricing">PRICING</a></li>
        <li><a href="#contact">CONTACT</a></li>
        <jsp:include page="header.jsp" />
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center bgcs">
  <h1>Welcome</h1> 
  <p>Airline System</p> 
  <form>
    <div class="input-group">
      
      <!--<div class="input-group-btn">
        <button type="button" class="btn btn-danger">Click Me</button>
      </div>-->
    </div>
  </form>
</div>

<!-- Container (Contact Section) -->
<div id="search" class="container-fluid bg-grey">
  <h2 class="text-center">Search Flight</h2>
  <div class="row">
    <div class="col-sm-12 slideanim">
        <form action="index.jsp" name="search" method="post">
      <div class="row">
          
        <div class="col-sm-6 form-group">
            <label for="source">Source City</label>       
          
			  <select class="form-control form-control-lg" id="source" name="source" required>
				<option value="1">Kanpur</option>
				<option value="2">Lucknow</option>
				<option value="3">Delhi</option>
                                <option value="4">Bhopal</option>
                                <option value="5">Bangluru</option>
                                <option value="6">Mumbai</option>
                                <option value="7">Sri Nagar</option>
			  </select>
        </div>
        <div class="col-sm-6 form-group">
		  <label for="destination">Destination City</label>
                   <select class="form-control form-control-lg" id="destination" name="destination" required>
				<option value="1">Kanpur</option>
				<option value="2">Lucknow</option>
				<option value="3">Delhi</option>
                                <option value="4">Bhopal</option>
                                <option value="5">Bangluru</option>
                                <option value="6">Mumbai</option>
                                <option value="7">Sri Nagar</option>
			  </select>
          
        </div>
		<div class="col-sm-12 form-group">
                    <label for="departure">Date</label>
                    <input class="form-control" id="departure" name="departure" type="date" required>	
                    <!--<label for="sel1">Select list:</label>
			  <select class="form-control form-control-lg" id="sel1">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
			  </select>-->
        </div>
          
      </div>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-primary pull-right" type="submit">Search Flight</button>
        </div>
      </div>
        </form>    
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12">
        <table class="table ia">
		  <thead>
			<tr style="background:#555555; color:#fff">
                          <th scope="col">Flight Name</th>
			  <th scope="col">Company</th>
			  <th scope="col">Seats</th>
			  <th scope="col">Source</th>
                          <th scope="col">Destination</th>
                          <th scope="col">Dep. Time</th>
			  <th scope="col">Arr. Time</th>
			  <th scope="col">Price</th>
                          <th scope="col">Action</th>
			</tr>
		  </thead>
		  <tbody>
			
        <%
            if(request.getParameter("source")!=null && request.getParameter("destination")!=null && request.getParameter("departure")!=null)
            {
               source = Integer.parseInt(request.getParameter("source"));
               destination = Integer.parseInt(request.getParameter("destination"));
               departure= request.getParameter("departure");
               sql = "SELECT flight_name, (SELECT coumpany_name FROM airline_company WHERE company_name=company_id) AS Company, no_of_seats,(SELECT city_name FROM city WHERE city_id=source),(SELECT city_name FROM city WHERE city_id=destination), price, dep_time, arr_time, flight_id, company_name FROM flight  where source="+source+" and destination="+destination+" and date(dep_time)='"+departure+"' and flight_status=1";
            }
            else
            {
                sql = "SELECT flight_name, (SELECT coumpany_name FROM airline_company WHERE company_name=company_id) AS Company, no_of_seats,(SELECT city_name FROM city WHERE city_id=source),(SELECT city_name FROM city WHERE city_id=destination) , price, dep_time, arr_time, flight_id, company_name FROM flight where flight_status=1 order by dep_time";
                
            }
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system","root","");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
             int count = 0;   
                        while(rs.next()){
                           count++; 
                           if(user_status==1){
                             
                               out.print("<tr><th scope=\"row\">"+rs.getString(1)+"</th><td><img src=\"images/airline/"+rs.getInt(10)+".jpg\" class=\"img-circle\" style=\"width:40px; height:40px;\"> &nbsp;&nbsp;&nbsp;"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getInt(6)+"</td><td><a href=\"admin/view_flight.jsp?id="+rs.getInt(9)+"\" class=\"btn btn-primary\">View</a></td></tr>");
                               
                           }
                           else if(user_status==2){
                              out.print("<tr><th scope=\"row\">"+rs.getString(1)+"</th><td><img src=\"images/airline/"+rs.getInt(10)+".jpg\" class=\"img-circle\" style=\"width:40px; height:40px;\"> &nbsp;&nbsp;&nbsp;"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getInt(6)+"</td><td><a href=\"user/booking.jsp?id="+rs.getInt(9)+"\" class=\"btn btn-primary\">Book Now</a></td></tr>"); 
                           }
                           else{
                            out.print("<tr><th scope=\"row\">"+rs.getString(1)+"</th><td><img src=\"images/airline/"+rs.getInt(10)+".jpg\" class=\"img-circle\" style=\"width:40px; height:40px;\"> &nbsp;&nbsp;&nbsp;"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getInt(6)+"</td><td><a href=\"login.jsp\" class=\"btn btn-primary\">Book Now</a></td></tr>");
                            }
                        }
                        if(count==0){
                            out.print("<tr><td colspan=\"8\">No Record Found..</td></tr>");
                        }
                        }
                        catch(Exception e){out.print(e);}
                            %>
			  
			
			<!--<tr>
			  <th scope="row">2</th>
			  <td>Jacob</td>
			  <td>Thornton</td>
			  <td>@fat</td>
			  <td><img class="ia-img img-circle" src="images/about_us.jpg" alt=""></td>
			</tr>-->
			
		  </tbody>
		</table>
    </div>
  </div>
    
</div>

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>About Company Page</h2><br>
      <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h4><br>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><button class="btn btn-default btn-lg">Get in Touch</button>
    </div>
    <div class="col-sm-4">
      <img class="img-responsive" src="images/about.jpg" alt="alt">
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <img class="img-responsive" src="images/value.jpg" alt="alt">
    </div>
    <div class="col-sm-8">
      <h2>Our Values</h2><br>
      <h4><strong>MISSION:</strong> Our mission lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h4><br>
      <p><strong>VISION:</strong> Our vision Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <i class="fa fa-medkit fa-5x fa-color" aria-hidden="true"></i>
      <h4>MEDICAL</h4>
      
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <i class="fa fa-cutlery fa-5x fa-color" aria-hidden="true"></i>
      <h4>FOOD</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <i class="fa fa-ambulance fa-5x fa-color" aria-hidden="true"></i>
      <h4>EMERGENCY</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <i class="fa fa-handshake-o fa-5x fa-color" aria-hidden="true"></i>
      <h4>GOOD SUPPORT</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <i class="fa fa-money fa-5x fa-color" aria-hidden="true"></i>
      <h4>EASY PAYMENT</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <i class="fa fa-plane fa-5x fa-color" aria-hidden="true"></i>
      <h4 style="color:#303030;">AIRPORT SERVICES</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  
  
  <h2>What our customers say</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
      </div>
      <div class="item">
        <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
      </div>
      <div class="item">
        <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>




<!-- Image of location/map -->


<footer class="container-fluid text-center" id="contact">
<div class="row">
	<div class="col-xs-2">
    </div>
	<div class=" col-xs-8">
		<img src="images/footer.jpg" class="img-responsive">
    </div>
	<div class="col-xs-2">
    </div>
</div>
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Made By <a href="#" title="Visit w3schools">Shubham Prajapati</a></p>
</footer>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>

</body>
</html>
