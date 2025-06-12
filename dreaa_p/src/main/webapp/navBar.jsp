<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome para íconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>

    <div class="container-fluid">
        <a class="navbar-brand" href="#">D'rea</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cesto.jsp">
                        <i class="fas fa-shopping-cart"></i> Carrito
                        <span class="badge custom-badge">
                            <% 
                                Integer numart = (Integer) session.getAttribute("numarticulos");
                                if (numart == null) numart = 0; 
                            %>
                            <%= numart %>
                        </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="verProductosAll.jsp">Productos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<style>
    body {
		
		background: linear-gradient(120deg, #EDDFE0, #F5F5F7); 
		font-family: 'Georgia', serif;
		color: #5D5D5D;
		margin: 0; 
		padding-top: 80px; 
		}

		.navbar.scrolled {
	    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2); 
		}
		.content {
		    margin-top: 20px;
		}
		.navbar {
	    background-color: #F8F9FA;
	    opacity: 0.8; 
	    box-shadow: 0px 4px 8px rgba(10, 20, 15, 0.2);
	    border-radius: 8px; 
	    margin-bottom: 20px; 
	    position: fixed; 
	    top: 0; 
	    left: 0; 
	    right: 0;
	    z-index: 1000; 
		}
			.custom-badge {
	    background-color: #EDDFE0; 
	    color: #987070;
	    font-size: 1.2rem;
	    padding: 5px 10px;
	    border-radius: 45%;
	    position: relative;
	    top: -5px;

	
		}
		.navbar .navbar-brand {
		    font-family: 'Georgia', serif; 
		    font-weight: bold;
		    color: #322C2B ; 
		    font-size: 1.5rem; 
		    letter-spacing: 1px;
		}
		
		.navbar .navbar-toggler {
		    border-color: #561C24; 
		}
		
		
		
		.navbar .nav-item .nav-link {
		     color: #322C2B ;
		    font-family: 'Georgia', serif;
		    font-size: 1.1rem; 
		    padding: 10px 20px; 
		    border-radius: 25px;
		    transition: background-color 0.3s ease;
		}
		
		.navbar .nav-item .nav-link:hover {
		    background-color: #A87C7C; 
		    color: white; 
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
		}
		
		.navbar .nav-link.active {
		    font-weight: bold;
		   color: #322C2B ;
		}
		
		.navbar .nav-item .nav-link i {
		    font-size: 1.2rem; 
		    margin-right: 5px; 
		}
		
		@media (max-width: 768px) {
    .navbar .navbar-brand {
        font-size: 1.2rem;
    }
    .navbar .nav-item .nav-link {
        font-size: 1rem;
        padding: 8px 15px;
    }
    .custom-badge {
        font-size: 1rem;
    }
}
</style>