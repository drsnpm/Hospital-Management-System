package com.patient.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/patientAppointment")
public class PatientAppointment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int patientId = Integer.parseInt(req.getParameter("patientid"));
		String fullname = req.getParameter("name");
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		String dob = req.getParameter("dob"); 
		String appoint_date = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phNo");
		String diseases = req.getParameter("diseases");
		int doctor_id = Integer.parseInt(req.getParameter("doctId"));
		

		Appointment ap = new Appointment(patientId, fullname, address, gender, dob, appoint_date, email, phno, diseases, doctor_id, "Pending");

		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment Sucessfully");
			resp.sendRedirect("patient/patientAppointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("patient/patientAppointment.jsp");
		}

	}

}