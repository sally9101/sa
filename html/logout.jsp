<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
 <%@ page import = "java.io.*"%>

<% 
session.removeAttribute("access");
session.removeAttribute("memberid");
response.sendRedirect("member.jsp") ;
%>