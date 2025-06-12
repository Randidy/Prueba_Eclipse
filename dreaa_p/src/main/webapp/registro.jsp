<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.logging.*" %>

<%
    response.setContentType("text/html;charset=UTF-8");

    String mensaje = "";
    String nuevoId = "";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendaexa2024", "root", "root");

        String tipo = request.getParameter("tipo");
        String prefijo = tipo.equals("A") ? "ADM" : "USR";

        // Obtener el último ID
        String sql = "SELECT MAX(CAST(SUBSTRING(IdUsuario, 4) AS UNSIGNED)) AS maxId FROM Usuarios WHERE IdUsuario LIKE ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, prefijo + "%");
        rs = stmt.executeQuery();

        int maxId = 0;
        if (rs.next() && rs.getString("maxId") != null) {
            maxId = rs.getInt("maxId");
        }

        nuevoId = prefijo + String.format("%05d", maxId + 1);

        // Obtener los datos del formulario
        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        String direccion = request.getParameter("direccion");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String sexo = request.getParameter("sexo");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String estado = request.getParameter("estado");

        // Validaciones
        if (apellidos == null || nombres == null || direccion == null || fechaNacimiento == null ||
            sexo == null || correo == null || password == null || estado == null ||
            apellidos.isEmpty() || nombres.isEmpty() || direccion.isEmpty() || fechaNacimiento.isEmpty() ||
            !(sexo.equals("M") || sexo.equals("F")) || correo.isEmpty() || password.isEmpty() ||
            !(estado.equals("0") || estado.equals("1"))) {
            mensaje = "Error: Todos los campos son obligatorios y deben tener valores válidos.";
        } else {
            // Validar fecha de nacimiento
            LocalDate birthDate = LocalDate.parse(fechaNacimiento);
            LocalDate todayMinus18 = LocalDate.now().minusYears(18);
            if (birthDate.isAfter(todayMinus18)) {
                mensaje = "Error: Debes tener al menos 18 años para registrarte.";
            } else {
                // Insertar en la base de datos
                String insertSQL = "INSERT INTO Usuarios (IdUsuario, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Tipo, Password, Estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertSQL);
                stmt.setString(1, nuevoId);
                stmt.setString(2, apellidos);
                stmt.setString(3, nombres);
                stmt.setString(4, direccion);
                stmt.setDate(5, Date.valueOf(fechaNacimiento));
                stmt.setString(6, sexo);
                stmt.setString(7, correo);
                stmt.setString(8, tipo);
                stmt.setString(9, password); // IMPORTANTE: Cifrar antes de guardar
                stmt.setString(10, estado);

                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    mensaje = "¡Registro exitoso!";
                } else {
                    mensaje = "Error: No se pudo registrar al usuario.";
                }
            }
        }
    } catch (Exception e) {
        Logger.getLogger("registro.jsp").log(Level.SEVERE, "Error en el registro", e);
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
    
    
%>
 <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <script>
        // Validar si el usuario es mayor de edad
        function validarEdad() {
            var fechaNacimiento = document.getElementById("fechaNacimiento").value;
            var fecha = new Date(fechaNacimiento);
            var hoy = new Date();
            var edad = hoy.getFullYear() - fecha.getFullYear();
            var mes = hoy.getMonth() - fecha.getMonth();
            if (mes < 0 || (mes === 0 && hoy.getDate() < fecha.getDate())) {
                edad--;
            }

            if (edad < 18) {
                document.getElementById("mensajeEdad").innerHTML = "Debes tener al menos 18 años para registrarte.";
                return false;
            } else {
                document.getElementById("mensajeEdad").innerHTML = ""; // Limpiar mensaje si es mayor de edad
                return true;
            }
        }
        
       
    </script>
</head>
<body onload="mostrarMensaje();">
<div class="form-container">
    <h1>Registro de Usuario</h1>
    <form action="registro.jsp" method="post" onsubmit="return validarEdad();">
        <input type="text" id="idUsuario" name="idUsuario" placeholder="Elegir tipo de usuario" value="<%=nuevoId%>" readonly><br>
        <input type="text" id="apellidos" name="apellidos" placeholder="Apellidos" required><br>
        <input type="text" id="nombres" name="nombres" placeholder="Nombres" required><br>
        <input type="text" id="direccion" name="direccion" placeholder="Dirección" required><br>
        <input type="date" id="fechaNacimiento" name="fechaNacimiento" required><br>
        <select id="sexo" name="sexo" required>
            <option value="" disabled selected>Sexo</option>
            <option value="M">Masculino</option>
            <option value="F">Femenino</option>
        </select><br>
        <input type="email" id="correo" name="correo" placeholder="Correo Electrónico" required><br>
        <select id="tipo" name="tipo" required>
            <option value="" disabled selected>Tipo</option>
            <option value="A">Administrador</option>
            <option value="U">Usuario</option>
        </select><br>
        <input type="password" id="password" name="password" placeholder="Contraseña" required><br>
        <select id="estado" name="estado" required>
            <option value="" disabled selected>Estado</option>
            <option value="1">Activo</option>
            <option value="0">Inactivo</option>
        </select><br><br>
        <button type="submit" class="btn-submit">Registrar Usuario</button>
        <br> <br>
        <a href=identificar.html> Regresar a la pagina de inicio</a>
    </form>
</div>

   <script type="text/javascript">
   // Mostrar alerta con mensaje del servidor
   function mostrarMensaje() {
       var mensaje = "<%= mensaje %>";
       if (mensaje) {
           alert(mensaje);
       }
   }
   </script>
 <!-- Incluir Bootstrap JS desde CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7S6J5W4R6f0rIEMMGYqXyB8Y4Lhro4/4x5Jq4rTnQuI2qU6XxjwM+Mcg8hXYq1" crossorigin="anonymous"></script>
 
</body>
<style>
    body {
        background: linear-gradient(120deg, #EDDFE0, #F5F5F7);
        font-family: 'Georgia', serif;
        color: #322C2B;
        margin: 0;
        height: 890px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-container {
        background-color: #F5F5F7;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
    }

    h1 {
        font-size: 36px;
        font-weight: bold;
        color: #A87C7C;
        text-align: center;
        margin-bottom: 30px;
    }

    input, select {
        border-radius: 10px;
        padding: 10px;
        width: 100%;
        height: 45px; /* Altura consistente */
        border: 1px solid #ddd;
        margin-bottom: 15px;
        font-size: 16px;
        box-sizing: border-box; /* Asegura que padding y border no cambien el tamaño */
    }

    input:focus, select:focus {
        outline: none;
        border: 1px solid #A87C7C;
        box-shadow: 0 0 5px rgba(168, 124, 124, 0.5);
    }

    .btn-submit {
        background-color: #A87C7C;
        color: white;
        padding: 12px 25px;
        border-radius: 50px;
        font-size: 18px;
        width: 100%;
        border: none;
    }

    .btn-submit:hover {
        background-color: #C39898;
    }
    a {
        text-decoration: none;
        display: flex; /* Para que align-items y text-align funcionen */
        align-items: center;
        justify-content: center; 
        color: black;
        }
      a:hover{
      color: #A87C7C;
      
      }
</style>
</html>
