<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page import="com.ebook.Helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Book:Index</title>
    <%@include file="AllComponent/AllCSS.jsp" %>
    <link rel="stylesheet" href="User/Homepagecss.css">
    <script src="AllComponent/messageautodelete.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
        });
    </script>

    <style>
        .back-img {
            background: url("Images/bookimage2.jpeg");
            height: 50vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .back-img h2 {
            color: white;
            font-weight: bold;
            text-shadow: 2px 2px 5px #000;
        }

        .section-title {
            font-weight: bold;
            color: #333;
            margin: 30px 0 15px 0;
            text-align: center;
        }

        .book-actions a {
            margin: 4px;
        }
       .scroll-wrapper {
  width: 100%;
  overflow: hidden;
  position: relative;
  padding: 20px 0;
}

.scroll-track {
  display: flex;
  gap: 20px;
  animation: slideLeft 20s linear infinite;
}

.scroll-wrapper:hover .scroll-track {
  animation-play-state: paused;   /* ⏸️ Stops animation on hover */
}

@keyframes slideLeft {
  0% {
    transform: translateX(0%);
  }
  100% {
    transform: translateX(-100%);
  }
}

/* Optional: hide scrollbar if any */
.scroll-wrapper::-webkit-scrollbar,
.scroll-track::-webkit-scrollbar {
  display: none;
}
.scroll-track .book-card{
  transition: transform .3s ease, box-shadow .3s ease;   /* smooth animation */
}

.scroll-track .book-card:hover{
  transform: scale(1.07);        /* 7 % bigger; tweak as you like   */
  z-index: 10;                   /* keeps it on top while zoomed    */
  box-shadow: 0 10px 25px #0003; /* optional depth effect           */
}

    </style>
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
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <section>
<div class="top-strip"></div>

    <!-- Header Section -->
    <div class="container-fluid p-3 bg-light">
        <div class="row align-items-center">
            <div class="col-md-3 text-success">
                <h3 class="m-0 brand-title"><i class="fas fa-book"></i> Ebooks</h3>
            </div>
            <div class="col-md-6">
                 <input id="search" class="form-control" type="search" placeholder="Search books..." aria-label="Search" oninput="handleSearch(this.value)">
          
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
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#recent"><i class="fa-solid fa-book-open"></i> Recent Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#new"><i class="fa-solid fa-book"></i> New Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#old"><i class="fa-solid fa-book"></i> Old Book</a>
                    </li>
                </ul>
                <div class="d-flex flex-wrap gap-2">
                    <a class="btn btn-outline-light" href="Login.jsp">
                        <i class="fa-solid fa-gear"></i> Setting
                    </a>
                    <a class="btn btn-outline-light" href="Login.jsp">
                        <i class="fa-solid fa-headset"></i> Contact Us
                    </a>
                </div>
            </div>
        </div>
    </nav>
    </section>

<%
    Message mymessage = (Message) session.getAttribute("mymessage");
    if (mymessage != null) {
%>
<div class="row mt-3">
    <div class="col-md-4 offset-md-4">
        <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white position-relative p-0"
             role="alert" style="background-color: <%= mymessage.getColor() %>">

            <div class="progress" style="height: 5px;">
                <div class="progress-bar bg-warning" id="alertProgress" role="progressbar"
                     style="width: 100%;" aria-valuemin="0" aria-valuemax="100"></div>
            </div>

            <div class="p-3">
                <strong><i class="fa <%= mymessage.getIcon() %>"></i> <%= mymessage.getContent() %></strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
    </div>
</div>
<%
    session.removeAttribute("mymessage");
}
%>

<div class="container-fluid back-img ">
    <h2>EBook Management System</h2>
</div>

<section id="homepagedata">
    <!-- ========== Recent Books ========== -->
    <div class="container mt-4" id="recent">
    <h3 class="section-title">Recent Books</h3>
    <div class="row">
         
             <div class="scroll-wrapper">
  <div class="scroll-track">
        <%
            String bookStatus="Active";
            DisplayAllBookAtUserHomePageDataOperation bookdata = new DisplayAllBookAtUserHomePageDataOperation(ConnectionProvider.getConnection());
            List<BookDetails> bookList2=bookdata.getAllBookByActive(bookStatus);

            if (bookList2 != null && !bookList2.isEmpty()) {
                for (BookDetails book : bookList2) {
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
        %>
 
        <div class="col-md-3 mt-4">
            <div class="book-card text-center p-3">
               <div class="text-center ">   <img src="Books/<%=book.getBookPhotoName()%>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Java Programming"></div>
    
             
                <h5 class="mt-2"><%= book.getBookName().length() > 12 ? book.getBookName().substring(0, 12) + "..." : book.getBookName() %></h5>
                <p>Author: <%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></p>
                <p>Category: <%=book.getBookCategory()%></p>
                <div class="book-actions">
                    <a href="Login.jsp" class="btn btn-buy btn-sm"><i class="fa fa-cart-plus"></i> Add to Cart</a>
                    <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a> <br>
                    <a class="btn btn-danger btn-sm"><%=book.getBookPrice()%></a>
                </div>
            </div>
        </div>
           
        <%
            }
}else{

}
        %>
        
       </div>

     </div>
    <div class="text-center mt-3">
        <a href="Login.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>

<!-- ========== New Books ========== -->
<div class="container mt-5" id="new">
    <h3 class="section-title">New Books</h3>
     <div class="scroll-wrapper">
  <div class="scroll-track">
         <%
             String bookCategory="New";
           
            DisplayAllBookAtUserHomePageDataOperation bookdata2 = new DisplayAllBookAtUserHomePageDataOperation(ConnectionProvider.getConnection());
            
               List<BookDetails> bookList3 = bookdata2.getAllBooksByNewCategoryAndActive(bookStatus, bookCategory);

            if (bookList3 != null && !bookList3.isEmpty()) {
                for (BookDetails book : bookList3) {
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
        %>
        
        <div class="col-md-3 mt-4">
            <div class="book-card text-center p-3">
                 <div class="text-center ">   <img src="Books/<%=book.getBookPhotoName()%>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Java Programming"></div>
     <h5 class="mt-2"><%= book.getBookName().length() > 12 ? book.getBookName().substring(0, 12) + "..." : book.getBookName() %></h5>
                <p>Author: <%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></p>
                <p>Category: <%=book.getBookCategory()%></p>
                <div class="book-actions">
                    <a href="Login.jsp" class="btn btn-buy btn-sm"><i class="fa fa-cart-plus"></i> Add to Cart</a>
                    <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a><br>
                    <a class="btn btn-danger btn-sm"><%=book.getBookPrice()%></a>
                </div>
            </div>
        </div>
               
        <%
            }
}else{

}
        %>
       </div>

    </div>
    <div class="text-center mt-3">
        <a href="Login.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>

<!-- ========== Old Books ========== -->
<div class="container mt-5 mb-4" id="old">
    <h3 class="section-title">Old Books</h3>
     <div class="scroll-wrapper">
  <div class="scroll-track">
       
        <%
            String bookCategory2="Old";
           
            DisplayAllBookAtUserHomePageDataOperation bookdata3 = new DisplayAllBookAtUserHomePageDataOperation(ConnectionProvider.getConnection());
            
               
List<BookDetails> bookList4=bookdata3.getAllBookByCategory(bookStatus,bookCategory2);

            if (bookList4 != null && !bookList4.isEmpty()) {
                for (BookDetails book : bookList4) {
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
        %>
        
        <div class="col-md-3 mt-4">
            <div class="book-card text-center p-3">
                 <div class="text-center ">   <img src="Books/<%=book.getBookPhotoName()%>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Java Programming"></div>
                 <h5 class="mt-2"><%= book.getBookName().length() > 12 ? book.getBookName().substring(0, 12) + "..." : book.getBookName() %></h5>
                <p>Author:<%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></p>
                <p>Category: <%=book.getBookCategory()%></p>
                <div class="book-actions">
                    <a href="Login.jsp" class="btn btn-buy btn-sm"><i class="fa fa-cart-plus"></i> Add to Cart</a>
                    <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a><br>
                    <a class="btn btn-danger btn-sm"><%=book.getBookPrice()%></a>
                </div>
            </div>
        </div>
         
        <%
            }
}else{

}
        %>
       </div>
    </div>
    <div class="text-center mt-3">
        <a href="Login.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
</div>
</section>
        <section id="result">
            
        </section>
<%@include file="AllComponent/Footer.jsp" %>
<script>
    /* Optional: auto-assign --i values if <li> ban rahe server-side */
document.querySelectorAll('.circle-track li')
        .forEach((el, idx) => el.style.setProperty('--i', idx));

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
      function handleSearch(searchKey){
            if (searchKey.trim() !== "") {
                
      document.getElementById("homepagedata").style.display = "none";
       document.getElementById("result").style.display = "block";
          $.ajax({

                        data: {
                            
                            'searchKey': searchKey
                            
                        },
                        type: 'POST',
                        url: "searchBookforHomePageIndex.jsp",
                        success: function (data) {
                            $('#result').html(data);
                        },
                        error: function (jqXHR) {

                        }
                    });
      
    } else {
      // agar field blank ho to dobara show kar do
      document.getElementById("homepagedata").style.display = "block";
      document.getElementById("result").style.display = "none";
    }
          
      }
    </script>



</body>
</html>
