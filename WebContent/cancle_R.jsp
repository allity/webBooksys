<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone =  request.getParameter("phone");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;

	
	String jdbcDriver="jdbc:mariadb://localhost:3305/booksys";
	String User="root";
	String Password="3324dlsghks";
	
	try
	{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcDriver, User, Password);
		
		String sql = "select oid from customer where name = ? and phoneNumber = ? and password = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, pw);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			int c_oid = rs.getInt("oid");
			
			sql = "select oid from booksys.reservation where customer_id = ?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, c_oid);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next())
			{
				int r_oid = rs2.getInt("oid");
				
				sql = "delete from booksys.reservation where customer_id = ?";
				pstmt3 = conn.prepareStatement(sql);
				pstmt3.setInt(1, c_oid);
				pstmt3.executeQuery();
				
				sql = "delete from booksys.order where r_oid = ?";
				pstmt4 = conn.prepareStatement(sql);
				pstmt4.setInt(1, r_oid);
				pstmt4.executeQuery();
				%>
				<script type="text/javascript">
					alert("예약이 취소되었습니다.")
				 	location.href="Home.jsp";
				</script>
			<%}
			else
			{%>
				<script type="text/javascript">
					alert("예약 내역이 없습니다.")
					 location.href="Home.jsp";
				</script>
			<%}
		}
		else
		{%>
			<script type="text/javascript">
				alert("정보를 잘못 입력하셨습니다.")
				history.back()
			</script>
		<%}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(rs2 != null) try{rs2.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(pstmt2 != null) try{pstmt2.close();}catch(SQLException sqle){}
		if(pstmt3 != null) try{pstmt3.close();}catch(SQLException sqle){}
		if(pstmt4 != null) try{pstmt4.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}
%>	
</body>
</html>