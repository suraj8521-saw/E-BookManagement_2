<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navbar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

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
            margin-left: 8px;
        }

        .navbar-custom .btn-outline-light:hover {
            background-color: white;
            color: #4facfe;
        }

        .brand-title {
            font-weight: bold;
            color: #28a745;
        }

        @media (max-width: 767px) {
            .brand-title {
                font-size: 1.2rem;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Top Strip -->
    <div class="top-strip"></div>

    <!-- Header Section -->
    <div class="container-fluid p-3 bg-light">
        <div class="row align-items-center">
            <div class="col-md-3 text-success">
                <h3 class="m-0 brand-title"><i class="fas fa-book"></i> Ebooks</h3>
            </div>
            <div class="col-md-6">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" hidden aria-label="Search">
                    <button class="btn btn-outline-primary" type="submit" hidden>Search</button>
                </form>
            </div>
            <div class="col-md-3 text-end mt-2 mt-md-0">
                <a href="Login.jsp" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> Login
                </a>
                <a href="Register.jsp" class="btn btn-primary text-white">
                    <i class="fa-solid fa-user-plus"></i> Register
                </a>
<!--                <a href="adminRegister.jsp" class="btn btn-primary text-white">
                    <i class="fa fa-user-circle"></i> Admin Register
                </a>-->
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">
                <i class="fa-solid fa-house-chimney"></i>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse mt-2 mt-lg-0" id="navbarMenu">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa-solid fa-book-open"></i> Recent Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa-solid fa-book"></i> New Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#"><i class="fa-solid fa-book"></i> Old Book</a>
                    </li>
                </ul>
                <div class="d-flex flex-wrap gap-2">
                    <a class="btn btn-outline-light" href="#">
                        <i class="fa-solid fa-gear"></i> Setting
                    </a>
                    <a class="btn btn-outline-light" href="#">
                        <i class="fa-solid fa-headset"></i> Contact Us
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
