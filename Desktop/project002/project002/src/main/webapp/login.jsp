<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Sign up / Login Form</title>
  <link rel="stylesheet" href="./css/login.css">

</head>
<body>
<!-- partial:index.partial.html -->
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">
                <p class="text-danger">${mess}</p>
                
			<div class="signup">
				<form action="./login" method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="username" name="username" placeholder="User name" required="">
					<input type="password" name="password" placeholder="Password" required="">
					<button type="submit" value="Submit">Login</button>
				</form>
			</div>

			<div class="login" >
				<form action="./login" method="post">
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="username" name="username" placeholder="Username" required="">
					<input type="password" name="password" placeholder="Password" required="">
                                        
					<button type="submit" value="Submit">Sign up</button>  
				</form>
			</div>
	</div>
</body>
</html>
<!-- partial -->
  
</body>
</html>
