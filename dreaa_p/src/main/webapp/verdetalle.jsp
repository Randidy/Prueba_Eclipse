<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CapaEntidad.Productos, CapaNegocio.BSCarrito, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
    
  <style>
    body {
    background: linear-gradient(135deg, #FF9A9E, #FAD0C4); /* Degradado con mayor contraste */
   font-family: 'Georgia', serif;
    color: #333;
    margin: 0;
    padding: 0;
    height: 100vh; 
    background-attachment: fixed; 
}
    .container {
        margin-top: 50px;
        padding: 20px;
    }
    .card {
        border: 1px solid #ddd;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        background: linear-gradient(135deg, #ffffff, #f8f4f3); 
        font-family: 'Georgia', serif;
    }
    .card-header {
        background-color: #c8acac; 
        color: #333; 
        text-align: center;
        font-size: 30px;
        padding: 20px;
        font-weight: bold;
        border-radius: 12px 12px 0 0;
        font-family: 'Georgia', serif;
    }
    .card-body {
        padding: 30px;
        
    }
    .btn-primary {
        background-color: #a98585; 
        border-color: #a98585;
        padding: 10px 20px;
        color: #fff;
        font-family: 'Georgia', serif;
    }
    .btn-primary:hover {
        background-color: #926e6e; 
        border-color: #926e6e;
        font-family: 'Georgia', serif;
    }
    .btn-success {
        background-color: #6c757d; 
        border-color: #6c757d;
        padding: 10px 20px;
        color: #fff;
        font-family: 'Georgia', serif;
    }
    .btn-success:hover {
        background-color: #5a6268;
        border-color: #545b62;
        font-family: 'Georgia', serif;
    }
    .product-image {
        width: 250px; 
        height: 250px;
        object-fit: cover; 
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }
    .table th, .table td {
        text-align: center;
        vertical-align: middle;
        font-size: 16px;
        color: #555;
    }
    .table-hover tbody tr:hover {
        background-color: #f8f9fa; 
    }
    .input-group {
        width: 100%;
        margin: 10px 0;
    }
    input[type="number"] {
        width: 100px;
        padding: 10px;
        margin-top: 5px;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    h1, h2, h3 {
        color: #7a6f70; /* Color inspirado en tonos Dior */
        text-align: center;
        font-weight: 600;
        
    }
    h1 {
        font-size: 36px;
        margin-bottom: 20px;
    }
    h2 {
        font-size: 28px;
        margin-bottom: 15px;
    }
    h3 {
        font-size: 24px;
        margin-bottom: 10px;
    }
</style>



</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1>Carrito de Compras</h1>
            </div>
            <div class="card-body">
                <%
                    String IdPro = request.getParameter("idpro");
                    Productos ObjP = new Productos();
                    BSCarrito ObjBS = new BSCarrito();
                    ObjP = ObjBS.BuscarProducto(IdPro);
                %>
                <form action="cesto" method="post">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <td align="center">
                                <b>IdProducto</b>: <input name="txtid" value="<%=ObjP.getIdProducto() %>" readonly class="form-control mb-2" /><br />
                                <b>Descripcion</b>: <%=ObjP.getDescripcion() %><br />
                                <b>Precio Unidad</b>: <%=ObjP.getPrecioUnidad() %><br />
                                <b>Stock Disponible</b>: <%=ObjP.getStock() %><br />
                                <b>Disponible</b>: <%= (ObjP.getEstado() == '1' ? "DISPONIBLE" : "NO DISPONIBLE") %><br />
                            </td>
                            <td>
                                <img src="image/<%=ObjP.getImagen() %>" class="product-image" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><b>Cantidad a Comprar</b></td>
                            <td>
                                <div class="input-group">
                                    <input name="txtcan" class="form-control" type="number" min="1" required />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input type="submit" value="Añadir al Carrito" class="btn btn-primary"/>
                            </td>
                        </tr>
                    </table>
                </form>
                <p class="text-center">
                    <a href="javascript:history.back()" class="btn btn-success">Seleccionar Otro Producto</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
