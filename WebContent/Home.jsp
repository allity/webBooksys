<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date" %>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>welcome Brunch 79</title>
</head>

<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	ResultSet rs = null;

	String jdbcDriver="jdbc:mariadb://localhost:3305/booksys";
	String User="root";
	String Password="3324dlsghks";
	
	Calendar now = Calendar.getInstance();
	   int year = now.get(Calendar.YEAR);
	   int month = now.get(Calendar.MONTH);
	   int day = now.get(Calendar.DAY_OF_MONTH);
	   
	   month= month + 1;
	   
	   if(day == 1)
	   {
	      if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
	      {
	         if(month == 1){
	            month = 12;
	         }
	         else
	            month = month -1;
	         day = 31;
	      }
	      else
	      {
	         month = month - 1;
	         day = 32;
	      }
	   }
	   String date = year+"-"+month+"-"+(day-1);
	   Date d = Date.valueOf(date);

	try
	{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcDriver, User, Password);
		
		String sql = "select oid from booksys.reservation where date = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setDate(1, d);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			int r_oid = rs.getInt("oid");
			sql = "delete from booksys.reservation where date = ?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setDate(1, d);
			pstmt2.executeQuery();
			
			sql = "delete from booksys.order where r_oid = ?";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, r_oid);
			pstmt3.executeQuery();
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(pstmt2 != null) try{pstmt2.close();}catch(SQLException sqle){}
		if(pstmt3 != null) try{pstmt3.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}
%>
<style>
body{
		background-image:url('cafe1.jpg');
		background-repeat:no-repeat;
		background-size:cover;
	}
	img{max-height:50%;
		max-width:auto;
	}
	container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
	}
	jumbotron{
	border-top-style:solid;
	text-align:center;
	padding: 30px 15px;
	margin-bottom: 20px;
	}
	footer{
	display:block;
	padding-top: 40px;
	padding-bottom: 40px;
	margin-top:40px;
	border-top: 1px solid;
	border-top-width:1px;
	border-top-style:solid;
	border-top-color:rgb(238,238,238);
	}
</style>

<!-- nav bar -->
<nav class="navbar navbar-inverse navbar-fixed-top navbar-light bg-light">
  <a class="navbar-brand" href="Home.jsp">Brunch 79</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Menu.jsp">Menu</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="Reservation.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Reservation
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="check_time.jsp">예약하기</a>
          <a class="dropdown-item" href="CancelReservation.jsp">예약취소</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="CheckReservation.jsp">예약조회</a>
        </div>
      </li>
    </ul>
  </div>
</nav>

<div class="container  p-3 mb-5" role="main">
	<div style="background-color:rgba(244,244,244,0.5)" class="jumbotron" >
		<h1>Hello, Brunch 79!</h1>
		<p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet.</p>
	</div>

<div class="shadow-none p-3 mb-5 text-white">
<div class="card-deck p-6 text-muted">
 <div class="card" style="width: 18rem;">
  <img src="home1.jpg" class="card-img-top" alt="..." >
  <div class="card-body">
    <h5 class="card-title">예약하기</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="check_time.jsp" class="btn btn-primary">Go reservation</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="home2.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">예약조회</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="CheckReservation.jsp" class="btn btn-primary">Check reservation</a>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="home3.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">예약취소</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="CancelReservation.jsp" class="btn btn-primary">cancel reservation</a>
  </div>
</div>
</div>
</div>


<footer class="footer text-white">
<p>Team Brunch 79</p>
</footer>
</div>

    <!-- Optional JavaScript -->
    <!-- 이게 Navbar동작하게 만들어준다-->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>