<%@ page import="library.connection.DatabaseConnection" %>
<%@ page import="library.model.User" %>
<%@ page import="library.model.Cart" %>
<%@ page import="library.dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartBook = null;
    if (cart_list != null) {
        BookDao pDao = new BookDao(DatabaseConnection.getConnection());
        cartBook = pDao.getCartBooks(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
    }%>
<html>
<head>
    <title>Cart</title>
    <%@include file="dependent/header.jsp" %>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="dependent/navbar.jsp" %>

<div class="container">
    <div class="d-flex py-3">
        <h3>Total Price: $${(total>0)?dcf.format(total):0}</h3>
        <a href="check-out" class="mx-3 btn btn-primary">Check Out</a>
    </div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (cart_list != null) {
                for (Cart c : cartBook) {
        %>
        <tr>
            <td><%=c.getTitle()%>
            </td>
            <td><%=c.getAuthor()%>
            </td>
            <td>$<%=dcf.format(c.getPrice())%>
            </td>
            <td>
                <form action="" method="post" class="form-inline"><input type="hidden" name="id" value="<%=c.getId()%>"
                                                                         class="form-input">
                    <div class="form-group d-flex justify-content-between w-10">
                        <a href="quantity-inc-dec?action=inc&id=<%=c.getId()%>" class="btn btn-sm btn-incre"><i
                                class="fas fa-plus-square"></i> </a>
                        <input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity()%>" readonly>
                        <a href="quantity-inc-dec?action=dec&id=<%=c.getId()%>" class="btn btn-sm btn-decre"><i
                                class="fas fa-minus-square"></i> </a>
                    </div>
                </form>
            </td>
            <td><a href="remove-from-cart?id=<%= c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
        </tr>
        </tbody>
        <%
                }
            }
        %>
    </table>

</div>


<%@include file="dependent/footer.jsp" %>
</body>
</html>
