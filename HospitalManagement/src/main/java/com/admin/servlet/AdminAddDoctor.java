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

@WebServlet("/adminAddDoctor")
public class AdminAddDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String fullName = req.getParameter("fullName");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");
            String phNo = req.getParameter("phNo");
            String email = req.getParameter("email");
            String password = req.getParameter("pass");
            
            Doctor d = new Doctor(fullName, qualification, specialist, dob, gender, phNo, email, password);

            DoctorDao dao = new DoctorDao(DBConnect.getConn());

            HttpSession session = req.getSession();
            

            if (dao.emailExists(email)) {
                session.setAttribute("errorMsg", "Email already exists!");
                resp.sendRedirect("admin/adminAddDoctor.jsp");
            } else {
            	boolean f = dao.addDoctor(d);
                if (f) {
                    session.setAttribute("sucMsg", "Doctor added successfully!");
                    resp.sendRedirect("admin/adminAddDoctor.jsp");
                } else {
                    session.setAttribute("errorMsg", "Failed to add doctor!");
                    resp.sendRedirect("admin/adminAddDoctor.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
