<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.*"%>
<%@page import="com.advancejava.model.Book"%>

<!-- to prevent access before login and to prevent going back after logout-->
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.

if (session.getAttribute("username") == null) {
	response.sendRedirect("/");
}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>

<body>




	<div class="container-fluid">
		<div class="fixed-header">
			<div id="title" style="text-align: right;">

				<form action="Logout" method="post">
					<b>Welcome ${username} <input type="submit"
						class="btn btn-outline-success " value="Logout">
				</form>
			</div>
			<div id="title" style="text-align: center;">
				<h1 style="background-color: DodgerBlue;">Books Listing</h1>

			</div>

			<form action="Add" method="post">
				<button type="submit" class=" btn btn-primary mt-5 px-3"
					style="text-align: center; font-size: 15px; font-weight: 500; margin-left: 87%">Add Book</button>
			</form>
			<br>
			<!-- table creation -->
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th scope="col">Book Code</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Data Added</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach items="${books}" var="Book">
						<tr>
							<td>${Book.getId()}</td>
							<td>${Book.getName()}</td>
							<td>${Book.getAuthor().getAuthorname()}</td>
							<td>${Book.getDate()}</td>
							<td class="col-1 text-center">
								<form action="Edit" method="post">
									<input type="text" name="bookcode" value="${Book.getId()}"
										hidden> <input type="text" name="bookname"
										value="${Book.getName()}" hidden> <input type="text"
										name="author" value="${Book.getAuthor().getAuthorid()}" hidden>
									<input type="text" name="addedOn" value="${Book.getDate()}"
										hidden>
									<button type="submit" id="submit-btn"
										class=" col-5 p-2 mx-5 btn btn-primary ">Edit</button>
								</form>
								<form action="Delete" method="post">
									<input type="text" name="bookCode" value="${Book.getId()}"
										hidden>
									<button type="submit" id="submit-btn"
										class="col-5 p-2 mx-5 mt-2 btn btn-danger ">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>


				</tbody>
			</table>
</body>
<% session.removeAttribute("books"); %>
</html>