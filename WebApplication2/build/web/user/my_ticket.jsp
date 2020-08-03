<%@page import="java.sql.*" %>
<%! String flight_name, company_name, source_city, destination_city, email,name, dep_time, arr_time, booking_time, p_name, p_phone, p_id, p_dob, p_gender ; int id, tid,price, flight_no, booking_no, source, destination, count; %>
<%
if((session.getAttribute("email")==null || (String)session.getAttribute("email")=="")&& (session.getAttribute("type")==null || (String)session.getAttribute("type")=="" ||(String)session.getAttribute("type")!="user"))
{
    response.sendRedirect("../login.jsp");
}
email = (String)session.getAttribute("email");
if(request.getParameter("tid")!=null){

tid = Integer.parseInt(request.getParameter("tid"));



try{
    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_system","root","");

Statement stmt1=con.createStatement();
	  
String sql1="select user_name, user_id from user where user_email='"+email+"'";
ResultSet rs1=stmt1.executeQuery(sql1); 
if(rs1.next()){
name=rs1.getString(1);
id= rs1.getInt(2);
}

Statement stmt2=con.createStatement();
	  
String sql2="SELECT flight_name, (SELECT coumpany_name FROM airline_company WHERE company_name=company_id) AS Company, (SELECT city_name FROM city WHERE city_id=source),(SELECT city_name FROM city WHERE city_id=destination) , price, dep_time, arr_time, flight.flight_id, booking.booking_id, booking_time, passenger_name, passenger_phone, passenger_id, passenger_gender, passenger_dob FROM flight, booking WHERE flight.flight_id=booking.flight_id AND booking.user_id="+id+" AND booking.booking_id="+tid;
ResultSet rs2=stmt2.executeQuery(sql2); 
count = 0;
if(rs2.next()){
count++;
    flight_name = rs2.getString(1);
    company_name = rs2.getString(2);
    source_city = rs2.getString(3);
    destination_city = rs2.getString(4);
    price = rs2.getInt(5);
    dep_time = rs2.getString(6);
    arr_time = rs2.getString(7);
    flight_no = rs2.getInt(8);
    booking_no = rs2.getInt(9);
    booking_time = rs2.getString(10);
    p_name = rs2.getString(11);
    p_phone = rs2.getString(12);
    p_id = rs2.getString(13);
    p_gender = rs2.getString(14);
    p_dob = rs2.getString(15);
}
if(count==0){
    flight_name = "";
    company_name = "";
    source_city = "";
    destination_city = "";
    price = 0;
    dep_time = "";
    arr_time = "";
    flight_no = 0;
    booking_no = 0;
    booking_time = "";
    p_name = "";
    p_phone = "";
    p_id = "";
    p_gender = "";
    p_dob = "";
    
}
con.close();
}catch(Exception e){
}
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    
    <title>User Home: Ticket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="assets/js/jquery.min.js"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    	body{
    margin-top:20px;
    background:#eee;
}

.invoice {
    background: #fff;
    padding: 20px
}

.invoice-company {
    font-size: 20px
}

.invoice-header {
    margin: 0 -20px;
    background: #f0f3f4;
    padding: 20px
}

.invoice-date,
.invoice-from,
.invoice-to {
    display: table-cell;
    width: 1%
}

.invoice-from,
.invoice-to {
    padding-right: 20px
}

.invoice-date .date,
.invoice-from strong,
.invoice-to strong {
    font-size: 16px;
    font-weight: 600
}

.invoice-date {
    text-align: right;
    padding-left: 20px
}

.invoice-price {
    background: #f0f3f4;
    display: table;
    width: 100%
}

.invoice-price .invoice-price-left,
.invoice-price .invoice-price-right {
    display: table-cell;
    padding: 20px;
    font-size: 20px;
    font-weight: 600;
    width: 75%;
    position: relative;
    vertical-align: middle
}

.invoice-price .invoice-price-left .sub-price {
    display: table-cell;
    vertical-align: middle;
    padding: 0 20px
}

.invoice-price small {
    font-size: 12px;
    font-weight: 400;
    display: block
}

.invoice-price .invoice-price-row {
    display: table;
    float: left
}

.invoice-price .invoice-price-right {
    width: 25%;
    background: #2d353c;
    color: #fff;
    font-size: 28px;
    text-align: right;
    vertical-align: bottom;
    font-weight: 300
}

.invoice-price .invoice-price-right small {
    display: block;
    opacity: .6;
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 12px
}

.invoice-footer {
    border-top: 1px solid #ddd;
    padding-top: 10px;
    font-size: 10px
}

.invoice-note {
    color: #999;
    margin-top: 80px;
    font-size: 85%
}

.invoice>div:not(.invoice-footer) {
    margin-bottom: 20px
}

.btn.btn-white, .btn.btn-white.disabled, .btn.btn-white.disabled:focus, .btn.btn-white.disabled:hover, .btn.btn-white[disabled], .btn.btn-white[disabled]:focus, .btn.btn-white[disabled]:hover {
    color: #2d353c;
    background: #fff;
    border-color: #d9dfe3;
}
    </style>
</head>
<body>
    <% if(count!=0){%>
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
   <div class="col-md-12">
      <div class="invoice">
         <!-- begin invoice-company -->
         <div class="invoice-company text-inverse f-w-600">
            <span class="pull-right hidden-print">
            <a href="javascript:;" class="btn btn-sm btn-white m-b-10 p-l-5"><i class="fa fa-file t-plus-1 text-danger fa-fw fa-lg"></i> Export as PDF</a>
            <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-white m-b-10 p-l-5"><i class="fa fa-print t-plus-1 fa-fw fa-lg"></i> Print</a>
            </span>
             <h1 style="color:#0cc">Airline System</h1>
         </div>
         <!-- end invoice-company -->
         <div class="invoice-header">
            <div class="invoice-from">
               <small>Name</small>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse"><%=name%></strong><br>
                  <%=email%><br>
               </address>
            </div>
            <div class="invoice-to">
               <small></small>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse"></strong><br>
                 
               </address>
            </div>
            <div class="invoice-date">
               <small>Ticket Detail</small>
               <div class="date text-inverse m-t-5"><%=booking_time%></div>
               <div class="invoice-detail">
                   Ticket No- 
                   #<%=booking_no%><br>
                  
               </div>
            </div>
         </div>
         <!-- begin invoice-header -->
         <div class="invoice-header">
            <div class="invoice-from">
               <small>From</small>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse"><%=company_name%></strong><br>
                  Phone: (123) 456-7890<br>
                  Fax: (123) 456-7890
               </address>
            </div>
            <div class="invoice-to">
               <small>To</small>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse"><%=source_city%></strong><br>
                  <%=dep_time%><br>
                  
               </address>
            </div>
            <div class="invoice-date">
               <small>From</small>
               <div class="date text-inverse m-t-5"><%=destination_city%></div>
               <div class="invoice-detail">
                   <%=arr_time%><br>
                  
               </div>
            </div>
         </div>
         <!-- end invoice-header -->
         <!-- begin invoice-header -->
         <div class="invoice-header">
            <div class="invoice-from">
               <small>Passenger Detail</small>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse"><%=p_name%></strong><br>
                  Date of Birth : (<%=p_dob%>)<br>
                  Gender : <%=p_gender%><br>
                  Email : <%=p_id%><br>
                  Phone : <%=p_phone%>
               </address>
            </div>
            
            
         </div>
         <!-- end invoice-header -->
         <!-- begin invoice-content -->
         <div class="invoice-content">
            <!-- begin table-responsive -->
            <div class="table-responsive">
               <table class="table table-invoice">
                  <thead>
                     <tr>
                        <th>Amount Detail</th>
                        
                        <th class="text-right" width="20%">TOTAL</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>
                           <span class="text-inverse">Base Fare</span><br>
                           <small></small>
                        </td>
                        
                        
                        <td class="text-right"><%=price%>.0 INR</td>
                     </tr>
                     
                     <tr>
                        <td>
                           <span class="text-inverse">Tax</span><br>
                           <small></small>
                        </td>
                        
                        <td class="text-right">0.00 INR</td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!-- end table-responsive -->
            <!-- begin invoice-price -->
            <div class="invoice-price">
               <div class="invoice-price-left">
                  <div class="invoice-price-row">
                     <div class="sub-price">
                        <small>SUBTOTAL</small>
                        <span class="text-inverse"><%=price%>.0 INR</span>
                     </div>
                     <div class="sub-price">
                        <i class="fa fa-plus text-muted"></i>
                     </div>
                     <div class="sub-price">
                        <small>PAYPAL FEE (0.0%)</small>
                        <span class="text-inverse">0.00 INR</span>
                     </div>
                  </div>
               </div>
               <div class="invoice-price-right">
                  <small>TOTAL</small> <span class="f-w-600"><%=price%>.0 INR</span>
               </div>
            </div>
            <!-- end invoice-price -->
         </div>
         <!-- end invoice-content -->
         <!-- begin invoice-note -->
         <div class="invoice-note">
            * Make all cheques payable to [Your Company Name]<br>
            * Payment is due within 30 days<br>
            * If you have any questions concerning this invoice, contact  [Name, Phone Number, Email]
         </div>
         <!-- end invoice-note -->
         <!-- begin invoice-footer -->
         <div class="invoice-footer">
            <p class="text-center m-b-5 f-w-600">
               THANK YOU FOR YOUR BUSINESS
            </p>
            <p class="text-center">
               <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i> www.myflight.com</span>
               <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone-volume"></i> +91- 7084594331</span>
               <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> myflight@gmail.com</span>
            </p>
         </div>
         <!-- end invoice-footer -->
      </div>
   </div>
</div>

<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
<%}
else{%>
<h1>Error.. Go to <a href="user_home.jsp">Home</a></h1>
<%
}%>
</body>
</html>