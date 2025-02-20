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

@WebServlet("/patientUpdateProfile")
public class PatientProfileUpdate extends HttpServlet {

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
                resp.sendRedirect("passenger/passUpdateProfile.jsp");
            } else {
                if (dao.updatePatientProfile(p)) {
                    Patient updatedPatient = dao.getPatientById(id);
                    session.setAttribute("succMsgd", "Profile updated successfully.");
                    session.setAttribute("patientObj", updatedPatient);
                    resp.sendRedirect("patient/patientProfile.jsp");
                } else {
                    session.setAttribute("errorMsgd", "Profile update failed. Please try again.");
                    resp.sendRedirect("patient/patientUpdateProfile.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("patient/patientUpdateProfile.jsp");
        }
    }
}
