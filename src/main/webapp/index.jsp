<%@ page import="library.connection.DatabaseConnection" %>
<%@ page import="library.model.User" %>
<%@ page import="library.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null) {
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <%@include file="dependent/header.jsp"%>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="dependent/navbar.jsp"%>


    <div class="content">
        <h1>FIND YOUR BOOK HERE.</h1>
        <p>Need a book but don't want to spend hundreds? No problem!</p>
    </div>


<%@include file="dependent/footer.jsp"%>
</body>
</html>