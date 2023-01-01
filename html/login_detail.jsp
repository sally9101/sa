<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
	if(request.getParameter("memberid") !=null && !request.getParameter("memberid").equals("")
		&& request.getParameter("password") !=null && !request.getParameter("password").equals("")){
		
		//sql = "SELECT * FROM `member` WHERE `Email`='"+request.getParameter("Email") + 
		//"' AND `Password`='"+request.getParameter("Password")+"'" ;
		sql = "SELECT * FROM `member` WHERE `memberid`= ? AND `password`=?";
		PreparedStatement pstmt = null;
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("memberid"));
		pstmt.setString(2,request.getParameter("password"));
		
		
		
		ResultSet rs =pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("memberid",request.getParameter("memberid"));
			session.setAttribute("access","y");
			con.close();
			out.print("<script>alert('登入成功 !');location.href='member.jsp'</script>");
		}
		else{
			con.close();
			out.print("<script>alert('帳號或密碼不符 !');location.href='login.html'</script>");
		}
	}
	
%>