<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("adminObj") == null) {
        response.sendRedirect("adminSignin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Doctor Profile</title>
    <%@include file="../component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@include file="../component/navbar.jsp"%>
    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center" style="font-size: 2rem;">Edit Doctor Details</p>

                        <c:if test="${not empty errorMsgd}">
                            <p class="fs-3 text-center text-danger">${errorMsgd}</p>
                            <c:remove var="errorMsgd" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsgd}">
                            <div class="fs-3 text-center text-success" role="alert">${succMsgd}</div>
                            <c:remove var="succMsgd" scope="session" />
                        </c:if>

                        <%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						Doctor d = dao2.getDoctorById(id);
						%>

                        <form action="../adminUpdateDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="<%=d.getName()%>">
                            </div>
                            
                            <div class="mb-3 row">
	                            <div class="col-6">
	                                <label class="form-label">Qualification</label>
	                                <input type="text" required name="qualification" class="form-control" value="<%=d.getQualification()%>">
	                            </div>
								
								<div class="col-6">
									<label class="form-label">Specialist</label> <select name="specialist"
										required class="form-control">
										<option><%=d.getSpecialist()%></option>
	
										<%
										SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
										List<Specialist> list = dao.getAllSpecialist();
										for (Specialist s : list) {
										%>
										<option><%=s.getName()%></option>
										<%
										}
										%>
	
	
									</select>
								</div>
							</div>
                            <div class="mb-3 row">
                                <div class="col-6">
                                    <label class="form-label">Date of Birth</label>
                                    <input id="dob" name="dob" type="date" class="form-control" value="<%=d.getDob()%>" required>
                                </div>
                                <div class="col-6">
                                    <label class="form-label">Gender</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="Male" <%= d.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                                        <option value="Female" <%= d.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" required name="email" class="form-control" value="<%=d.getEmail()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile Number</label>
                                <input type="text" required name="phNo" class="form-control" pattern="\d{10}" maxlength="10" title="Mobile number must be exactly 10 digits" value="<%=d.getPhNo()%>">
                            </div>

                            <input type="hidden" name="id" value="<%=d.getId()%>">
                            <button type="submit" class="btn bg-success text-white col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        const today = new Date();
        const todayString = today.getFullYear() + '-' + 
                            String(today.getMonth() + 1).padStart(2, '0') + '-' + 
                            String(today.getDate()).padStart(2, '0');
        const dobInput = document.getElementById('dob');
        dobInput.setAttribute('max', todayString);
       
    </script>
</body>
</html>
