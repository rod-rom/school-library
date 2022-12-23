<div class="header">
    <div class="navBar">
        <img src="img/logo.png" class="logo">
        <ul>
            <li class="navItem"><a class="navLink" href="index.jsp">Home</a></li>
            <li class="navItem"><a class="navLink" href="books.jsp">Books</a></li>
            <li class="navItem"><a class="navLink" href="cart.jsp">Cart <span
                    class="badge badge-danger ml-1">${cart_list.size()}</span> </a></li>
            <%if (auth != null) {%>
            <li class="navItem"><a class="navLink" href="orders.jsp">Orders</a></li>
            <li class="navItem"><a class="navLink" href="log-out">Logout</a></li>
            <%} else {%>
            <li class="navItem"><a class="navLink" href="login.jsp">Login</a></li>
            <%}%>
        </ul>
    </div>
</div>
