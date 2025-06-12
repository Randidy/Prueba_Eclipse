<%@page import="CapaEntidad.*"%>
<%@page import="CapaNegocio.BSCarrito"%>
<%@page import="CapaDatos.BDCarrito"%>
<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<%
	BSCarrito ObjBD = new BSCarrito();	
	Clientes ObjC = new Clientes();
	String cadenaFecha = "";
	ArrayList<carrito> Lista = new ArrayList<>();
	HttpSession MiSesion = request.getSession();
	try{
	    // Recuperar valores del formulario
	    String IdUsuario = request.getParameter("txtid");
	    String Password = request.getParameter("txtpwd");
	    if(!ObjBD.VerificaUsuario(IdUsuario, Password)){
	        out.print("=== ERROR EN USUARIO O CONTRASEÑA ===");
	        out.print("<<br><a href=pagar.jsp>Identificarse otra vez</a>");
	    }else{
	    	// Recuperar informacion de cliente		    
		    ObjC = ObjBD.InfoUsuario(IdUsuario);
		 	// Recuperar la informacion del cesto
		    Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
		 	// Recuperando la fecha actual del sistema
		    Date fechaActual = new Date();
		    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		    cadenaFecha = formato.format(fechaActual);
		    // Guardar en la sesion actual los datos del cliente
		    MiSesion.setAttribute("IdCliente", IdUsuario);
		    MiSesion.setAttribute("Fecha", cadenaFecha);
	    }	    	    	    
	}catch(Exception ex){
		out.print("ERROR :" + ex.getMessage());	
	}
%>
<center>
    <table class="table">
        <tr>
            <td colspan="6">
            	<h3>DATOS DEL USUARIO: <%=ObjC.getApellidos()%>,<%=ObjC.getNombres()%> | 
            	<%=ObjC.getIdCliente()%> | <%=cadenaFecha%></h3><hr />
            </td>
        </tr>
        <tr bgcolor="YELLOW">
            <th>Item</th>
            <th>IdProducto</th>
            <th>Descripcion</th>
            <th>Cantidad</th>
            <th>PrecioUnidad</th>
            <th>SubTotal</th>
        </tr>
        <%  double Total = 0;
            for(int i = 0; i < Lista.size(); i++){ 
                Productos ObjP = new Productos();
                ObjP = ObjBD.BuscarProducto(Lista.get(i).getIdProducto());
                int Cantidad = Lista.get(i).getCantidad();
                double Precio = ObjP.getPrecioUnidad();
                double SubTotal = Cantidad * Precio;
                Total += SubTotal;
        %>
            <tr>
                <td><%=(i+1)%></td>
                <td><%=ObjP.getIdProducto()%></td>
                <td><%=ObjP.getDescripcion()%></td>
                <td><%=Cantidad%></td>
                <td><%=Precio%></td>
                <td><%=SubTotal%></td>
            </tr>    
        <% } %>
        <tr bgcolor="YELLOW">
            <td colspan="4" align="right"><b>TOTAL A PAGAR</b></td>
            <td><b>S/. <%=Total%> SOLES</b></td>
            <td></td>
        </tr>
    </table>
<%
    // Guardar el total a pagar
    MiSesion.setAttribute("Total", Total);
%>        
<a href="pagarCompra.jsp" class="btn btn-primary">Hacer Click para pagar la Compra</a>
</center>
<style>
    body {
        background-color: #F5F5F7;
        font-family: 'Arial', sans-serif;
        margin-top: 20px;
        transition: background-color 0.3s ease;
    }

    h3 {
        text-align: center;
        color: #705C53;
        font-weight: bold;
        margin-bottom: 20px;
        transition: color 0.3s ease;
    }

    .table {
        width: 90%;
        margin: 20px auto;
        border-radius: 8px;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        background-color: #EDDFE0;
        transition: transform 0.3s ease;
    }

    .table thead {
        background-color: #B7B7B7; /* Color gris claro */
    }

    .table thead th {
        color: #705C53;
        font-weight: bold;
        text-transform: uppercase;
        padding: 12px;
    }

    .table tbody tr:nth-child(even) {
        background-color: #FFFFFF;
    }

    .table tbody tr:nth-child(odd) {
        background-color: #F5F5F7;
    }

   

    .btn-primary {
        background-color: #B7B7B7; 
        border: none;
        border-radius: 30px;
        padding: 15px 35px;
        color: white; 
        font-size: 18px; 
        font-weight: bold; 
        text-align: center; 
        text-decoration: none; 
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease; 
        display: inline-block; 
    }

    .btn-primary:hover {
        background-color: #EDDFE0; /* Gris claro */
        transform: translateY(-5px); /* Eleva el botón */
        box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.2); /* Aumenta la sombra al hacer hover */
    }
</style>