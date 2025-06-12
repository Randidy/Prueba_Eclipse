<%@page session="true" %>
<%@page import="CapaEntidad.*, CapaNegocio.BSCarrito" %>
<%@page import="java.util.ArrayList" %>
<%
    // Recuperar valores de la sesion actual
    HttpSession MiSesion = request.getSession();
    String IdCliente = (String)MiSesion.getAttribute("IdCliente");
    String FechaVenta = (String)MiSesion.getAttribute("Fecha");
    double MontoTotal = (Double)MiSesion.getAttribute("Total");
    ArrayList<carrito> Lista = new ArrayList<carrito>();
    Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
    
    BSCarrito ObjBD = new BSCarrito();
    // Devuelve el numero de filas de una tabla
    int filas = ObjBD.NumeroFilas("ventas");
    String IdVenta;
    // Si no hay filas genera el primer codigo
    if(filas == 0){
        IdVenta = "VTA0000001";
    }else{
        // Caso contrario genera el correlativo
        IdVenta = "VTA"+String.format("%07d",filas+1);
    }
    
    // Grabar fila en la tabla ventas
    Ventas ObjV = new Ventas(IdVenta, IdCliente, FechaVenta, MontoTotal, '1');
    ObjBD.InsertarVenta(ObjV);
    
    // Grabar filas en la tabla detalle
    for(carrito item : Lista){
        String IdPro = item.getIdProducto();
        Productos ObjP = new Productos();
        ObjP = ObjBD.BuscarProducto(IdPro);
        Detalle ObjD = new Detalle(IdVenta,IdPro,item.getCantidad(),ObjP.getPrecioUnidad(),'1');
        ObjBD.InsertarDetalle(ObjD);        
    }
    //------------------------------------------------
    // Modificacion del Stock en la tabla Productos
    //------------------------------------------------
    
    // Limpiar el cesto de la sesion
    MiSesion.removeAttribute("cesto");
    MiSesion.setAttribute("numarticulos", 0);
    MiSesion.setAttribute("total", 0.0);
%>    
<div class="container" style="text-align: center; margin-top: 100px; font-family: 'Georgia', serif; background-color: #F5F5F7; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 40px;">
    <h1 style="color: #A87C7C;">¡Gracias por su compra!</h1>
    <p style="font-size: 20px; color: #5D5D5D;">Su pedido ha sido procesado correctamente.</p>
    <img src="image/Gracias.JPG" alt="Gracias por su compra" class="img-fluid" style="width: 200px; border-radius: 10px; margin-top: 20px;">

    <div style="margin-top: 30px;">
        <a href="index.jsp" class="btn btn-custom" style="background-color: #A87C7C; color: white; padding: 12px 25px; border-radius: 50px; font-size: 18px; text-decoration: none;">Hacer Click para retornar a la Pagina Principal</a>
    </div>
</div>

<style>
    body {
        background: linear-gradient(120deg, #F5F5F7, #EDDFE0);
        font-family: 'Georgia', serif;
        color: #322C2B;
        margin: 0;
    }

    .btn-custom {
        background-color: #A87C7C;
        color: white;
        padding: 12px 25px;
        border-radius: 50px;
        font-size: 18px;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #C39898;
    }

    .heading {
        font-size: 36px;
        font-weight: bold;
        color: #A87C7C;
    }

    .message {
        font-size: 20px;
        color: #5D5D5D;
    }

    img {
        border-radius: 10px;
        max-width: 100%;
    }

    .container {
        background-color: #F5F5F7;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 40px;
    }

    .container a {
        text-decoration: none;
    }
</style>