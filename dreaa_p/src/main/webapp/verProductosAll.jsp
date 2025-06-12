<%@ page import="CapaEntidad.Productos, CapaNegocio.BSCarrito, java.util.ArrayList, CapaEntidad.Categorias" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Todos los Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>

    <%@ include file="navBar.jsp" %>
    <%
        BSCarrito ObjBS = new BSCarrito();
        ArrayList<Categorias> categorias = ObjBS.ListarCategorias(); 
    %>
    <h1>Todos los Productos</h1>
    <div class="container">
        <% 
            for (Categorias categoria : categorias) {
        %>
        <h2><%= categoria.getDescripcion() %></h2> 
        <div class="row">
            <% 
                ArrayList<Productos> productos = ObjBS.ListarProductos(categoria.getIdCategoria());
                int count = 0; 
                for (Productos p : productos) {
                    if (count % 4 == 0 && count > 0) {
            %>
                    </div> 
                    <div class="row">
            <% 
                    }
            %>
            <div class="col-md-3 col-12 mb-4"> <!-- Cambiar a col-md-3 para 4 productos por fila en pantallas grandes, y col-12 para dispositivos pequeños -->
                <div class="product-card">
                    <img src="image/<%=p.getImagen()%>" alt="<%=p.getDescripcion()%>" class="img-fluid">
                    <div class="product-details">
                        <h5 class="product-title"><%=p.getDescripcion()%></h5>
                        <p class="product-price">S/. <%=p.getPrecioUnidad()%></p>
                        <p class="product-stock">Stock: <%=p.getStock()%></p>
                        <a href="verdetalle.jsp?idpro=<%=p.getIdProducto()%>" class="btn btn-primary">Ver Detalle</a>
                    </div>
                </div>
            </div>
            <% 
                    count++; 
                }
            %>
        </div>
        <hr>
        <% 
            }
        %>
    </div>

    <a href="index.jsp" class="btn btn-success">Volver al Inicio</a>

    <%@ include file="footer.jsp" %>

    <style>
        h1 {
            text-align: center;
            color: #A87676;
            font-weight: bold;
            margin-top: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            font-family: 'Georgia', serif;
        }

        .product-card {
            background-color: #FFFFFF;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            height: 100%; /* Esto asegura que las tarjetas tengan la misma altura */
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 100%;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            max-height: 200px;
            object-fit: cover;
        }

        .product-details {
            padding: 15px;
            flex-grow: 1; /* Esto asegura que el contenido de la tarjeta ocupe todo el espacio disponible */
        }

        .product-title {
            color: #643843;
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .product-price {
            font-size: 1.1rem;
            color: #2D6A4F;
            font-weight: bold;
        }

        .product-stock {
            font-size: 0.9rem;
            color: #FFC107;
        }

        .btn-primary {
            background-color: #A87C7C;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #C39898;
        }

        .btn-success {
            background-color: #C0C78C;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            margin-top: 20px;
            display: block;
            margin-left:10%;
            margin-right:10%;
        }

        .btn-success:hover {
            background-color:#A6B37D;
            color:#FFF5CD;
        }

        /* Media Query para dispositivos pequeños (móviles) */
        @media (max-width: 767px) {
            .product-card {
                min-height: 350px; /* Asegura que todos los productos tengan una altura mínima */
            }

            .product-title {
                font-size: 1rem;
            }

            .product-price {
                font-size: 1rem;
            }

            .product-stock {
                font-size: 0.8rem;
            }

            .row {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .col-md-3 {
                width: 100% !important; 
            }
        }

       
        @media (min-width: 768px) {
            .col-md-3 {
                flex: 0 0 25%; 
            }
        }
    </style>

</body>
</html>