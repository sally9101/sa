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
        <title>碳制郎</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/login.css" rel="stylesheet" />
    </head>
    <body id="page-top">
      <form name="register" method="post" action="card_detail.jsp">
	  <form name="idupdate" method="post" action="idupdate.jsp">
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
              
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">card</h2>

				<!--<p class="page-section-heading text-center text-uppercase text-secondary mb-0">帳號:</p>-->
               
				<!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><img src="../img/seaweed.jpg"></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form action="" id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
							<div class="form-floating mb-3">
                                
                                <label for="id" name="Cmemberid">身分證</label>
                               
                            </div>
                            <div class="form-floating mb-3">
                               
                                <input class="form-control" id="name" name="cardid" type="text"  placeholder="帳號" required />
                                <label for="name">銀行代碼</label>
                         
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" name="cardnum" type="text"  placeholder="帳號" required />
                                <label for="email">信用卡號</label>
                               
                            </div>
                  
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" name="carddate" type="date" placeholder="xxxx" required />
                                <label for="date">信用卡有效日期</label>
                              
                            </div>
                         
                        <div class="inputBox">
                            <input type="submit" value="確認"> 
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
			</form>
			</form>
        </section>
    </body>
</html>
