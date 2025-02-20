package com.admin.servlet;

import java.io.IOException;

import com.dao.PatientDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletePatient")
public class AdminDeletePatient extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		PatientDao dao = new PatientDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deletePatient(id)) {
			session.setAttribute("succMsg", "Patient Delete Sucessfully..");
			resp.sendRedirect("admin/adminManagePatient.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/adminManagePatient.jsp");
		}
		

	}

}