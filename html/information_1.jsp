<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>個人資訊</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo.jpg" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/style_1.css" rel="stylesheet" />
    </head>
    <body>
<%
	if(session.getAttribute("access")==null)
    	out.println("<a class= 'h' href='../html/login.html'>登入</a>");
%>
	
        <!-- Navigation-->
        <div class="fixed-bottom">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <!--<a class="navbar-brand" href="#!">Start Bootstrap</a>-->
                <!--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
                <!--<div class="collapse navbar-collapse" id="navbarSupportedContent">-->
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">存摺</a></li>  <!--存摺導覽列-->
                        <li class="nav-item"><a class="nav-link" href="#!">商店</a></li>                             <!--商店導覽列-->
                        <li class="nav-item"><a class="nav-link" href="#!">首頁</a></li>                             <!--首頁導覽列-->
                        <li class="nav-item"><a class="nav-link" href="#!">會員</a></li>                             <!--會員導覽列-->
                       
                    </ul>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <!--<img class="display-4 fw-bolder" src="assets/logo.jpg">-->
                    <p class="lead fw-normal text-white-50 mb-0">個人資訊</p>
                    <div class="point">
<%		   
	sql = "SELECT * FROM `member` WHERE `memberid`= '"+session.getAttribute("memberid")+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	int a=0;
	while(rs.next()){
%>
                        <p class="lead fw-normal-1 text-white-51 mb-0">帳號:<%=rs.getString(2)%></p>
						<input type="hidden" name="id">
						<%}%>
                    </div>
                </div>
            </div>
            
        </header>
        <!-- Section-->
        <section class="py-5">
<%		   
    //String mail=(String)session.getAttribute("memberid");
	sql = "SELECT * FROM `member`, `member_card` WHERE `member`.`memberid`= '"+session.getAttribute("memberid")+"' AND `member`.`id` = `member_card`. `id`";
	//sql="SELECT * FROM `member`, `member_card` WHERE `member`.`id` = `member_card`. `id`;";
	ResultSet rs2=con.createStatement().executeQuery(sql);
	while(rs2.next()){
%>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <!--<div class="card h-100">-->
                            <div class="change" style="border-width: 2px; border-style: outset; border-color: #F0F0F0; border-radius: 10px;">
                                <p>信用卡號</p>
                                <p><%=rs2.getString("cardid")%></p>
                                <p>信用卡有效日期</p>
                                <p><%=rs2.getString("carddate")%></p>
                               <%}%>
                           
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                       
                        </div>
                    </div>
                    
                        </div>
                   
                   <!--<div class="col mb-5">
                       <input type="submit" value="儲存" style="margin-left: 43%; font-size: 20px;">-->

        </section>
        
    </body>
</html>
