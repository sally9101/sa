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
        <title>會員中心</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo.jpg" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/style_1.css" rel="stylesheet" />
    </head>
	<%
	if(session.getAttribute("access")==null)
    	out.println("<a class= 'h' href='../html/login.html'>登入</a>");
%>
    <body>
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
                    <img class="display-4 fw-bolder" src="../img/logo.jpg">
<%		   
	sql = "SELECT * FROM `member` WHERE `memberid`= '"+session.getAttribute("memberid")+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	int a=0;
	while(rs.next()){
%>
                    <p class="lead fw-normal text-white-50 mb-0"><%=rs.getString(3)%> </p>
					<%}%>
                    <div class="point">
                        <p class="lead fw-normal-1 text-white-50 mb-0"><img class="display-7 fw-bolder" src="../img/star.png">500<img class="display-8 fw-bolder" src="../img/star.png"></p>
                    </div>
                </div>
            </div>
            
        </header>
        <!-- Section-->
        <section class="py-5">
            
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="../html/information_1.jsp"><input type="button" style="border:2px none; width: 100%;" value="個人資訊 &nbsp;>"></a>
                            
                        </div>
                    </div>
					<div class="col mb-5">
                        <div class="card h-100">
                            <a href="../html/information.jsp"><input type="button" style="border:2px none; width: 100%;" value="修改密碼 &nbsp;>"></a>
                            
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="../html/mycard.jsp"><input type="button" style="border:2px none; width: 100%;" value="我的卡片 &nbsp;>"></a>
                            
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="../html/question.html"><input type="button" style="border:2px none; width: 100%;" value="常見問題 &nbsp;>"></a>
                           
                        </div>
                    </div>
                    <div class="col mb-5">
                        <!--<div class="card h-100">-->
                            <a href="../html/contactus.html"><input type="button" style="border:2px none; width: 100%;" value="聯絡我們 &nbsp;>"></a>
                            
                    </div>
                   <div class="col mb-5" style="margin-top: -10%;">
                       <a href="../html/logout.jsp">登出</a>
                    </div>
        </section>
      
    </body>
</html>
