<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="TestForServletJP.Order"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date" %>
<%@page import="java.sql.Time" %>
<%@page import="java.util.stream.IntStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String username = (String) session.getAttribute("NAME");
	String userPW = (String) session.getAttribute("PW");
	String PhoneNumber = (String) session.getAttribute("PhoneNumber");
	String valueDate = (String) session.getAttribute("Days");
	Date d = Date.valueOf(valueDate);
	String valueTime = (String) session.getAttribute("Times");
	Time t = Time.valueOf(valueTime);
	int num = Integer.parseInt((String)session.getAttribute("PeopleN"));
	HashMap<String,Order> Orderlist = (HashMap<String,Order>)session.getAttribute("OrderList");
	ArrayList<String> DBMlist = (ArrayList<String>)session.getAttribute("DBMList");
	Iterator<String> it = Orderlist.keySet().iterator();
	Order order = new Order();
	
	int oid = 0;
	int c_oid = 0;
	
	Connection conn = null;
	PreparedStatement [] pt = new PreparedStatement [10];
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	PreparedStatement pstmt5 = null;
	PreparedStatement pstmt6 = null;
	PreparedStatement pstmt7 = null;
	PreparedStatement pstmt8 = null;
	PreparedStatement pstmt9 = null;
	PreparedStatement pstmt10 = null;
	PreparedStatement pstmt11 = null;
	PreparedStatement pstmt12 = null;
	PreparedStatement pstmt13 = null;
	PreparedStatement pstmt14 = null;
	PreparedStatement pstmt15 = null;
	pt[0] = pstmt4;
	pt[1] = pstmt5;
	pt[2] = pstmt6;
	pt[3] = pstmt7;
	pt[4] = pstmt8;
	pt[5] = pstmt9;
	pt[6] = pstmt10;
	pt[7] = pstmt11;
	pt[8] = pstmt12;
	pt[9] = pstmt13;
	
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	ArrayList <Integer> table = new ArrayList <Integer>();
	int tnum=0;
	
	
	
	String jdbcDriver="jdbc:mariadb://localhost:3305/booksys";
	String User="root";
	String Password="3324dlsghks";
	
	try
	{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcDriver, User, Password);
		

		String sql = "update oid set last_id = last_id + 1";
		pstmt14 = conn.prepareStatement(sql);
		pstmt14.executeUpdate();
		
		sql = "select * from oid";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			oid = rs.getInt("last_id");
		}
		
		sql = "select oid from customer where name = ? and phoneNumber = ? and password = ?";
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setString(1, username);
		pstmt2.setString(2, PhoneNumber);
		pstmt2.setString(3, userPW);
		rs2 = pstmt2.executeQuery();
		
		if(rs2.next())
		{
			c_oid = rs2.getInt("oid");
		}
		
		if(valueTime.equals("18:00:00"))
		{
			String t1 = valueTime;
			String t2 = valueTime.replace("8", "9");
			System.out.println(t2+"Zz");
			sql = "select table_id from booksys.reservation where time = ? or time = ?";
			pstmt15 = conn.prepareStatement(sql);
			pstmt15.setTime(1, Time.valueOf(t1));
			pstmt15.setTime(2, Time.valueOf(t2));
			rs3 = pstmt15.executeQuery();
		}
		else if(valueTime.equals("19:00:00"))
		{
			String t1 = valueTime.replace("9", "8");
			String t2 = valueTime;
			String t3 = valueTime.replace("19", "20");
			sql = "select table_id from booksys.reservation where time = ? or time = ? or time = ?";
			pstmt15 = conn.prepareStatement(sql);
			pstmt15.setTime(1, Time.valueOf(t1));
			pstmt15.setTime(2, Time.valueOf(t2));
			pstmt15.setTime(3, Time.valueOf(t3));
			rs3 = pstmt15.executeQuery();
		}
		else if(valueTime.equals("20:00:00"))
		{
			String t1 = valueTime.replace("20", "19");
			String t2 = valueTime;
			String t3 = valueTime.replace("20", "21");
			sql = "select table_id from booksys.reservation where time = ? or time = ? or time = ?";
			pstmt15 = conn.prepareStatement(sql);
			pstmt15.setTime(1, Time.valueOf(t1));
			pstmt15.setTime(2, Time.valueOf(t2));
			pstmt15.setTime(3, Time.valueOf(t3));
			rs3 = pstmt15.executeQuery();
		}
		else if(valueTime.equals("21:00:00"))
		{
			String t1 = valueTime.replace("21", "20");
			String t2 = valueTime;
			String t3 = valueTime.replace("21", "22");
			sql = "select table_id from booksys.reservation where time = ? or time = ? or time = ?";
			pstmt15 = conn.prepareStatement(sql);
			pstmt15.setTime(1, Time.valueOf(t1));
			pstmt15.setTime(2, Time.valueOf(t2));
			pstmt15.setTime(3, Time.valueOf(t3));
			rs3 = pstmt15.executeQuery();
		}
		else
		{
			String t1 = valueTime.replace("22", "21");
			String t2 = valueTime;
			sql = "select table_id from booksys.reservation where time = ? or time = ?";
			pstmt15 = conn.prepareStatement(sql);
			pstmt15.setTime(1, Time.valueOf(t1));
			pstmt15.setTime(2, Time.valueOf(t2));
			rs3 = pstmt15.executeQuery();
		}
		
		int l = 0;
		while(rs3.next())
		{
			int t_oid = rs3.getInt("table_id");
			table.add(t_oid);
			l++;
		}
		
		for(int i = 0; i<table.size(); i++)
			System.out.println(table.get(i));
		
		for(int i = 1; i <= 10; i++)
		{
			if(!table.contains(i))
			{
				tnum=i;
				break;
			}
		}
		
		
		
		if(tnum == 0)
		{%>
			<script type="text/javascript">
				alert("빈 테이블이 없습니다. 매장으로 문의 부탁드립니다.")
	  			location.href="Home.jsp";
			</script>
		<%}
		else{			
			sql = "insert into reservation (oid, covers, date, time, table_id, customer_id) values (?, ?, ?, ?, ?, ?)";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, oid);
			pstmt3.setInt(2, num);
			pstmt3.setDate(3, d);
			pstmt3.setTime(4, t);
			pstmt3.setInt(5, tnum);
			pstmt3.setInt(6, c_oid);
			pstmt3.executeUpdate();
		
			
		
			String key = "";
			int p = 0;
			for(int i = 0; i < Orderlist.size(); i++)
			{
				key = it.next();
				for(int j = 0; j < Orderlist.get(key).getNum(); j++)
				{
					PreparedStatement ps = pt[p];
					sql = "insert into booksys.order (r_oid, m_oid) values (?, ?)";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, oid);
					ps.setInt(2, Integer.parseInt(key));
					ps.executeUpdate();
					p++;
				}
			}
			%>
			<script type="text/javascript">alert("예약이 완료되었습니다.")
  				 location.href="Home.jsp";</script><%
  				session.invalidate();
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(rs2 != null) try{rs2.close();}catch(SQLException sqle){}
		if(rs3 != null) try{rs3.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(pstmt2 != null) try{pstmt2.close();}catch(SQLException sqle){}
		if(pstmt3 != null) try{pstmt3.close();}catch(SQLException sqle){}
		if(pstmt4 != null) try{pstmt4.close();}catch(SQLException sqle){}
		if(pstmt5 != null) try{pstmt5.close();}catch(SQLException sqle){}
		if(pstmt6 != null) try{pstmt6.close();}catch(SQLException sqle){}
		if(pstmt7 != null) try{pstmt7.close();}catch(SQLException sqle){}
		if(pstmt8 != null) try{pstmt8.close();}catch(SQLException sqle){}
		if(pstmt9 != null) try{pstmt9.close();}catch(SQLException sqle){}
		if(pstmt10 != null) try{pstmt10.close();}catch(SQLException sqle){}
		if(pstmt11 != null) try{pstmt11.close();}catch(SQLException sqle){}
		if(pstmt12 != null) try{pstmt12.close();}catch(SQLException sqle){}
		if(pstmt13 != null) try{pstmt13.close();}catch(SQLException sqle){}
		if(pstmt14 != null) try{pstmt14.close();}catch(SQLException sqle){}
		if(pstmt15 != null) try{pstmt15.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}  
	}
%>	

</body>
</html>