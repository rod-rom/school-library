<%@ page import="library.connection.DatabaseConnection" %>
<%@ page import="library.model.User" %>
<%@ page import="library.model.Book" %>
<%@ page import="library.dao.BookDao" %>
<%@ page import="java.util.List" %>
<%@ page import="library.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    BookDao pd = new BookDao(DatabaseConnection.getConnection());
    List<Book> Books = pd.getAllBooks();
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<html>
<head>
    <title>Books</title>
    <%@include file="dependent/header.jsp" %>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<%@include file="dependent/navbar.jsp" %>

<div class="container">
    <div class="card-header my-3">All Books</div>
    <div class="row">
        <%
            if (!Books.isEmpty()) {
                for (Book p : Books) {%>
        <div class="col-md-3 my-3">
            <div class="card w-100" style="width:18rem;">
                <img class="card-img-top" src="img/<%= p.getImage()%>" alt="Books" href="<%=p.getTitle()%>.jsp">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getTitle()%></h5>
                    <h6 class="price">by <%= p.getAuthor()%></h6>
                    <h6 class="category">Price: $<%= p.getPrice()%></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="add-to-cart?id=<%= p.getId()%>" class="btn btn-primary">Add to Cart</a>
                       <!-- <a href="#" class="btn btn-secondary">Buy Now</a>-->
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>

    </div>
</div>


<%@include file="dependent/footer.jsp" %>
</body>
</html>


