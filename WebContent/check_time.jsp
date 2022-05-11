<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.ArrayList" %>


			


			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList <String> time = new ArrayList <String>();
	time.add("18:00:00");
	time.add("19:00:00");
	time.add("20:00:00");
	time.add("21:00:00");
	time.add("22:00:00");
	
	String one="";
	String two="";
	String three="";
	String four="";
	String five="";
	
	int count = 0;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	PreparedStatement pstmt5 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	ResultSet rs5 = null;
	
	String jdbcDriver="jdbc:mariadb://localhost:3305/booksys";
	String User="root";
	String Password="3324dlsghks";
	
	try
	{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcDriver, User, Password);
		
		String sql = "select * from booksys.reservation where time=? or time=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setTime(1, Time.valueOf(time.get(0)));
		pstmt.setTime(2, Time.valueOf(time.get(1)));
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			count++;
		}
		
		if(count == 10)
		{
			one="18:00:00";
		}
		
		count=0;
		
		sql = "select * from booksys.reservation where time=? or time=? or time=?";
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setTime(1, Time.valueOf(time.get(0)));
		pstmt2.setTime(2, Time.valueOf(time.get(1)));
		pstmt2.setTime(3, Time.valueOf(time.get(2)));
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			count++;
		}
		
		if(count == 10)
		{
			two="19:00:00";
		}
		
		count = 0;
		
		sql = "select * from booksys.reservation where time=? or time=? or time=?";
		pstmt3 = conn.prepareStatement(sql);
		pstmt3.setTime(1, Time.valueOf(time.get(1)));
		pstmt3.setTime(2, Time.valueOf(time.get(2)));
		pstmt3.setTime(3, Time.valueOf(time.get(3)));
		rs3 = pstmt3.executeQuery();
		
		while(rs3.next())
		{
			count++;
		}
		
		if(count == 10)
		{
			three="20:00:00";
		}
		
		count = 0;
		
		sql = "select * from booksys.reservation where time=? or time=? or time=?";
		pstmt4 = conn.prepareStatement(sql);
		pstmt4.setTime(1, Time.valueOf(time.get(2)));
		pstmt4.setTime(2, Time.valueOf(time.get(3)));
		pstmt4.setTime(3, Time.valueOf(time.get(4)));
		rs4 = pstmt4.executeQuery();
		
		while(rs4.next())
		{
			count++;
		}
		
		if(count == 10)
		{
			four="21:00:00";
		}
		
		count = 0;
		
		sql = "select * from booksys.reservation where time=? or time=?";
		pstmt5 = conn.prepareStatement(sql);
		pstmt5.setTime(1, Time.valueOf(time.get(3)));
		pstmt5.setTime(2, Time.valueOf(time.get(4)));
		rs5 = pstmt5.executeQuery();
		
		while(rs5.next())
		{
			count++;
		}
		
		if(count == 10)
		{
			five="22:00:00";
		}
		
		count = 0;
		
		time.remove(one);
		time.remove(two);
		time.remove(three);
		time.remove(four);
		time.remove(five);
		
		for(int a = 0; a < time.size(); a++){
			System.out.println(time.get(a));
		}
		session.setAttribute("time",time);
		
		%>
		<script type="text/javascript">
			location.href="Reservation.jsp";
		</script>
		<%
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(rs2 != null) try{rs2.close();}catch(SQLException sqle){}
		if(rs3 != null) try{rs3.close();}catch(SQLException sqle){}
		if(rs4 != null) try{rs4.close();}catch(SQLException sqle){}
		if(rs5 != null) try{rs5.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(pstmt2 != null) try{pstmt2.close();}catch(SQLException sqle){}
		if(pstmt3 != null) try{pstmt3.close();}catch(SQLException sqle){}
		if(pstmt4 != null) try{pstmt4.close();}catch(SQLException sqle){}
		if(pstmt5 != null) try{pstmt5.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}
%>	
</body>
</html>
