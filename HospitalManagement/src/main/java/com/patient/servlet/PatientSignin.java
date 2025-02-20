package com.patient.servlet;

import java.io.IOException;
import com.dao.PatientDao;
import com.db.DBConnect;
import com.entity.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/patientLogin")
public class PatientSignin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		PatientDao dao = new PatientDao(DBConnect.getConn());
		Patient pass = dao.login(email, password);

		if (pass != null) {
			session.setAttribute("patientObj", pass);
			resp.sendRedirect("patient/patientHome.jsp"); 
		} else {
			session.setAttribute("errorMsg", "Invalid email & password");
			resp.sendRedirect("patient/patientSignin.jsp");
		}
	}
}
