<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" import="CapaEntidad.Categorias, CapaNegocio.BSCarrito, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>STICH</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    </head>
    <body>
     <%@ include file="navBar.jsp" %>

        <%
            // Inicializando la lista de categorías
            ArrayList<Categorias> miLista = new ArrayList<>();
            BSCarrito ObjBS = new BSCarrito();
            miLista = ObjBS.ListarCategorias();
        %>

        <div class="banner"></div>
				
        <div class="container">
            <!-- Página Principal -->
            <div class="main-page text-center">
                <h1>Bienvenido a la Tienda Dior</h1>
                <p>Elija una de las siguientes categorías para comenzar a explorar nuestros productos.</p>
    
              
                <div class="video-container">
                    <img src="https://i.pinimg.com/originals/6d/d7/1d/6dd71dc79a1b1a6af2742702638150b4.gif" alt="minivideo" class="img-fluid">
                    <a href="#categorias" class="btn btn-custom">Seleccionar Categoría</a>
                </div>
            </div>

            <!-- Sección de Categorías -->
            <div id="categorias" class="descripcion" style="display:none;">
                <h6>CATEGORÍAS</h6>
                <div class="row">
                    <% 
                        for (Categorias c : miLista) { 
                    %>
                    <div class="col-md-4 col-sm-6 mb-4">
                        <div class="card">
                            <img src="image/<%= c.getImagen() %>" class="card-img-top" alt="Imagen de la categoría">
                            <div class="card-body text-center">
                                <h5 class="card-title"><%= c.getDescripcion() %></h5>
                                <a href="verproductos.jsp?idcat=<%= c.getIdCategoria() %>" class="btn btn-primary">Ver Productos</a>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
             </div>
        </div>

        <%@ include file="footer.jsp" %>

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
	
	    .custom-badge {
	        background-color: #EDDFE0;
	        color: #987070;
	        font-size: 1.2rem;
	        padding: 5px 10px;
	        border-radius: 45%;
	        position: relative;
	        top: -5px;
	    }
	    
		    h6{
				color: #A7727D; 
			    text-shadow: 5px 2px 7px rgba(10, 2, 0, 0.6); 
			    font-size: 35px; 
			    text-align: center;
			    margin-top: 40px; 
			    margin-bottom: 25px; 
			    letter-spacing: 2px; 
			    line-height: 1.4; 
			    font-family: 'Georgia', serif;
			}
            .main-page {
                margin-top: 80px;
                text-align: center;
                padding: 50px;
                background-color: #F8F9FA;
            }

            .descripcion p {
                font-size: 22px;
                color:#5D5D5D;
                font-family:'Georgia', serif;
                margin-top: 10px;
                text-align: center;
            }

            body {
                background: linear-gradient(120deg, #EDDFE0, #F5F5F7); 
                font-family: 'Georgia', serif;
                color: #322C2B;
                margin: 0;
            }

            .banner {
                width: 100%;
   				 height: 398px;
                background-image: url('image/banner.JPG');
                background-size: cover;
                background-position: center;
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

            
            .video-container {
		    position: relative;
		    display: inline-block;
		    text-align: center;
		    margin-top: 30px;
		    padding:32px 0
		}
		
		.video-container img {
		    max-width: 100%;
		    height: 400px; 
		    
		}
		
		.btn-custom {
		    position: absolute;
		    bottom: 10%;
		    left: 50%;
		    transform: translateX(-50%);
		    background-color: #A87C7C;
		    border: none;
		    border-radius: 20px;
		    padding: 10px 60px; 
		    font-size: 1.5rem;  
		    transition: background-color 0.3s ease;
		    color: white;
		}
		
		.btn-custom:hover {
		    background-color: #C39898;
		}

          
            footer {
                position: relative;
                z-index: 1;
            }

           
            .descripcion {
                margin-top: 30px;
                margin-bottom: 60px;
            }
            
            .descripcion h6 {
		    font-size: 36px; 
		    text-align: center; 
		    color: #322C2B;
		    font-weight: bold;
		    margin-top: 40px; 
		    padding-bottom: 50px;
		}
		
		.main-page {
		    margin-top: 80px;
		    text-align: center;
		    padding: 50px;
		    background-color: #F8F9FA;
		    margin-bottom: 50px; 
		}
		
		.card {
	    border: none;
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	    border-radius: 5px;
	    transition: transform 0.3s, box-shadow 0.3s;
	    background-color: ; 
	    height: 100%; 
	    min-height: 350px;
	}
	.card:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}

	.card-body {
	    display: flex;
	    flex-direction: column;
	    justify-content: space-between;
	    padding: 20px; 
	    height: 100%; 
	    flex-grow: 1; 
	}

	.card-title {
	    font-size: 1rem;
	    color: #3B3030;
	    margin: 10px 0;
	}
	
	.card img {
	    width: 100%;
	    height: 250px; 
	    object-fit: cover;
	}

	.card .btn {
	    background-color: #F0EBE3;
	    color: #BB8493;
	    border: none; 
	    border-radius: 5px;
	    padding: 8px 16px;
	    font-size: 0.9rem;
	    transition: background-color 0.3s;
	}

	.card .btn:hover {
	    background-color: #A78295;
	     color: #FAF3F0;
	}

	.row {
	    display: flex;
	    gap: 15px;
	    justify-content: space-between;
	    align-items: stretch;
	    
	}
        </style>

        <script>
            // Mostrar la sección de categorías al hacer clic en el botón "Seleccionar Categoría"
            document.querySelector('.btn-custom').addEventListener('click', function() {
                document.querySelector('#categorias').style.display = 'block';  // Muestra las categorías
                document.querySelector('.main-page').style.display = 'none';   // Oculta la sección principal (sin el footer ni navbar)
            });
        </script>
    </body>
</html>
