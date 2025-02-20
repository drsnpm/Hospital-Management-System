package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.PatientDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorChangePassword")
public class DoctorChangePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");

		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.checkOldPassword(id, oldPassword)) {
			
			if (oldPassword.equals(newPassword)) {
                session.setAttribute("errorMsg", "The new password must differ from the old one!");
                resp.sendRedirect("doctor/doctorChangePassword.jsp");
                return;
            }

			if (dao.changePassword(id, newPassword)) {
				session.setAttribute("succMsg", "Password Change Sucessfully");
				resp.sendRedirect("doctor/doctorChangePassword.jsp");

			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("doctor/doctorChangePassword.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			resp.sendRedirect("doctor/doctorChangePassword.jsp");
		}

	}
}