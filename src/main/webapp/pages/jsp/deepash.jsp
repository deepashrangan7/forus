<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>WithLove</title>


<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</head>

<body>


	<div style="text-align: center;">

		<div class="container" style="padding-top: 12em;">

			<h3 style="font-family: cursive;">Welcome !!! my dear Deepash</h3>
			<br /> <br />
			<c:choose>

				<c:when test="${auth==false}">

					<form action="/deepash" method="post">



						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" autofocus="autofocus" class="form-control" name="password"
								id="exampleInputPassword1">
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
					<br />
					<i style="color: red">${err}</i>
					<br />
				</c:when>

				<c:otherwise>
					<a href="/send" class="btn btn-outline-success">Send a Love To
						your Wife</a>
					<br />
					<br />
					<a href="/read" class="btn btn-outline-success">Look what she
						sent</a>
					<br />
					<br />

					<a href="#" class="btn btn-outline-success">Look at your media</a>
					<br />
					<br />
					<a href="/monika" class="btn btn-outline-success">Sign In as
						Monika Deepash</a>

				</c:otherwise>
			</c:choose>
			<br />
		</div>

	</div>
</body>

</html>