<%@ page import="java.util.ArrayList" %>
<%@ page import="CapaEntidad.carrito" %>
<%@ page import="CapaEntidad.Productos" %>
<%@ page import="CapaDatos.BDCarrito" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(120deg, #F1E5D1, #DBB5B5);
            font-family: 'Georgia', serif;
            color: #322C2B;
        }

        .container {
            margin-top: 50px;
        }

        h1 {
            color: #987070;
            font-weight: bold;
            font-family: 'Arial', sans-serif;
            font-size: 2.5rem;
            text-align: center;
        }

        .btn-custom {
            font-size: 16px;
            padding: 12px 25px;
            border-radius: 25px;
            text-transform: uppercase;
            background-color: #C39898;
            border-color: #C39898;
            color: white;
        }

        .btn-custom:hover {
            background-color: #987070;
            border-color: #987070;
        }

        .table-custom {
            background-color: #FFF8F0;
            border-radius: 10px;
            overflow: hidden;
        }

        .table-custom th, .table-custom td {
            text-align: center;
        }

        .table-custom th {
            background-color: #987070;
            color: white;
        }

        .table-custom tr:nth-child(even) {
            background-color: #F9E6E1;
        }

        .table-custom tr:hover {
            background-color: #F2D9D2;
        }

        .total-row {
            background-color: #DBB5B5;
            color: white;
            font-weight: bold;
        }

        .options-btns {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Cesto de Compra</h1>

    <%
        // Recuperamos la sesión y la lista del carrito
        HttpSession MiSesion = request.getSession();
        ArrayList<carrito> listaCarrito = (ArrayList<carrito>) session.getAttribute("cesto");
        BDCarrito objBD = new BDCarrito();

        if (listaCarrito == null || listaCarrito.size() == 0) {
            out.print("<p class='alert alert-warning text-center'>No hay productos en el carrito.</p>");
            // Botón para regresar al inicio cuando el carrito está vacío
            out.print("<div class='text-center'><a href='index.jsp' class='btn btn-info btn-custom'>Regresar al Inicio</a></div>");
        } else {
            double total = 0;
            String tabla = "<table class='table table-custom table-bordered'>";
            tabla += "<thead>";
            tabla += "<tr>";
            tabla += "<th>Item</th>";
            tabla += "<th>IdProducto</th>";
            tabla += "<th>Descripción</th>";
            tabla += "<th>Imagen</th>";
            tabla += "<th>Precio</th>";
            tabla += "<th>Cantidad</th>";
            tabla += "<th>Sub-Total</th>";
            tabla += "<th>Opciones</th>";
            tabla += "</tr>";
            tabla += "</thead><tbody>";

            // Recorremos la lista de productos en el carrito
            for (int i = 0; i < listaCarrito.size(); i++) {
                carrito item = listaCarrito.get(i);
                Productos producto = objBD.BuscarProducto(item.getIdProducto());
                double precio = producto.getPrecioUnidad();
                int cantidad = item.getCantidad();
                double subtotal = precio * cantidad;
                total += subtotal;

                tabla += "<tr>";
                tabla += "<td>" + (i + 1) + "</td>";
                tabla += "<td>" + producto.getIdProducto() + "</td>";
                tabla += "<td>" + producto.getDescripcion() + "</td>";
                tabla += "<td><img src='image/" + producto.getImagen() + "' width='50'></td>";
                tabla += "<td>S/. " + precio + "</td>";
                tabla += "<td>" + cantidad + "</td>";
                tabla += "<td>S/. " + subtotal + "</td>";
                tabla += "<td><a href='suprimir.jsp?id=" + producto.getIdProducto() + "' class='btn btn-warning btn-custom'>Suprimir</a></td>";
                tabla += "</tr>";
            }

            tabla += "<tr class='total-row'>";
            tabla += "<th colspan='6'>TOTAL GENERAL</th>";
            tabla += "<th>S/. " + total + "</th>";
            tabla += "<th></th>";
            tabla += "</tr>";
            tabla += "<tr class='options-btns'>";
            tabla += "<td colspan='8'>";
            tabla += "<a href='index.jsp' class='btn btn-success btn-custom'>Seguir Comprando</a> ";
            tabla += "<a href='identificar.html' class='btn btn-primary btn-custom'>Pagar Compra</a> ";
            tabla += "<a href='cancelar.jsp' class='btn btn-danger btn-custom'>Cancelar Compra</a>";
            tabla += "</td>";
            tabla += "</tr>";
            tabla += "</tbody></table>";

            out.print(tabla);
        }
    %>
</div>

</body>
</html>
