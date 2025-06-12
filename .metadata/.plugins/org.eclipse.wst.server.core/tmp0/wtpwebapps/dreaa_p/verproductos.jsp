<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CapaEntidad.Productos, CapaNegocio.BSCarrito, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Carrito de Compras</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	</head>
<body>

	<%@ include file="navBar.jsp" %>

	<%
		String IdCat = request.getParameter("idcat");
		ArrayList<Productos> miLista = new ArrayList<>();
		BSCarrito ObjBS = new BSCarrito();
		miLista = ObjBS.ListarProductos(IdCat);
		int col = 0;
	%>
	<h1>Carrito de Compras</h1>
	<div class="products-container">
		<%
			for(Productos p : miLista) {
		%>
		<div class="product-card">
			<img src="image/<%=p.getImagen()%>" alt="<%=p.getDescripcion()%>">
			<div class="product-details">
				<div class="product-title"><%=p.getDescripcion()%></div>
				<div class="product-price">S/. <%=p.getPrecioUnidad()%></div>
				<div class="product-stock">Stock: <%=p.getStock()%></div>
				<div class="product-actions">
					<a href="verdetalle.jsp?idpro=<%=p.getIdProducto()%>" class="btn btn-primary">Ver Detalle</a>
				</div>
			</div>
		</div>
		<% } %>
	</div>
	<a href="index.jsp" class="btn btn-success">Seleccionar Otra Categoría</a>
	
	
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

			.products-container {
				display: flex;
				flex-wrap: wrap;
				justify-content: center;
				gap: 20px;
				margin: 30px auto;
				max-width: 1200px;
			}
		
			
			.product-card {
				background-color: #FFFFFF;
				box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
				border-radius: 10px;
				width: 280px;
				text-align: center;
				transition: transform 0.3s ease, box-shadow 0.3s ease;
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
			.product-actions {
				margin-top: 15px;
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
			
		</style>
</body>
</html>