<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> <!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="TestForServletJP.Order"%>
<%request.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴저장공간</title>
</head>
<body>
<form action="ReservationFinal.jsp">
	<%
	/*주문 추가한 메뉴 orderMenu
	주문 추가한 메뉴 개수 orderNum
	주문한 메뉴 하나 당 가격 orderPrice
	메뉴 코드를 키값으로 갖는 주문내역 해쉬맵 Orderlist
	DB에 들어갈 메뉴 리스트 DBMlist
	*/

	String code = request.getParameter("Menucode");
	String orderMenu = request.getParameter("Menu");
	int orderNum = Integer.parseInt(request.getParameter("MenuNum"));
	int Price = Integer.parseInt(request.getParameter("price"));
	HashMap<String,Order> Orderlist = (HashMap<String,Order>)session.getAttribute("OrderList");
	ArrayList<String> DBMlist = (ArrayList<String>)session.getAttribute("DBMList");
	Order order = new Order();
	//Iterator<Order> it = Orderlist.iterator(); // Iterator(반복자) 생성
	
	if(Orderlist == null)
		Orderlist = new HashMap<String, Order>();
	if(DBMlist == null)
		DBMlist = new ArrayList<String>();
	
	for(int i=0;i<orderNum;i++){
		DBMlist.add(code);
	}
	
	
	/*메뉴리스트는 고객에게 보여줘야하기때문에 메뉴코드로 저장하기엔 무리가 있음. 
	DB와 연동한다면 해당 메뉴코드가 어떤 메뉴인지 끄집어낼수 있지 않을까요?
	혹은 ReservationMenu card에다 메뉴코드 넣어두고 해당 코드를 받아올수도 있음
	이경우 Order클래스에 자료형 추가하면됨
			*/
	order.setMenu(orderMenu);
	order.setNum(orderNum);
	order.setPrice(Price*orderNum);
	/*메뉴 코드를 조회해서 있다면 수량을 증가*/
	/*Orderlist.containsKey(code) String에 대해서 제대로 작동안함.*/

	Order containstest = Orderlist.get(code);
	if(containstest != null){
		Orderlist.get(code).setNum(Orderlist.get(code).getNum()+orderNum);
		Orderlist.get(code).setPrice(Orderlist.get(code).getPrice()+order.getPrice());
	}else{
		Orderlist.put(code,order);		
	}

	session.setAttribute("OrderList",Orderlist);
	session.setAttribute("DBMList",DBMlist);
	%>
	    <script>
            alert("메뉴가 추가 되었습니다");
            history.back();
        </script>

</form>
</body>
</html>