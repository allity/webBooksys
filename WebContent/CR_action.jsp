<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@page import="java.sql.Date" %>
<%@page import="java.sql.Time" %>

			


			
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
	String password="";
	int c_oid = 0;
	String menulist = "";
	String menu = "";
	int count = 1;
	int trash = 0;
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	
	String jdbcDriver="jdbc:mariadb://localhost:3305/booksys";
	String User="root";
	String Password="3324dlsghks";
	
	try
	{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcDriver, User, Password);
		
		String sql = "select oid, password from customer where name = ? and phoneNumber = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			c_oid = rs.getInt("oid");
			password = rs.getString("password");
		}
		
		if(!password.equals(pw))
		{%>
			<script type="text/javascript">
				alert("잘못된 정보를 입력하셨습니다.")
  				history.back()
  			</script>
		<%}
		else
		{
			sql = "select oid, covers, date, time from reservation where customer_id = ?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, c_oid);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next())
			{
				int r_oid = rs2.getInt("oid");
				int covers = rs2.getInt("covers");
				String date = String.valueOf(rs2.getDate("date"));
				String time = String.valueOf(rs2.getTime("time"));
				
				sql = "select m_oid from booksys.order where r_oid = ?";
				pstmt3 = conn.prepareStatement(sql);
				pstmt3.setInt(1, r_oid);
				rs3 = pstmt3.executeQuery();
				
				while(rs3.next())
				{
					int m_oid = rs3.getInt("m_oid");
					
					sql = "select name from booksys.menu where oid = ?";
					pstmt4 = conn.prepareStatement(sql);
					pstmt4.setInt(1, m_oid);
					rs4 = pstmt4.executeQuery();
					
					if(rs4.next())
					{
						String m_name = rs4.getString("name");
						
						if(m_name.equals(menu))
						{
							count++;
							trash = 1;
						}
						else if (count != 1)
						{
							menulist = menulist.substring(0, (menulist.length() - 2));
							menulist = menulist + "(" + count +"), ";
							count = 1;
							menu = m_name;
							menulist = menulist + m_name + ", ";
						}
						else 
						{	
							trash = 0;
							menu = m_name;
							menulist = menulist + m_name + ", ";
						}
					}
					System.out.println(menulist);
				}
				menulist = menulist.substring(0, (menulist.length() - 2));
				menulist = menulist.replace(" ", "#");
				
				if(trash == 1)
				{
					menulist = menulist + "(" + count +")";
				}
				System.out.println(menulist);
				%>
				<form id = "go" method = "post" action = "ReservationList.jsp">
					<div class="form-row align-items-center">
						<input type = "hidden" name = "phone" value = <%=phone%>>
						<input type = "hidden" name = "name" value = <%=name%>>
						<input type = "hidden" name = "covers" value = <%=covers%>>
						<input type = "hidden" name = "date" value = <%=date%>>
						<input type = "hidden" name = "time" value = <%=time%>>
						<input type = "hidden" name = "menulist" value = <%=menulist%>>
					</div>
				</form>
				<script> 
					document.getElementById('go').submit(); 
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
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(rs2 != null) try{rs2.close();}catch(SQLException sqle){}
		if(rs3 != null) try{rs3.close();}catch(SQLException sqle){}
		if(rs4 != null) try{rs4.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(pstmt2 != null) try{pstmt2.close();}catch(SQLException sqle){}
		if(pstmt3 != null) try{pstmt3.close();}catch(SQLException sqle){}
		if(pstmt4 != null) try{pstmt4.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}
%>	
</body>
</html>