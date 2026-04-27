<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
     
</head>
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
<body>
    <footer class="navbar-custom text-white pt-4 pb-2 mt-5" >
        <div class="container text-center" >
            <h5 class="mb-3">Designed by Suraj Kumar © All Rights Reserved</h5>

            <!-- Social Media Links -->
            <div class="mb-3">
                <a href="https://facebook.com/yourprofile" target="blank"class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
                <a href="https://twitter.com/yourprofile" target="blank" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                <a href="https://instagram.com/yourprofile" target="blank" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                <a href="https://linkedin.com/in/yourprofile" target="blank" class="text-white me-3"><i class="fab fa-linkedin-in"></i></a>
                <a href="https://github.com/yourprofile" target="blank" class="text-white"><i class="fab fa-github"></i></a>
            </div>

            <!-- About & Contact -->
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <h6>About Us</h6>
                    <p class="small">Welcome to our E-Book Marketplace — a platform where users can easily buy,
                        sell, and explore digital books. Whether you're a reader looking for your next favorite title or a seller wanting to share knowledge, 
                        we make the process fast, secure, and hassle-free. Built with modern tech for a smooth experience.</p>
                </div>
                <div class="col-md-4">
                    <h6>Contact</h6>
                    <p class="small mb-1"><i class="fas fa-envelope me-2"></i>suraj71442@gmail.com</p>
                    <p class="small mb-1"><i class="fas fa-phone me-2"></i>+91 9142436150</p>
                    <p class="small"><i class="fas fa-map-marker-alt me-2"></i>Hazaribagh, Jharkhand, India</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
