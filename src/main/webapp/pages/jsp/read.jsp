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

		<div class="container" style="padding-top: 8em;">

			<h3 style="font-family: cursive;">
				<b>Hoi</b> ${user}
			</h3>
			<br />
			<f:form action="/read" method="post" modelAttribute="ty">
				<div class="form-group">
					<label for="exampleFormControlSelect1" name="type">Select
						Type</label>
					<f:select class="form-control" path="type"
						id="exampleFormControlSelect1" name="type">
						<f:option value="all">All</f:option>
						<f:option value="normal">Normal Message</f:option>
						<f:option value="kavithai">Kavithai</f:option>

					</f:select>
				</div>
				<button type="submit" class="btn btn-success">Filter</button>
			</f:form>
			<svg class="bi bi-heart-fill" width="1em" height="1em"
				viewBox="0 0 16 16" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
					d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
					clip-rule="evenodd" />
</svg>
			<br />
			<h6 style="color: green;">${type}</h6>
<br/>

			<a href="/home" class="btn btn-primary">Go to Home Page</a>
		</div>

	</div>

	<div class="container">
		<c:forEach items="${messages}" var="m">


			<c:choose>
				<c:when test="${user=='deepash' && m.who=='monika'}">
					<div style="text-align: left;">
						Monika: <span class="table-danger"> <b>${m.message}</b>
						</span>
					</div>
					<br />
				</c:when>

				<c:when test="${user=='deepash' && m.who=='deepash'}">
					<div style="text-align: right;">
						You: <span class="table-success"> <b>${m.message}</b>
						</span>
					</div>
					<br />
				</c:when>

				<c:when test="${user=='monika' && m.who=='deepash'}">
					<div style="text-align: left;">
						Deepash: <span class="table-danger"> <b>${m.message}</b>
						</span>
					</div>
					<br />
				</c:when>

				<c:when test="${user=='monika' && m.who=='monika'}">

					<div style="text-align: right;">
						You: <span class="table-success"><b>${m.message}</b> </span>
					</div>
					<br />
				</c:when>

			</c:choose>
			<br />
		</c:forEach>

		<br />

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pg!=0}">
					<li class="page-item"><a class="page-link"
						href="/read?pg=${pg-1}&typ=${ty.type}" tabindex="-1">Previous</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${size}">
					<c:if test="${pg+1 == i }">
						<li class="page-item active"><a class="page-link "
							href="/read?pg=${i-1}&typ=${ty.type}">${i}</a></li>

					</c:if>
					<c:if test="${pg+1 != i }">


						<li class="page-item"><a class="page-link "
							href="/read?pg=${i-1}&typ=${ty.type}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pg!=size-1}">
					<li class="page-item"><a class="page-link"
						href="/read?pg=${pg+1}&typ=${ty.type}">Next</a></li>
				</c:if>
			</ul>
		</nav>




	</div>

	<br />

</body>

</html>