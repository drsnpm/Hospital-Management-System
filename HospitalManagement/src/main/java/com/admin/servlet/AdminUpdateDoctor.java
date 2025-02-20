package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminUpdateDoctor")
public class AdminUpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String fullName = req.getParameter("fullname");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String dob = req.getParameter("dob");
			String gender = req.getParameter("gender");
			String phone_number = req.getParameter("phNo");
			String email = req.getParameter("email");


			Doctor d = new Doctor(id, fullName, qualification, specialist, dob, gender, phone_number, email, "");
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.updateDoctorProfile(d)) {
				session.setAttribute("succMsgd", "Doctor updated successfully.");
				resp.sendRedirect("admin/adminUpdateDoctor.jsp?id=" + id);
			} else {
				session.setAttribute("errorMsgd", "Doctor update failed. Please try again.");
				resp.sendRedirect("admin/adminUpdateDoctor.jsp?id=" + id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

