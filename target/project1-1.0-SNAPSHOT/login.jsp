<%@ page import="library.model.User" %>
<%@ page import="library.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }%>
<html>
<head>
    <title>Login</title>
    <%@include file="dependent/header.jsp" %>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="dependent/navbar.jsp" %>
<div class="content">
    <div class="container">
        <div class="card w-50 mx-auto my-5" style="z-index: 901">
            <div class="card-header text-center" style="color:black;">User Login</div>
            <div class="card-body">
                <form action="user-login" method="post">
                    <div class="form-group">
                        <label>Email address</label>
                        <input type="email" name="login-email" class="form-control" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="login-password" class="form-control" placeholder="**********">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%@include file="dependent/footer.jsp" %>
</body>
</html>
