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
   session.setAttribute("username1", request.getParameter("username1"));
   session.setAttribute("PW1", request.getParameter("PW1"));
   session.setAttribute("PhoneNumber1", request.getParameter("PhoneNumber1"));
   session.setAttribute("usernum", request.getParameter("usernum"));
   session.setAttribute("day1", request.getParameter("day1"));
   session.setAttribute("time1", request.getParameter("time1"));
   
   String name = (String)session.getAttribute("username1");
   String phone = (String)session.getAttribute("PhoneNumber1");
   String pw = (String)session.getAttribute("PW1");
   String num = (String)session.getAttribute("usernum");
   String valueDate = (String)session.getAttribute("day1");
   String valueTime = (String)session.getAttribute("time1");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   PreparedStatement pstmt2 = null;
   PreparedStatement pstmt3 = null;
   PreparedStatement pstmt4 = null;
   ResultSet rs = null;
   ResultSet rs2 = null;
   ResultSet rs3 = null;
   
   String jdbcDriver="jdbc:mariadb://localhost:3305/booksys";
   String User="root";
   String Password="3324dlsghks";
   
   try
   {
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcDriver, User, Password);
      
      String sql = "select * from customer where name = ? and phoneNumber = ? and password = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, name);
      pstmt.setString(2, phone);
      pstmt.setString(3, pw);
      rs = pstmt.executeQuery();
      
      
      
      if(rs.next())
      {
         int isnoshow = rs.getInt("isnoshow");
         int coupon = rs.getInt("coupon");
         int c_oid = rs.getInt("oid");
         
         sql = "select * from reservation where customer_id = ?";
         pstmt3 = conn.prepareStatement(sql);
         pstmt3.setInt(1, c_oid);
         rs2 = pstmt3.executeQuery();
         
         if(isnoshow == 1){%>
            <script type="text/javascript">alert("NOShow기록이 있습니다. 매장으로 문의주세요.")
               location.href="Home.jsp";</script>
           <%}
         else if(rs2.next()){%>
            <script type="text/javascript">alert("예약 내역이 있습니다. (예약은 한 번만 가능합니다.)")
                     location.href="Home.jsp";</script>
         <%}
           else{
              if(true){%>
                 <script type="text/javascript">alert("<%=coupon%>개의 쿠폰이 있습니다.")</script>   
              <%}%>
             <form id = "go" method = "post" action = "ReservationMenu.jsp">
                <div class="form-row align-items-center">
                   <input type = "hidden" name = "PhoneNumber1" value = <%=phone%>>
                   <input type = "hidden" name = "username1" value = <%=name%>>
                   <input type = "hidden" name = "PW1" value = <%=pw%>>
                   <input type = "hidden" name = "usernum" value = <%=num%>>
                   <input type = "hidden" name = "day1" value = <%=valueDate%>>
                   <input type = "hidden" name = "time1" value = <%=valueTime%>>                   
                </div>
             </form>
             <script> 
                document.getElementById('go').submit(); 
            </script> 
           <%}
      }
      else
      {
         sql = "select password from customer where name = ? and phoneNumber = ?";
         pstmt4 = conn.prepareStatement(sql);
         pstmt4.setString(1, name);
         pstmt4.setString(2, phone);
         rs3 = pstmt4.executeQuery();
         
         if(rs3.next()){
            String password = rs3.getString("password");
            if(!password.equals(pw)){%>
               <script type="text/javascript">alert("비밀번호가 일치하지 않습니다.")
                        history.back()</script>
            <%}
         }
         else{
            System.out.println("3");
            String sql2 = "insert into customer (name, phoneNumber, password, isnoshow, coupon) values (?, ?, ?, ?, ?)";
            pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setString(1, name);
            pstmt2.setString(2, phone);
            pstmt2.setString(3, pw);
            pstmt2.setInt(4, 0);
            pstmt2.setInt(5, 0);
            pstmt2.executeUpdate();
         %>
         <form id = "gogo" method = "post" action = "ReservationMenu.jsp">
            <div class="form-row align-items-center">
               <input type = "hidden" name = "PhoneNumber1" value = <%=phone%>>
               <input type = "hidden" name = "username1" value = <%=name%>>
               <input type = "hidden" name = "PW1" value = <%=pw%>>
               <input type = "hidden" name = "usernum" value = <%=num%>>
               <input type = "hidden" name = "day1" value = <%=valueDate%>>
               <input type = "hidden" name = "time1" value = <%=valueTime%>>               
            </div>
         </form>
         <script> 
             document.getElementById('gogo').submit(); 
         </script> 
         <%}
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
      if(conn != null) try{conn.close();}catch(SQLException sqle){}   
   }
%>   
</body>
</html>
