<%@ page import="library.connection.DatabaseConnection" %>
<%@ page import="library.model.User" %>
<%@ page import="library.model.Book" %>
<%@ page import="library.dao.BookDao" %>
<%@ page import="java.util.List" %>
<%@ page import="library.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>To Kill a Mockingbird</title>
    <%@include file="dependent/header.jsp"%>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<div class="content">
    <div class="mainContentContainer">
        <div class="mainContent">
            <div class="mainContentFloat">
                <div class="leftContainer">
                    <div id="topcol" class="last col stacked">
                        <div id="imagecol" class="col">
                            <div class="bookCoverContainer">
                                <div class="bookCoverPrimary">
                                    <img id="coverImage" alt="To Kill a Mockingbird"
                                         src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553383690l/2657.jpg">
                                </div>
                            </div>
                        </div>
                        <div id="metacol" class="last col">
                            <h1 id="bookTitle"></h1>
                            <div id="bookAuthor">by Harper Lee</div>
                            <br>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
</div>
</body>


<%@include file="dependent/footer.jsp" %>
</body>
</html>
