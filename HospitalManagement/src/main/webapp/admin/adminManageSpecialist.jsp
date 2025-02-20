<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminObj") == null) {
	    response.sendRedirect("adminSignin.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3 mx-auto">
		<h3 class="text-center">Manage Specialist</h3>
    	<button type="submit" class="btn btn-success float-right" data-toggle="modal" data-target="#exampleModal">Add Specialist</button>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Specialist Name</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									if (list.isEmpty()) {
								%>
				<tr>
					<td colspan="8" class="text-center text-danger">No Specialist
						found</td>
				</tr>
				<%
										} else {
											for (Specialist s : list) {
								%>
				<tr>
					<td><%=s.getName()%></td>
					<td>
						<form action="../adminDeleteSpecialist" method="post"
							style="display: inline;">
							<input type="hidden" name="id" value="<%= s.getId() %>">
							<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Specialist?');">Delete</button>
						</form>
					</td>
				</tr>
				<%
								}
										}
								%>
			</tbody>
		</table>

	</div>


	<!-- Modal -->
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../adminAddSpecialist" method="post">

						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control" required>
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-success">Add
								Specialist</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>