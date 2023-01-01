<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>register</title>
</head>
<body>
<%

try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use question";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String new_name=request.getParameter("name");
		  
           String new_mail=request.getParameter("memberid");
		 
		   String new_password=request.getParameter("password");
		   
		   String new_phone=request.getParameter("phone");
		 
           //java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT`member`(`name`,`memberid`,`password`,`phone`)";
           sql+="VALUES ('" + new_name + "', ";
           sql+="'"+new_mail+"\', ";
		   sql+="'"+new_password+"\', ";
           sql+="'"+new_phone+"')";  
          
		   //sql+="'"+new_date+"')";		   
          // sql+="'"++"',";
		  // sql+="'"+new_date+"')";
           con.createStatement().execute(sql);
//Step 6: 關閉連線
		con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("card.jsp");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}

%>

</body>
</html>
