package com.doctor.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorLogout")
public class DocterLogout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		session.removeAttribute("docObj");
		session.setAttribute("succMsg", "Doctor Logout Sucessfully");
		resp.sendRedirect("doctor/doctorSignin.jsp");

	}

}