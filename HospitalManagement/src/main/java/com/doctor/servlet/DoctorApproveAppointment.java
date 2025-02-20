package com.doctor.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorApproveAppointment")
public class DoctorApproveAppointment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comm = req.getParameter("comm");

			AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

			HttpSession session = req.getSession();

			if (dao.doctorApprove(id, did, comm)) {
				if(comm.equals("Pending")) {
					session.setAttribute("succMsg", "Appointment status changed to pending.");
					resp.sendRedirect("doctor/doctorManageAppointment.jsp");
				}else if(comm.equals("Canceled")) {
					session.setAttribute("succMsg", "Appointment canceled successfully");
					resp.sendRedirect("doctor/doctorManageAppointment.jsp");
				}else if(comm.equals("Confirmed")) {
					session.setAttribute("succMsg", "Appointment approved successfully");
					resp.sendRedirect("doctor/doctorManageAppointment.jsp");
				}
			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("doctor/doctorManageAppointment.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}