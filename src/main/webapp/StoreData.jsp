<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store</title>
</head>
<body>
<%
String name = request.getParameter("nama");
out.print(name);
%>
</body>
</html>