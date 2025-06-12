<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" import="CapaEntidad.Categorias, CapaNegocio.BSCarrito, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Index</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    </head>
    <body>
      <style>
        /* Estilo para el contenedor del video */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            font-family: Arial, sans-serif;
        }

        .video-container {
            position: relative;
            width: 100%;
            height: 100%;
        }

        /* Video en fullscreen */
        video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 1;
        }

        /* Título en el centro */
        .title {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 3rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            text-align: center;
            z-index: 2;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }

        .title:hover {
            transform: translate(-50%, -50%) scale(1.1);
        }

        /* Footer */
        footer {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px;
            z-index: 3;
        }
    </style>
</head>
<body>
   <style>
        /* Estilo para el contenedor */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            font-family: Arial, sans-serif;
        }

        .gif-container {
            position: relative;
            width: 100%;
            height: 100%;
        }

        /* GIF en fullscreen */
        .fullscreen-gif {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 1;
        }

        /* Título en el centro */
        .title {
        	font-family:'Georgia', serif;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 5rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            text-align: center;
            z-index: 2;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }

        .title:hover {
            transform: translate(-50%, -50%) scale(1.1);
        }

        /* Footer */
        footer {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px;
            z-index: 3;
        }
    </style>
</head>
<body>
    <div class="gif-container">
        <!-- GIF en fullscreen -->
        <img src="image/jisso.gif" alt="GIF de fondo" class="fullscreen-gif">

        <!-- Título en el centro -->
        <div class="title" onclick="navigateToPage()">D'rea</div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 D'rea. Todos los derechos reservados.
    </footer>

    <script>
        // Navegar a otra página con animación
        function navigateToPage() {
            document.body.style.transition = 'transform 0.6s ease-in-out';
            document.body.style.transform = 'translateY(-100%)';

            setTimeout(() => {
                window.location.href = "index.jsp";
            }, 600); // Tiempo para la animación antes de redirigir
        }
    </script>
    </body>
</html>