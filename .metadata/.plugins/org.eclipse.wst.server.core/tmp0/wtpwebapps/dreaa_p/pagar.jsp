<html>
	<head>
		<title>Verificar</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
	<body>
	<%@ include file="navBar.jsp" %>
		<center>
			<h1>Iniciar Sesion</h1>
			<form action="verificar.jsp">
				<table class='table'>
				    <tr>
				        <td>IdUsuario</td>
				        <td><input name="txtid" /></td>
				    </tr>
				    <tr>
				        <td>Password</td>
				        <td><input name="txtpass" /></td>
				    </tr>
				    <tr>
				        <td><input type="submit" /></td>
				        <td><input type="reset" /></td>
				    </tr>
				    <tr>
				        <td colspan="2" align="center">
				            <a href="registro.jsp">Usuario Nuevo (Registrarse)</a>
				        </td>
				    </tr>
				</table>
			</form>
		</center>
		
		<style>
        body {
            background: linear-gradient(120deg, #EDDFE0, #F5F5F7);
            font-family: 'Georgia', serif;
            color: #322C2B;
            margin: 0;
            height: 100vh;
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

        .form-group input {
            border-radius: 10px;
            padding: 10px;
            width: 100%;
            border: 1px solid #ddd;
            margin-bottom: 15px;
            font-size: 16px;
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

        .link-container {
            text-align: center;
            margin-top: 20px;
        }

        .link-container a {
            color: #A87C7C;
            font-size: 16px;
            text-decoration: none;
        }

        .link-container a:hover {
            text-decoration: underline;
        }
    </style>
	</body>
</html>
