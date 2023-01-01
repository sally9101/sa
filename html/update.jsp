<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>
<%
if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use question";
           con.createStatement().execute(sql);

//Step 4: 執行 SQL 指令	
 try
		   {	
		   String qqq = "SELECT * FROM `member` WHERE`password`='" +request.getParameter("password")+ "'"  ; 
               ResultSet rs =con.createStatement().executeQuery(qqq);
		   if(rs.next())
				{
						if(request.getParameter("password_1") != request.getParameter("password"))
						{
							sql = "UPDATE member SET `password`='"+request.getParameter("password_1")+"' WHERE `memberid`='"+session.getAttribute("memberid")+"'";
							con.createStatement().execute(sql); 

							con.close();
							session.removeAttribute("access");
							session.removeAttribute("memberid");
							out.print("<script>alert('修改成功 ! 請重新登入 ! ');location.href='../html/login.html'</script>");
							
						}
						else
						{
							
							out.print("<script>alert('新舊密碼不可相同');location.href='../html/information.jsp'</script>");
						}				   
				   
		   } 
               else
	           {
				   out.print("<script>alert(decodeURIComponent('修改失敗！原密碼不相服'));location.href='../html/information.jsp'</script>");
					
				
	           }
		      
		       
		   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("../html/member.jsp");
		   }
       }
%>