package com.admin.servlet;

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

@WebServlet("/adminUpdatePatient")
public class AdminUpdatePatient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
            String fullName = req.getParameter("fullname");
            String address = req.getParameter("address");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");
            String email = req.getParameter("email");
            String phNo = req.getParameter("phNo");

            Patient p = new Patient(id, fullName, address, dob, gender, phNo, email, "");

            PatientDao dao = new PatientDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists.");
                resp.sendRedirect("admin/adminUpdatePatient.jsp?id=" + id);
            } else {
                if (dao.updatePatientProfile(p)) {
                    session.setAttribute("succMsgd", "patient updated successfully.");
                    resp.sendRedirect("admin/adminUpdatePatient.jsp?id=" +id);
                } else {
                    session.setAttribute("errorMsgd", "Patient update failed. Please try again.");
                    resp.sendRedirect("admin/adminUpdatePatient.jsp?id=" + id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("admin/adminUpdatePatient.jsp");
        }
	}
}
