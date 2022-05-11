<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ArrayList" %>
<%request.setCharacterEncoding("UTF-8");%>

<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dayformat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeformat = new SimpleDateFormat("HH:mm");
	cal.setTime(new Date());
	String valuedays = dayformat.format(cal.getTime());
	String valuetime = timeformat.format(cal.getTime());
	cal.add(Calendar.DATE,-1);
	String mindays= dayformat.format(cal.getTime());
	cal.add(Calendar.MONTH,2);
	String maxdays= dayformat.format(cal.getTime());
	ArrayList<String> time = (ArrayList<String>)session.getAttribute("time");
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
        max-width:auto;
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
    <h1>예약하기</h1>
    <div class="container">
    <!-- 여기부분을 수정해야할거같은데 -->
        <form action="Check_N_C.jsp" method="post">
            <div class="form-group">
                <label for="InputphoneNumber">전화번호(Phone Number)</label>
                <input type="number" name="PhoneNumber1" class="form-control" id="phone_number" placeholder="Enter phone number '-'없이 입력해주세요.">
            </div>
            <div class="form-group">
                <label for="InputName">이름(Name)</label>
                <input type="text" name="username1" class="form-control" id="Name" placeholder="Enter Name">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" name="PW1"class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-group">
      			<label for="InputNum">인원수(Number of people)</label>
                <input type="number" name="usernum" class="form-control" id="user_number" placeholder="Enter number">
   			 </div>
			<input type="date" value=<%=valuedays%> min=<%=valuedays+1%> max=<%=maxdays%> name="day1">
			<select name="time1" id="inlineFormCustomSelect" width="">
				<option selected="selected">예약 가능시간</option>
				<% for(int i = 0; i < time.size(); i++)
				{%>
					<option value="<%=time.get(i)%>"><%=time.get(i)%></option>
				<%}%>
			</select><br></br>
			<button type="submit" class="btn btn-primary"  onclick="Check()">Submit</button>
		<script type="text/javascript">
		function Check(){
			if(PhoneNumber1 ==""){
				alert("핸드폰번호를 입력해주세요.")
			}else if(username1 == ""){
				alert("예약자명을 입력해주세요.")
			}else if(PW1==""){
				alert("비밀번호를 입력해주세요.")
			}else if(usernum==""){
				alert("예약 인원수를 입력해주세요.")
			}
		}
  		</script>
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