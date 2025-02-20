<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%
    String basePath = request.getContextPath(); 
%>



<c:choose>

	<c:when test="${empty patientObj and empty adminObj and empty docObj}">
		<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			<div class="container-fluid">
				<a class="navbar-brand" href="<%= basePath %>/index.jsp">Care
					Plus</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
	data-bs-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mr-4 pr-4 "
						style="font-size: 1.2rem;">
						<li class="nav-item active mr-4"><a class="nav-link active"
							aria-current="page" href="<%= basePath %>/index.jsp">Home</a></li>
						<li class="nav-item active mr-4"><a class="nav-link active"
							aria-current="page" href="<%= basePath %>/admin/adminSignin.jsp">Admin</a></li>
						<li class="nav-item active mr-4"><a class="nav-link active"
							aria-current="page"
							href="<%= basePath %>/doctor/doctorSignin.jsp">Doctor</a></li>
						<li class="nav-item active mr-4"><a class="nav-link active"
							aria-current="page"
							href="<%= basePath %>/patient/patientSignin.jsp">Patient</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>

	<c:when test="${not empty patientObj}">
		<!-- Links when a passenger is logged in -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			<div class="container-fluid">
				<a class="navbar-brand" href="<%= basePath %>/index.jsp">Care
					Plus</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
	data-bs-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mr-4 pr-4 "
						style="font-size: 1.2rem;">
						<li class="nav-item"><a class="nav-link active mr-4"
							href="<%= basePath %>/patient/patientHome.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link active mr-4"
							href="<%= basePath %>/patient/patientAppointmentHistory.jsp">Appointment</a>
						</li>
						<li class="nav-item dropdown" style="padding-right: 50px;"><a
							class="nav-link dropdown-toggle active" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Profile</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="<%= basePath %>/patient/patientProfile.jsp">Profile</a> <a
									class="dropdown-item" href="<%= basePath %>/patientLogout">Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
	<c:when test="${not empty adminObj}">
		<!-- Links when an admin is logged in -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			<div class="container-fluid">
				<a class="navbar-brand" href="<%= basePath %>/admin/adminHome.jsp">Dashboard</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
	data-bs-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mr-4 pr-4 "
						style="font-size: 1.2rem;">

						<li class="nav-item mr-4"><a class="nav-link active"
							href="<%= basePath %>/admin/adminManageSpecialist.jsp">Specialist</a>
						</li>
						<li class="nav-item mr-4"><a class="nav-link active"
							href="<%= basePath %>/admin/adminManageDoctor.jsp">Doctor</a></li>
						<li class="nav-item mr-4"><a class="nav-link active"
							href="<%= basePath %>/admin/adminManagePatient.jsp">Patient</a></li>
						<li class="nav-item mr-4"><a class="nav-link active"
							href="<%= basePath %>/admin/adminManageAppointment.jsp">Appointment</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Profile</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="<%= basePath %>/admin/adminProfile.jsp">Profile</a> <a
									class="dropdown-item" href="<%= basePath %>/adminLogout">Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>

	<c:when test="${not empty docObj}">
		<!-- Links when a Docter is logged in -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-success">
			<div class="container-fluid">
				<a class="navbar-brand" href="<%= basePath %>/index.jsp">Care
					Plus</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
	data-bs-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mr-4 pr-4 "
						style="font-size: 1.2rem;">
						<li class="nav-item"><a class="nav-link active mr-4"
							href="<%= basePath %>/doctor/doctorHome.jsp">Dashboard</a></li>
						<li class="nav-item"><a class="nav-link active mr-4"
							href="<%= basePath %>/doctor/doctorManageAppointment.jsp">Appointments</a>
						</li>
						<li class="nav-item dropdown" style="padding-right: 50px;"><a
							class="nav-link dropdown-toggle active" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Profile</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="<%= basePath %>/doctor/doctorProfile.jsp">Profile</a> <a
									class="dropdown-item" href="<%= basePath %>/doctorLogout">Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
</c:choose>
