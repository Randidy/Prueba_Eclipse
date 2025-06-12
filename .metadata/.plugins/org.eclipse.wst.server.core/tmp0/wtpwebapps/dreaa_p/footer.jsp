<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <footer class="footer mt-5" style="background-color: #EDDFE0; padding: 40px 0;">
  <div class="container py-4" style="background-color: #F5F5F7; padding: 20px; border-radius: 12px;">
    <div class="row">
      <!-- Contacto -->
      <div class="col-md-4" style="border: 1px solid #B7B7B7; padding: 20px; border-radius: 8px; background-color: #fff; margin: 10px;">
        <h5 class="footer-title" style="color: #705C53;">Contacto</h5>
        <p style="color: #705C53;">
          Teléfono: +51 123 456 789 <br>
          Email: <a href="mailto:contacto@dior.com" style="color: #705C53;">contacto@dior.com</a>
        </p>
      </div>

      <!-- Ubicación -->
      <div class="col-md-4" style="border: 1px solid #B7B7B7; padding: 20px; border-radius: 8px; background-color: #fff; margin: 10px;">
        <h5 class="footer-title" style="color: #705C53;">Dónde Nos Ubicamos</h5>
        <p style="color: #705C53;">
          Dirección: Av. Siempre Viva 123, Lima, Perú <br>
          Horario: Lun-Vie 10:00am - 6:00pm
        </p>
      </div>

      <!-- Categorías -->
      <div class="col-md-4" style="border: 1px solid #B7B7B7; padding: 20px; border-radius: 8px; background-color: #fff; margin: 10px;">
        <h5 class="footer-title" style="color: #705C53;">Categorías</h5>
        <ul class="footer-links" style="list-style: none; padding: 0; color: #705C53;">
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT001" style="color: #705C53;">Perfumes</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT002" style="color: #705C53;">Maquillaje</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT003" style="color: #705C53;">Tratamiento</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT004" style="color: #705C53;">Bolsos</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT005" style="color: #705C53;">Sneakers</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT006" style="color: #705C53;">Acessorios</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT007" style="color: #705C53;">Ropa</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT008" style="color: #705C53;">Tacones</a></li>
          <li><a href="http://localhost:8080/CarritoDise%C3%B1o/verproductos.jsp?idcat=CAT009" style="color: #705C53;">Bufandas y chales</a></li>
        </ul>
      </div>
    </div>

    <div class="row mt-4">
      <!-- Redes Sociales -->
      <div class="col text-center">
        <h5 class="footer-title" style="color: #705C53;">Síguenos</h5>
        <a href="https://facebook.com" target="_blank" class="footer-social" style="color: #705C53;">
          <i class="fab fa-facebook fa-lg"></i>
        </a>
        <a href="https://twitter.com" target="_blank" class="footer-social mx-3" style="color: #705C53;">
          <i class="fab fa-twitter fa-lg"></i>
        </a>
        <a href="https://instagram.com" target="_blank" class="footer-social" style="color: #705C53;">
          <i class="fab fa-instagram fa-lg"></i>
        </a>
      </div>
    </div>
  </div>
</footer>

<style>
.col-md-4, .col-sm-6 {
	    flex: 1 1 30%; 
	    min-height: 100px; 
	}

	.container {
	    padding: 40px;
	}
	

.footer {
  background-color: #EDDFE0;
  padding: 40px 0;
}

.footer .container {
  background-color: #F5F5F7;
  padding: 20px;
  border-radius: 12px;
}

.footer .footer-title {
  font-size: 1.25rem;
  font-weight: bold;
  color: #705C53;
  text-align: center;
  margin-bottom: 15px;
}

.footer .footer-links {
  list-style: none;
  padding: 0;
}

.footer .footer-links a {
  color: #705C53;
  text-decoration: none;
  position: relative;
  display: inline-block;
}
.footer .footer-links a::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 1px;
  background-color: #705C53;
  transition: width 0.3s ease;
}

.footer .footer-links a:hover::after {
  width: 100%; 
}

.footer .footer-links li {
  margin-bottom: 5px;
}

.footer .footer-social {
  margin: 0 10px;
}

.footer .footer-social i {
  font-size: 1.5rem;
  color: #705C53;
}

.footer .footer-social:hover i {
  color: #007bff;
}

.footer-social {
  text-decoration: none;
}

footer .col {
  border: 1px solid #B7B7B7;
  padding: 20px;
  border-radius: 8px;
  background-color: #fff;
  margin: 10px;
  
</style>
</body>
</html>