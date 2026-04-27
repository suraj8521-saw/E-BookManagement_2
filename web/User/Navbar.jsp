<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserRegistration user2 = (UserRegistration) session.getAttribute("loginStudent");
%>

<!-- Top strip -->
<div class="top-strip"></div>

<!-- Branding + Search + User Info -->
<div class="navbar-top bg-light py-3">
    <div class="row align-items-center">
        <div class="col-lg-2 col-md-12 text-success text-center text-lg-start mb-2 mb-lg-0">
            <h3 class="m-0 site-title">
                <a href="Home.jsp" class="text-success text-decoration-none">
                    <i class="fas fa-book"></i> Ebooks
                </a>
            </h3>
        </div>
        <div class="col-lg-5 col-md-12 mb-2 mb-lg-0">
            <!-- Optional search bar if needed -->
        </div>
        <div class="col-lg-5 col-md-12 text-center text-lg-end">
            <a href="UserProfileHome.jsp" class="btn btn-primary me-2">
                <i class="fa fa-user" aria-hidden="true"></i> <%= user2.getUserName() %>
            </a>
            <a href="../UserLogoutServlet" class="btn btn-success">
                <i class="fa-solid fa-right-to-bracket"></i> Logout
            </a>
        </div>
    </div>
</div>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="Home.jsp">
            <i class="fa-solid fa-house-chimney"></i>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse mt-2 mt-lg-0" id="navbarMenu">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item active">
                    <a class="nav-link active" href="Home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserHomePageAllRecentBooks.jsp">
                        <i class="fa-solid fa-book-open"></i> Recent Book
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserHomePageAllNewtBooks.jsp">
                        <i class="fa-solid fa-book"></i> New Book
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserHomePageAllOldBooks.jsp">
                        <i class="fa-solid fa-book"></i> Old Book
                    </a>
                </li>
            </ul>
            <div class="d-flex flex-wrap gap-2">
                <a class="btn btn-outline-light" href="UserProfileHome.jsp">
                    <i class="fa-solid fa-gear"></i> Setting
                </a>
                <a class="btn btn-outline-light" href="ContactUs.jsp">
                    <i class="fa-solid fa-headset"></i> Contact Us
                </a>
                <a class="btn btn-light text-primary" href="../CartSectionBookServletS?userEmail=<%= user2.getUserEmail() %>">
                    <i class="fa fa-cart-plus" aria-hidden="true"></i> Cart
                </a>
                <a class="btn btn-light text-primary" href="../UserOrderHistryServlet?userEmail=<%= user2.getUserEmail() %>">
                    <i class="fa fa-history" aria-hidden="true"></i> Orders
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- CSS for Styling -->
<style>
    .top-strip {
        height: 10px;
        background-color: #303f9f;
    }

    .navbar-custom {
        background: linear-gradient(to right, #4facfe, #43e97b);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .navbar-custom .navbar-nav .nav-link {
        color: white !important;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .navbar-custom .navbar-nav .nav-link:hover {
        color: #212121 !important;
        background-color: white;
        border-radius: 15px;
    }

    .navbar-custom .btn {
        border-radius: 50px;
    }

    .navbar-custom .btn-outline-light:hover {
        background-color: white;
        color: #4facfe;
    }

    @media (max-width: 767px) {
        .site-title {
            font-size: 1.4rem;
        }
    }
</style>
