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
		   String qqq = "SELECT * FROM `member_card` WHERE`memberid`='" +session.getAttribute("memberid")+ "'"  ; 
               ResultSet rs =con.createStatement().executeQuery(qqq);
		   if(rs.next())
				{
						if(request.getParameter("cardid") != request.getParameter("cardid1"))
						{
							sql = "UPDATE `member_card` SET `cardid`='"+request.getParameter("cardid1")+"' WHERE `memberid`='"+session.getAttribute("memberid")+"'";
							con.createStatement().execute(sql); 
							sql = "UPDATE `member_card` SET `cardnum`='"+request.getParameter("cardnum1")+"' WHERE `memberid`='"+session.getAttribute("memberid")+"'";
							con.createStatement().execute(sql);
							sql = "UPDATE `member_card` SET `carddate`='"+request.getParameter("carddate1")+"' WHERE `memberid`='"+session.getAttribute("memberid")+"'";
							con.createStatement().execute(sql);
							con.close();
							//session.removeAttribute("access");
							//session.removeAttribute("memberid");
							out.print("<script>alert('修改成功 ! ');location.href='../html/member.jsp'</script>");
							
						}
						else
						{
							
							out.print("<script>alert('號碼不可相同');location.href='../html/mycard.jsp'</script>");
						}				   
				   
		   } 
               else
	           {
				   out.print("<script>alert(decodeURIComponent('修改失敗！'));location.href='../html/mycard.jsp'</script>");
					
				
	           }
		      
		       
		   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("../html/member.jsp");
		   }
       }
%>