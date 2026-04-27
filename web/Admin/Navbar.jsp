<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin:Nav</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

        <style>
            .bg-custom {
                background: linear-gradient(to right, #4facfe, #43e97b);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }
            .navbar .nav-item:hover .nav-link {
                background-color: white;
                color: #303f9f;
                border-radius: 15px;
            }
        </style>
    </head>

    <body>
        <!-- Top Blue Strip -->
        <div class="container-fluid" style="height: 10px; background-color: #303f9f"></div>

        <!-- Upper Section -->
        <div class="container-fluid p-3 bg-light">
            <div class="row align-items-center">
                <div class="col-md-3 text-success">
                    <h3><i class="fas fa-book"></i> Ebooks</h3>
                </div>
                <div class="col-md-6">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" hidden>
                        <button class="btn btn-outline-primary" type="submit" hidden>Search</button>
                    </form>
                </div>
                <div class="col-md-3 text-end">
                    <a href="../AdminLogoutServlet" class="btn btn-success">
                        <i class="fa-solid fa-right-to-bracket"></i> Logout
                    </a>
                </div>
            </div>
        </div>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.jsp">
                    <i class="fa-solid fa-house-chimney"></i>
                </a>
                <button class="navbar-toggler" type="button" 
                        data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                        aria-controls="navbarSupportedContent" aria-expanded="false" 
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="Home.jsp">Home</a>
                        </li>
                        
                        <li class="nav-item">  <a class="nav-link active" href="../DisplayOrderdProductAdminServlet" style="text-decoration: none"> Pending Orders</a></li>
                        <li class="nav-item"><a  class="nav-link active" href="../DisplayAdminConfirmedOrderServlet" style="text-decoration: none">Confirmed Orders</a></li>
                        <li class="nav-item"><a class="btn btn-outline-light" href="AdminLiveChat.jsp" ><i class="fa-solid fa-comments"></i> Live Chat</a>
                        <li class="nav-item"><a class="btn btn-outline-light" href="AdminLiveChatEndToEnd.jsp" ><i class="fa-solid fa-comments"></i> Live Chat Web socket</a>
                         </li>
                        <!-- Add more nav items here if needed -->
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
