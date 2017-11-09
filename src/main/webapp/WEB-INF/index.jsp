<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ninja Gold Game</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
		
	<h1>Your Gold: <c:out value="${ totalGold }" /></h1>
		
	<div class="main">
		<div class="category">
			<h1>Farm</h1>
			<h3>(earns 10 - 20 gold)</h3>
			<form action="/process" method="POST">
				<button name="farm"  value="farm">Find Gold!</button>
			</form>
		
		</div>
		<div class="category">
			<h1>Cave</h1>
			<h3>(earns 5 - 10 gold)</h3>
			<form action="/process" method="POST">
				<button name="cave" value="cave">Find Gold!</button>
			</form>
		</div>
		<div class="category">
			<h1>House</h1>
			<h3>(earns 2 - 5 gold)</h3>
			<form action="/process" method="POST">
				<button name="house" value="house">Find Gold!</button>
			</form>
		</div>
		<div class="category">
			<h1>Casino!</h1>
			<h3>(earns/takes 0 - 50 gold)</h3>
			<form action="/process" method="POST">
				<button name="casino" value="casion">Find Gold!</button>
			</form>
		</div>
	</div>
	<br>
	<h1>Activities</h1>
	
	<div class="acitivities">		
		<c:forEach items="${activities }" var="activity">
			<c:choose>
			  <c:when test="${activity.contains('lost')}">
			   <p class="red">"${ activity }"</p>
		 	 </c:when>			
		 	 <c:otherwise>
		    	<p class="green">"${ activity }"</p>
		 	 </c:otherwise>
			</c:choose>
		</c:forEach>
	</div>

</body>
</html>