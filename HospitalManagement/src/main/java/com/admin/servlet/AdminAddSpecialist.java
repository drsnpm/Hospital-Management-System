package com.admin.servlet;

import java.io.IOException;

import com.dao.PatientDao;
import com.dao.SpecialistDao;
import com.db.DBConnect;
import com.entity.Patient;
import com.entity.Specialist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminAddSpecialist")
public class AdminAddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String specName = req.getParameter("specName");
			
			Specialist s = new Specialist(specName);
	
			SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
	
			HttpSession session = req.getSession();
	
			boolean f = dao.addSpecialist(s);
	
			if (f) {
				session.setAttribute("succMsg", "Specialist Added successfully");
				resp.sendRedirect("admin/adminManageSpecialist.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("admin/adminManageSpecialist.jsp");
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}

}

}