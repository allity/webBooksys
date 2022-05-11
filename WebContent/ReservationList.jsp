<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> <!-- 선언부 밑에 위치해야한다. -->

<%
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	String covers =  request.getParameter("covers");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String menulist =  request.getParameter("menulist");
	System.out.println(menulist);
	menulist = menulist.replace("#", " ");
	System.out.println(menulist);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
 <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<title>Insert title here</title>
</head>
<body>
<style>
	 body{
		background-image:url('cafe1.jpg');
		background-repeat:no-repeat;
		background-size:cover;
	}
	img{max-height:50%;
		
	}
	.table{
		width:100%;
        height:100px;
        margin:1px 5px 2px 5px;
        text-align:center;
        table-layout:fixed;
	}
</style>
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

<div class="container  p-3 mb-5 text-white" role="main">
	
	<h1>예약조회</h1> 
	<div class="container" style="border-radius: 1em;background-color:rgba(244,244,244,0.9);">
	<form>
  		<table class="table table-hover">
  <thead class="thead">
    <tr>
      <th scope="col"style="width:5%;">#</th>
	  <th scope="col"style="width:15%;">이름</th>
	  <th scope="col"style="width:30%;">예약시간</th>
	  <th scope="col"style="width:10%;">인원</th>
    </tr>
  </thead>
  <tbody>
      <tr>
      <th scope="row"></th>
      <td><%=name%></td>
      <!-- yy-mm-gg-hh:mm -->
      <td><%=date + " " + time%></td>
      <td><%=covers %></td>
    </tr>
  </tbody>
</table>

<table class="table table-hover">
					<thead class="thead">
						<tr align="center">
							<th scope="col" style="width: 100%;" align="center">메뉴 리스트</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<th><%=menulist%></th>
						</tr>
					</tbody>
				</table>
			</form>
	</form>
	
</div>
</div>



    <!-- Optional JavaScript -->
    <!-- 이게 Navbar동작하게 만들어준다-->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="bootstrap-datetimepicker.js"></script>
</body>
</html>