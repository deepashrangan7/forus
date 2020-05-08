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

			<h3 style="font-family: cursive;">
				<b>Hoi</b> ${user} type your message
			</h3>
			<br />
			<form action="/send" method="post">
				<div class="form-group">
					<label for="exampleFormControlSelect1" name="type">Select
						Type</label> <select class="form-control" id="exampleFormControlSelect1"
						name="type">
						<option value="normal">Normal Message</option>
						<option value="kavithai">Kavithai</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">Your Message</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="20" cols="30" name="message"></textarea>
				</div>
				<button type="submit" class="btn btn-success">Send</button>
			</form>
			<br /> <a href="/home" class="btn btn-primary">Go to Home Page</a>

		</div>

	</div>
</body>

</html>