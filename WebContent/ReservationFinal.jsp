<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="TestForServletJP.Order"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%> <!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String username = (String) session.getAttribute("NAME");
	System.out.println(username);
	String useraPW = (String) session.getAttribute("PW");
	String PhonNumber = (String) session.getAttribute("PhoneNumber");
	String valueDate = (String) session.getAttribute("Days");
	String valueTime = (String) session.getAttribute("Times");
	String num = (String) session.getAttribute("PeopleN");
	String pnum = (String) session.getAttribute("PeopleN");
	HashMap<String,Order> Orderlist = (HashMap<String,Order>)session.getAttribute("OrderList");
	ArrayList<String> DBMlist = (ArrayList<String>)session.getAttribute("DBMList");
	Iterator<String> it = Orderlist.keySet().iterator();
	Order order = new Order();

	%>
	<style>
body {
	background-image: url('cafe1.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.page-header {
	padding-top: 9px;
	padding-bottom: 2px;
	margin: 10px 0 10px;
	border-bottom: 1px solid;
}

.card {
	max-height: 80%;
	max-width: 50%;
	border-radius: 1em;
}

.card-img-top {
	max-height: 60%;
}

.card-body {
	overflow: hidden;
	height: 150px;
	margin: 1px 5px 2px 5px;
}
</style>
	<nav
		class="navbar navbar-inverse navbar-fixed-top navbar-light bg-light">
		<a class="navbar-brand" href="Home.jsp">Brunch 79</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="Home.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="Menu.jsp">Menu</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="Reservation.jsp"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Reservation </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="check_time.jsp">예약하기</a> <a
							class="dropdown-item" href="CancelReservation.jsp">예약취소</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="CheckReservation.jsp">예약조회</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<div class="container  p-3 mb-5 text-white" role="main">
		<h1>예약 내용</h1>
		<div class="container text-dark"
			style="height: auto; border-radius: 1em; background-color: rgba(244, 244, 244, 0.9); padding-bottom: 20px;">
			<form>
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th scope="col" style="width: 5%;">#</th>
							<th scope="col" style="width: 15%;">이름</th>
							<th scope="col" style="width: 30%;">예약시간</th>
							<th scope="col" style="width: 10%;">인원</th>
						</tr>
					</thead>
					<tbody>
						<th scope="row"></th>
						<td><%=username%></td>
						<!-- yy-mm-gg-hh:mm -->
						<td><%=valueDate+" "+valueTime%></td>
						<td><%=num%></td>
						</tr>
					</tbody>
				</table>
				<table class="table table-hover">
					<thead class="thead">
						<tr align="center">
							<th scope="col" style="width: 10%;">#</th>
							<th scope="col" style="width: 50%;" align="center">메뉴</th>
							<th scope="col" style="width: 15%;">수량</th>
							<th scope="col" style="width: 25%;">가격</th>

						</tr>
					</thead>
					<tbody>
						<%
    int i=0;
	int sum =0;
	if(Orderlist == null){%>
		<tr align="center">
		<th scope="row">주문하신 내역이 없습니다.</th>
		<%
	}else{
    while(it.hasNext()){
    	i++;
    	String key =  it.next();
    	sum=sum+Orderlist.get(key).getPrice();
    
    %>
						<tr align="center">
							<th scope="row"><%=i%></th>
							<td><%=Orderlist.get(key).getMenu() %></td>
							<td><%=Orderlist.get(key).getNum()%></td>
							<td><%=Orderlist.get(key).getPrice()%></td>
						</tr>
						<%}} %>
						<tr align="center">
							<th scope="row">+</th>
							<td>합계</td>
							<td></td>
							<td><%=sum %></td>
						</tr>
					</tbody>
				</table>
			</form>
			<center>
				<a href="insertReservation.jsp" class="btn btn-primary" >예약 확정</a>
			</center>
		</div>
	</div>



	<!-- Optional JavaScript -->
	<!-- 이게 Navbar동작하게 만들어준다-->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="bootstrap-datetimepicker.js"></script>
</body>
</html>