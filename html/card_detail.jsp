<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use question";
           con.createStatement().execute(sql);
           
		   String Email=request.getParameter("cardid");
		   String Name=request.getParameter("cardnum");
		   String Password=request.getParameter("carddate");
		   //String phone=request.getParameter("phone");
		   String mail=(String)session.getAttribute("Email");

//Step 4: 執行 SQL 指令	
 try
		   {
			   String sql1 = "SELECT * FROM `member_card` WHERE`cardid`='" +Email+ "'"  ; 
			   sql="select * from `member`, `member_card` where `memberid`='" + mail + "' AND member.memberid = member_card.Cmemberid";
               ResultSet rs =con.createStatement().executeQuery(sql1);
               if(rs.next())
	           { 
                out.print("<script>alert(decodeURIComponent('註冊失敗！卡片已存在'));location.href='card.'</script>");
				if(request.getParameter("Password") != request.getParameter("Password_1"))
				{
					out.print("<script>alert(decodeURIComponent('密碼兩次輸入不相符'));location.href='card.jsp'</script>");
				}
	           }
               else
	           {
			   sql="INSERT INTO `member_card`(`cardid`,`cardnum`,`carddate`) values('"+Email+"','"+Name+"','"+Password+"')";
		       con.createStatement().execute(sql);
			   sql="UPDATE `member_card` INNER JOIN `member` ON `member_card`.`id`=`member`.`id` SET `member_card`.`memberid`=`member`.`memberid`";
			   con.createStatement().execute(sql);
			   out.print("<script>alert(decodeURIComponent('註冊成功,請再登入一次'));location.href='login.html'</script>");
	           //response.sendRedirect("login.html");
	           }
		      
		       
		   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("member.jsp");
		   }
       }
    
%>