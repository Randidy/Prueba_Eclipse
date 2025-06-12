package CapaEntidad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import CapaDatos.BDCarrito;
import CapaEntidad.Productos;
import CapaEntidad.carrito;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

public class cesto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.print("<style>");
        out.print("body {");
        out.print("    background: linear-gradient(120deg, #F1E5D1, #DBB5B5, #987070, #FFF8E3, #F5EEE6);");
        out.print("    font-family: 'Georgia', serif;");
        out.print("    color: #503C3C;");
        out.print("    text-align: center;");
        out.print("    margin: 0;");
        out.print("    padding: 0;");
        out.print("}");
        out.print("h1 {");
        out.print("    color: #503C3C;");
        out.print("    font-family: 'Arial', sans-serif;");
        out.print("    font-weight: bold;");
        out.print("    font-size: 36px;");
        out.print("    margin-bottom: 30px;");
        out.print("}");
        out.print("table {");
        out.print("    margin: auto;");
        out.print("    width: 90%;");
        out.print("    border-radius: 10px;");
        out.print("    overflow: hidden;");
        out.print("    border-collapse: collapse;");
        out.print("}");
        out.print("th, td {");
        out.print("    padding: 15px;");
        out.print("    text-align: center;");
        out.print("    font-size: 16px;");
        out.print("}");
        out.print("th {");
        out.print("    background-color: #987070;");
        out.print("    color: white;");
        out.print("}");
        out.print("td {");
        out.print("    background-color: #FFF8E3;");
        out.print("}");
        out.print("a.btn {");
        out.print("    font-size: 16px;");
        out.print("    padding: 10px 20px;");
        out.print("    border-radius: 5px;");
        out.print("    text-decoration: none;");
        out.print("    display: inline-block;");
        out.print("    margin: 5px;");
        out.print("}");
        out.print(".btn-success { background-color: #27AE60; color: white; }");
        out.print(".btn-primary { background-color: #2980B9; color: white; }");
        out.print(".btn-danger { background-color: #E74C3C; color: white; }");
        out.print(".btn-warning { background-color: #F39C12; color: white; }");
        out.print("</style>");
        
        out.print("<!DOCTYPE html>");
        out.print("<html>");
        out.print("<head>");
        out.print("<title>Cesto de Compra</title>");
        out.print("</head>");
        out.print("<body>");

        out.print("<div class='container mt-5'>");
        out.print("<h1 class='mb-4'>Cesto de Compra</h1>");

        try {
            // Enlaces del carrito con estilos personalizados
            String enlace1 = "<a href='index.jsp' class='btn btn-success'>Seguir Comprando</a>";
            String enlace2 = "<a href='identificar.html' class='btn btn-primary'>Pagar Compra</a>";
            String enlace3 = "<a href='cancelar.jsp' class='btn btn-danger'>Cancelar Compra</a>";

            // Variable de la clase BD
            BDCarrito ObjBD = new BDCarrito();

            // Recuperando los valores del formulario
            String IdPro = request.getParameter("txtid");
            int Cant = Integer.parseInt(request.getParameter("txtcan"));

            // Agregar los valores del formulario a un objeto de tipo carrito
            carrito ObjC = new carrito(IdPro, Cant);

            // Variable para acceder a la sesión del proyecto web
            HttpSession MiSesion = request.getSession();

            // Declarar un ArrayList de tipo carrito
            ArrayList<carrito> Lista = (ArrayList<carrito>) MiSesion.getAttribute("cesto");

            // Verificar si se lograron recuperar valores de la sesión
            if (Lista == null) {
                Lista = new ArrayList<>();
                Lista.add(ObjC);
            } else {
                // Si ya existen elementos en la lista
                boolean encontrado = false;
                for (int i = 0; i < Lista.size(); i++) {
                    carrito Obj = Lista.get(i);
                    if (Obj.getIdProducto().equalsIgnoreCase(IdPro)) {
                        encontrado = true;
                        Obj.setCantidad(Obj.getCantidad() + Cant);
                        Lista.set(i, Obj);
                        break;
                    }
                }
                // Si no se encontró el producto, añadirlo al cesto
                if (!encontrado && Cant != 0) {
                    Lista.add(ObjC);
                }
            }

            // Actualizar el valor de la sesión
            if (Cant != 0) {
                MiSesion.setAttribute("cesto", Lista);
            }

            // Construir la factura con estilos personalizados
            String tabla = "<table>";
            tabla += "<thead>";
            tabla += "<tr>";
            tabla += "<th>Item</th>";
            tabla += "<th>IdProducto</th>";
            tabla += "<th>Descripcion</th>";
            tabla += "<th>Imagen</th>";
            tabla += "<th>Precio</th>";
            tabla += "<th>Cantidad</th>";
            tabla += "<th>Sub-Total</th>";
            tabla += "<th>Opciones</th>";
            tabla += "</tr>";
            tabla += "</thead>";

            tabla += "<tbody>";
            double Total = 0;
            int i;

            for (i = 0; i < Lista.size(); i++) {
                Productos Obj = ObjBD.BuscarProducto(Lista.get(i).getIdProducto());
                String enlace = "suprimir.jsp?id=" + Obj.getIdProducto();
                double Precio = Obj.getPrecioUnidad();
                int Cantidad = Lista.get(i).getCantidad();
                double SubTotal = Precio * Cantidad;
                Total += SubTotal;

                tabla += "<tr>";
                tabla += "<td>" + (i + 1) + "</td>";
                tabla += "<td>" + Obj.getIdProducto() + "</td>";
                tabla += "<td>" + Obj.getDescripcion() + "</td>";
                tabla += "<td><img src='image/" + Obj.getImagen() + "' width='50'></td>";
                tabla += "<td>S/. " + Precio + "</td>";
                tabla += "<td>" + Cantidad + "</td>";
                tabla += "<td>S/. " + SubTotal + "</td>";
                tabla += "<td><a href='" + enlace + "' class='btn btn-warning'>Suprimir</a></td>";
                tabla += "</tr>";
            }

            tabla += "<tr style='background-color: #F39C12; color: white;'>";
            tabla += "<th colspan='6'>TOTAL GENERAL</th>";
            tabla += "<th>S/. " + Total + "</th>";
            tabla += "<th></th>";
            tabla += "</tr>";

            tabla += "<tr>";
            tabla += "<td colspan='8' class='text-center'>";
            tabla += enlace1 + " " + enlace2 + " " + enlace3;
            tabla += "</td>";
            tabla += "</tr>";

            tabla += "</tbody>";
            tabla += "</table>";

            out.print(tabla);

            // Guardar valores en sesión
            MiSesion.setAttribute("numarticulos", i);
            MiSesion.setAttribute("total", Total);

        } catch (Exception e) {
            System.out.println("*** ERROR: " + e.getMessage());
        } finally {
            out.print("</div>");
            out.print("</body>");
            out.print("</html>");
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Cesto de compra";
    }
}
