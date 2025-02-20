package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.PatientDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorProfileUpdate")
public class DoctorProfileUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String fullName = req.getParameter("fullname");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");
            String email = req.getParameter("email");
            String phNo = req.getParameter("phNo");

            Doctor p = new Doctor(id, fullName, qualification, specialist, dob, gender, phNo, email, "");

            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists.");
                resp.sendRedirect("doctor/doctorUpdateProfile.jsp");
            } else {
                if (dao.updateDoctorProfile(p)) {
                    Doctor updatedDocter = dao.getDoctorById(id);
                    session.setAttribute("succMsgd", "Profile updated successfully.");
                    session.setAttribute("docObj", updatedDocter);
                    resp.sendRedirect("doctor/doctorProfile.jsp");
                } else {
                    session.setAttribute("errorMsgd", "Profile update failed. Please try again.");
                    resp.sendRedirect("doctor/doctorUpdateProfile.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("patient/patientUpdateProfile.jsp");
        }
    }
}
