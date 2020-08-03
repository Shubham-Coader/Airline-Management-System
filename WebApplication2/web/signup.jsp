<%
 
      if(((String)session.getAttribute("type"))=="admin" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
            response.sendRedirect("admin/admin_home.jsp");
}
      if(((String)session.getAttribute("type"))=="user" && session.getAttribute("type")!=null && session.getAttribute("email")!=null)
      {
         response.sendRedirect("user/user_home.jsp");
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
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
  /*
 * Specific styles of signin component
 */
/*
 * General styles
 */
body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-color: #e1e1e1;
}

.card-container.card {
    max-width: 100%;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #email,
.form-signin #first_name ,
.form-signin #last_name ,
.form-signin #password ,
.form-signin #con_password,
.form-signin #dob,
.form-signin #contact,
.form-signin #gender
{
    direction: ltr;
    height: 44px;
    font-size: 16px;
}
.form-signin #address{
    direction: ltr;
    height: 64px;
    font-size: 16px;
}
.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin input[type=date],
.form-signin textarea,
.form-signin select,
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin a {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
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
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top mynav">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp">Home</a></li>
        
      </ul>
    </div>
  </div>
</nav>
           
 <div class="container" style="margin-top:50px">
     <div class="row">
         <div class="col-lg-5" style="padding-top:120px;">
             <img src="images/footer.jpg" class="img-responsive" >
             
         </div>
         <div class="col-lg-7">
            <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="images/profile.jpg" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="signup_check.jsp" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <div class="row">
                    <div class="col-lg-6">
                        <input type="text" name="first_name" id="first_name" class="form-control" placeholder="Enter First Name" required autofocus>
                    </div>
                    <div class="col-lg-6">
                        <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Enter Last Name" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <input type="email" name="email" id="email" class="form-control" placeholder="Email address" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required >
                    </div>
                    <div class="col-lg-6">
                        <input type="password" name="con_password" id="con_password" class="form-control" placeholder="Confirm Password" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <input type="date" name="dob" id="dob" class="form-control" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <input type="text" name="contact" id="contact" class="form-control" placeholder="Mobile No." required >
                    </div>
                    <div class="col-lg-6">
                        <select class="form-control" id="gender" name="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>                           
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <textarea class="form-control" name="address" id="address" rows="3">Address...</textarea>
                    </div>
                </div>
                <div id="remember" class="checkbox"> 
                    <label>
                        <input type="checkbox" value="remember-me"> I agree all terms & conditions...<a href="index.jsp">Read More</a>
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Signup</button>
                <p class="text-center">Or</p>
                <a class="btn btn-lg btn-primary btn-block btn-signin"  href="login.jsp" style="line-height: 34px">Login</a>
            </form><!-- /form -->
            <a href="index.jsp" class="forgot-password">
                Back to Home
            </a>
        </div><!-- /card-container -->
             
         </div>
     </div>
        
    </div><!-- /container -->




</body>
</html>

