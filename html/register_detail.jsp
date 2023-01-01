<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use question";
           con.createStatement().execute(sql);
           
		   String Email=request.getParameter("memberid");
		   String Name=request.getParameter("name");
		   String Password=request.getParameter("password");
		   String phone=request.getParameter("phone");

//Step 4: 執行 SQL 指令	
 try
		   {
			   String sql1 = "SELECT * FROM `member` WHERE `member`.`memberid`='" +Email+ "'"  ; 
               ResultSet rs =con.createStatement().executeQuery(sql1);
               if(rs.next())
	           { 
                out.print("<script>alert(decodeURIComponent('註冊失敗！帳號已存在'));location.href='register.html'</script>");
				if(request.getParameter("password") != request.getParameter("password_1"))
				{
					out.print("<script>alert(decodeURIComponent('密碼兩次輸入不相符'));location.href='register.html'</script>");
				}
	           }
               else
	           {
			   sql="INSERT INTO `member`(`memberid`,`name`,`password`,`phone`) values('"+Email+"','"+Name+"','"+Password+"','"+phone+"')";
		       con.createStatement().execute(sql);
	           response.sendRedirect("card.jsp");
	           }
		      
		       
		   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("member.jsp");
		   }
       }
    
%>