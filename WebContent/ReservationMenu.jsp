<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>  
<%@page import="java.util.List"%> <!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
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
<%
	request.setCharacterEncoding("UTF-8");
class Order{
	private String Menu;
	private int num;
	private int price;
}
	session.setAttribute("NAME", request.getParameter("username1"));
	session.setAttribute("PW", request.getParameter("PW1"));
	session.setAttribute("PhoneNumber", request.getParameter("PhoneNumber1"));
	session.setAttribute("PeopleN", request.getParameter("usernum"));
	session.setAttribute("Days", request.getParameter("day1"));
	session.setAttribute("Times", request.getParameter("time1"));
	//session.setAttribute("MenuList", request.getParameter("Menulist"));
	//session.setAttribute("DBMList",request.getParameter("DBMlist"));
	
	String username = (String)session.getAttribute("NAME");
	String valueDate = (String)session.getAttribute("Days");
	String valueTime = (String)session.getAttribute("Times");
	String num = (String)session.getAttribute("PeopleN");
%>
<style>
    body{
        background-image:url('cafe1.jpg');
        background-repeat:no-repeat;
        background-size:cover;
    }
    .page-header{
        padding-top:9px;
        padding-bottom:2px;
        margin:10px 0 10px;
        border-bottom:1px solid;
    }
    .card{
        max-height:100%;
        max-width: 30%;
        border-radius: 1em;

    }
	.card-img-top{
        height:70%;

    }
    .card-body{
		overflow: hidden;
        height: 40%;
        margin: 1px 5px 2px 5px;
    }
    .card-title{
   		 white-space: nowrap;
		overflow: hidden;
        text-overflow: ellipsis;
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
<%
//비워둔거 없는지 체크
if(username==""||valueDate==""||valueTime==""||num==""||(String)session.getAttribute("PW")==""){
		%>
				<script type="text/javascript">
			alert("입력하지 않은 양식이 있습니다.이전 페이지로 돌아갑니다.")
		location.href="Reservation.jsp";
			</script>
		<%
	}
%>
<div class="container  p-3 mb-5 text-white" role="main">
    <h1>메뉴선택</h1>
    <div class="container text-dark" style="height: auto; border-radius: 1em;
        background-color:rgba(244,244,244,0.9);padding-bottom: 20px;">
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
      <th scope="row">1</th>
      <td><%=username%></td>
      <!-- yy-mm-gg-hh:mm -->
      <td><%=valueDate+" "+valueTime%></td>
      <td><%=num%></td>
    </tr>
    </tbody>
    </table>
<center>
	<a href="ReservationFinal.jsp" class="btn btn-primary" >Submit</a>
	<hr color="gray">
    </center>
	</form>
        <ul class="nav nav-tabs" >
            <li class="nav-item" >
                <a class="nav-link" id="meal-tab" role="tab" data-toggle="tab" href="#Meal"
                   aria-controls="Meal" aria-selected="true">Meal</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="salad-tab" role="tab" data-toggle="tab" href="#Salad"
                   aria-controls="Salad" aria-selected="false">Salad</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="coffee-tab" role="tab" data-toggle="tab" href="#Coffee"
                   aria-controls="Coffee" aria-selected="false">Coffee</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="softdrink-tab" role="tab" data-toggle="tab" href="#SoftDrink"
                   aria-controls="SoftDrink" aria-selected="false">Soft Drink</a>
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="Meal" aria-labelledby="meal-tab">
                <div class="page-header">
                    <h3>Meal</h3>
                </div>
                <div class="card-deck p-2 mb-4 ">
                    <div class="card mb-3">
                        <img src="Franch Toast.jpg" class="card-img-top" alt="..." >
                        <div class="card-body">
                            <div class="card-title">Franch Toast</div>
                            <p class="card-text">
                                <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                                   <input type="hidden"  name="price" value="9000"/>
                                   <input type="hidden"  name="Menucode" value="1"/>
                                   <input type="hidden"  name="Menu" value="Franch Toast"/>
                            <div class="col-auto">
                                <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                    <option selected>개수</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                            <button type="submit"class="btn btn-primary btn-sm">선택</button>
                                </div>
                                </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="Chicken Chiabatta.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">Chicken Chiabatta</div>
                            <p class="card-text">
                            <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="12000"/>
                                   <input type="hidden"  name="Menucode" value="3"/>
                                   <input type="hidden"  name="Menu" value="Chicken Chiabata"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit"class="btn btn-primary btn-sm" >선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="Bacon cheese Omelette.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">Bacon cheese Omelette</div>
                            <p class="card-text">
                             <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="11000"/>
                                   <input type="hidden"  name="Menucode" value="4"/>
                                   <input type="hidden"  name="Menu" value="Bacon cheese Omelet"/>
                                    <div class="col-auto">
                                        <select name="MenuNum"  class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                      <div class="card mb-3">
                        <img src="Icecream Waffle.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">Icecream Waffle</div>
                            <p class="card-text">
                             <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="9900"/>
                                   <input type="hidden"  name="Menucode" value="5"/>
                                   <input type="hidden"  name="Menu" value="Icecream Waffle"/>
                                    <div class="col-auto">
                                        <select name="MenuNum"  class="custom-select mr-sm-2 " id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>
                
              
            </div>
            <div class="tab-pane fade" id="Salad" aria-labelledby="salad-tab">
                <div class="page-header">
                    <h3>Salad</h3>
                </div>
                <div class="card-deck p-2 mb-4">
                    <div class="card mb-3 ">
                        <img src="Ricotta cheese Salad.jpg" class="card-img-top" alt="..." >
                        <div class="card-body">
                            <div class="card-title">Ricotta cheese Salad</div>
                            <p class="card-text">
							 <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="11000"/>
                                   <input type="hidden"  name="Menucode" value="2"/>
                                   <input type="hidden"  name="Menu" value="Ricotta cheese Salad"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="Basil pasta Salad1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">Basil pasta Salad</div>
                            <p class="card-text">
                            <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="12000"/>
                                   <input type="hidden"  name="Menucode" value="6"/>
                                   <input type="hidden"  name="Menu" value="Basil pasta Salad"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="Coffee" aria-labelledby="coffee-tab">
                <div class="page-header">
                    <h3>Coffee</h3>
                </div>
                <div class="card-deck p-2 mb-4">
                    <div class="card mb-3">
                        <img src="Americano.jpg" class="card-img-top" alt="..." >
                        <div class="card-body">
                            <div class="card-title">Americano</div>
                            <p class="card-text">
								<form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3000"/>
                                   <input type="hidden"  name="Menucode" value="7"/>
                                   <input type="hidden"  name="Menu" value="Americano"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="CafeLatte.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">CafeLatte</div>
                            <p class="card-text">
                            <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3500"/>
                                   <input type="hidden"  name="Menucode" value="8"/>
                                   <input type="hidden"  name="Menu" value="CafeLatte"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="VanillaLatte.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">VanillaLatte</div>
                            <p class="card-text">
                             <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3500"/>
                                   <input type="hidden"  name="Menucode" value="9"/>
                                   <input type="hidden"  name="Menu" value="VanillaLatte"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>
                                <div class="card-deck p-2 mb-4">
                    <div class="card mb-3">
                        <img src="CafeMocha.jpg" class="card-img-top" alt="..." >
                        <div class="card-body">
                            <div class="card-title">CafeMocha</div>
                            <p class="card-text">
								<form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3500"/>
                                   <input type="hidden"  name="Menucode" value="10"/>
                                   <input type="hidden"  name="Menu" value="CafeMocha"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="Caramel Macchiato.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="card-title">Caramel Macchiato</div>
                            <p class="card-text">
                            <form action="sub.jsp" method="post">
                                <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="4000"/>
                                   <input type="hidden"  name="Menucode" value="11"/>
                                   <input type="hidden"  name="Menu" value="CaramelMachiatto"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
			<div class="tab-pane fade" id="SoftDrink" aria-labelledby="softdrink-tab">
                <div class="page-header">
                    <h3>Soft Drink</h3>
                </div>
                <div class="card-deck p-2 mb-4">
                    <div class="card mb-3">
                        <img src="LemonAde.jpg" class="card-img-top" alt="..." >
                        <div class="card-body">
                            <div class="card-title">LemonAde</div>
                            <p class="card-text">
                             <form action="sub.jsp" method="post">
	                               <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3500"/>
                                   <input type="hidden"  name="Menucode" value="12"/>
                                   <input type="hidden"  name="Menu" value="LemonAde"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="Greengrape Ade.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h7 class="card-title">GrapefruitAde</h7>
                            <p class="card-text">
                            <form action="sub.jsp" method="post">
	                               <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3500"/>
                                   <input type="hidden"  name="Menucode" value="13"/>
                                   <input type="hidden"  name="Menu" value="GrapefruitAde"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="OrangeAde.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h7 class="card-title">OrangeAde</h7>
                            <p class="card-text">
                            <form action="sub.jsp" method="post">
	                               <div class="form-row align-items-center">
                               	   <input type="hidden"  name="price" value="3500"/>
                                   <input type="hidden"  name="Menucode" value="14"/>
                                   <input type="hidden"  name="Menu" value="OrangeAde"/>
                                    <div class="col-auto">
                                        <select name="MenuNum" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>개수</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">선택</button>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
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