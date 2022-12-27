<%@ page import="library.connection.DatabaseConnection" %>
<%@ page import="library.model.User" %>
<%@ page import="library.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="library.dao.OrderDao" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="library.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% User auth = (User) request.getSession().getAttribute("auth");
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("auth", auth);
        OrderDao orderDao = new OrderDao(DatabaseConnection.getConnection());
        orders = orderDao.userOrders(auth.getId());
    } else {
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }%>
<html>
<head>
    <title>Orders</title>
    <%@include file="dependent/header.jsp" %>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="dependent/navbar.jsp" %>


<div class="container">
    <div class="card-header my-3">All orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Title</th>
            <th scope="col">Author</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>
        <%
            if(orders != null){
                for(Order o:orders){%>
        <tr>
            <td><%=o.getDate() %></td>
            <td><%=o.getTitle() %></td>
            <td><%=o.getAuthor() %></td>
            <td><%=dcf.format(o.getPrice()) %></td>
            <td><%=o.getQuantity() %></td>
            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
        </tr>
        <%}
        }
        %>
        </tbody>
    </table>
</div>


<%@include file="dependent/footer.jsp" %>
</body>
</html>
