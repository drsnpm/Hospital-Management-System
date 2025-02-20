package com.patient.servlet;

import java.io.IOException;

import com.dao.PatientDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/patientChangePassword")
public class PatientChangePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int pid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");

		PatientDao dao = new PatientDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.checkOldPassword(pid, oldPassword)) {
			
			if (oldPassword.equals(newPassword)) {
                session.setAttribute("errorMsg", "The new password must differ from the old one!");
                resp.sendRedirect("patient/patientChangePassword.jsp");
                return;
            }

			if (dao.changePassword(pid, newPassword)) {
				session.setAttribute("succMsg", "Password Change Sucessfully");
				resp.sendRedirect("patient/patientChangePassword.jsp");

			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("passenger/change_password.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			resp.sendRedirect("patient/patientChangePassword.jsp");
		}

	}
}