package com.patient.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/patientCancelAppointment")
public class PatientCancelAppointment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteAppointment(id)) {
			session.setAttribute("succMsg", "Appoinment Sucessfully cancelled..");
			resp.sendRedirect("patient/patientAppointmentHistory.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("patient/patientAppointmentHistory.jsp");
		}
		

	}

}