package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Patient;


public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment ap) {
		boolean f = false;

		try {

			String sql = "insert into appointment(patient_id, patient_name, patient_address, patient_gender, patient_dob, patient_email, patient_phno, patient_diseases, appoint_date_time, doc_id, confirmation) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getPatient_id());
			ps.setString(2, ap.getPatient_name());
			ps.setString(3, ap.getPatient_address());
			ps.setString(4, ap.getPatient_gender());
			ps.setString(5, ap.getPatient_dob());
			ps.setString(6, ap.getPatient_email());
			ps.setString(7, ap.getPatient_phno());
			ps.setString(8, ap.getPatient_diseases());
			ps.setString(9, ap.getAppoint_date_time());
			ps.setInt(10, ap.getDoc_id());
			ps.setString(11, ap.getConfirmation());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public boolean deleteAppointment(int id) {
		boolean f = false;
		try {
			String sql = "delete from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	 public List<Appointment> getAllAppointment() {
			List<Appointment> list = new ArrayList<Appointment>();
			Appointment ap = null;
			try {

				String sql = "select * from appointment order by appoint_date_time asc";
				PreparedStatement ps = conn.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ap = new Appointment();
					ap.setId(rs.getInt(1));
					ap.setPatient_id(rs.getInt(2));
					ap.setPatient_name(rs.getString(3));
					ap.setPatient_address(rs.getString(4));
					ap.setPatient_gender(rs.getString(5));
					ap.setPatient_dob(rs.getString(6));
					ap.setPatient_email(rs.getString(7));
					ap.setPatient_phno(rs.getString(8));
					ap.setPatient_diseases(rs.getString(9));
					ap.setAppoint_date_time(rs.getString(10));
					ap.setDoc_id(rs.getInt(11));
					ap.setConfirmation(rs.getString(12));
					list.add(ap);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 public List<Appointment> getAllApprovedAppointment() {
			List<Appointment> list = new ArrayList<Appointment>();
			Appointment ap = null;
			try {

				String sql = "select * from appointment where confirmation='Confirmed' order by appoint_date_time asc";
				PreparedStatement ps = conn.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ap = new Appointment();
					ap.setId(rs.getInt(1));
					ap.setPatient_id(rs.getInt(2));
					ap.setPatient_name(rs.getString(3));
					ap.setPatient_address(rs.getString(4));
					ap.setPatient_gender(rs.getString(5));
					ap.setPatient_dob(rs.getString(6));
					ap.setPatient_email(rs.getString(7));
					ap.setPatient_phno(rs.getString(8));
					ap.setPatient_diseases(rs.getString(9));
					ap.setAppoint_date_time(rs.getString(10));
					ap.setDoc_id(rs.getInt(11));
					ap.setConfirmation(rs.getString(12));
					list.add(ap);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 public List<Appointment> getAlPendingAppointment() {
			List<Appointment> list = new ArrayList<Appointment>();
			Appointment ap = null;
			try {

				String sql = "select * from appointment where confirmation='Pending' order by appoint_date_time asc";
				PreparedStatement ps = conn.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ap = new Appointment();
					ap.setId(rs.getInt(1));
					ap.setPatient_id(rs.getInt(2));
					ap.setPatient_name(rs.getString(3));
					ap.setPatient_address(rs.getString(4));
					ap.setPatient_gender(rs.getString(5));
					ap.setPatient_dob(rs.getString(6));
					ap.setPatient_email(rs.getString(7));
					ap.setPatient_phno(rs.getString(8));
					ap.setPatient_diseases(rs.getString(9));
					ap.setAppoint_date_time(rs.getString(10));
					ap.setDoc_id(rs.getInt(11));
					ap.setConfirmation(rs.getString(12));
					list.add(ap);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 public List<Appointment> getAlCancelledAppointment() {
			List<Appointment> list = new ArrayList<Appointment>();
			Appointment ap = null;
			try {

				String sql = "select * from appointment where confirmation='Canceled' order by appoint_date_time asc";
				PreparedStatement ps = conn.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ap = new Appointment();
					ap.setId(rs.getInt(1));
					ap.setPatient_id(rs.getInt(2));
					ap.setPatient_name(rs.getString(3));
					ap.setPatient_address(rs.getString(4));
					ap.setPatient_gender(rs.getString(5));
					ap.setPatient_dob(rs.getString(6));
					ap.setPatient_email(rs.getString(7));
					ap.setPatient_phno(rs.getString(8));
					ap.setPatient_diseases(rs.getString(9));
					ap.setAppoint_date_time(rs.getString(10));
					ap.setDoc_id(rs.getInt(11));
					ap.setConfirmation(rs.getString(12));
					list.add(ap);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	 
	public List<Appointment> getAllAppointmentByLoginPatient(int patientId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment where patient_id=? ORDER BY appoint_date_time asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, patientId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setPatient_id(rs.getInt(2));
				ap.setPatient_name(rs.getString(3));
				ap.setPatient_address(rs.getString(4));
				ap.setPatient_gender(rs.getString(5));
				ap.setPatient_dob(rs.getString(6));
				ap.setPatient_email(rs.getString(7));
				ap.setPatient_phno(rs.getString(8));
				ap.setPatient_diseases(rs.getString(9));
				ap.setAppoint_date_time(rs.getString(10));
				ap.setDoc_id(rs.getInt(11));
				ap.setConfirmation(rs.getString(12));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment where doc_id=? ORDER BY appoint_date_time ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setPatient_id(rs.getInt(2));
				ap.setPatient_name(rs.getString(3));
				ap.setPatient_address(rs.getString(4));
				ap.setPatient_gender(rs.getString(5));
				ap.setPatient_dob(rs.getString(6));
				ap.setPatient_email(rs.getString(7));
				ap.setPatient_phno(rs.getString(8));
				ap.setPatient_diseases(rs.getString(9));
				ap.setAppoint_date_time(rs.getString(10));
				ap.setDoc_id(rs.getInt(11));
				ap.setConfirmation(rs.getString(12));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public Appointment getAppointmentById(int id) {

		Appointment ap = null;

		try {

			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setPatient_id(rs.getInt(2));
				ap.setPatient_name(rs.getString(3));
				ap.setPatient_address(rs.getString(4));
				ap.setPatient_gender(rs.getString(5));
				ap.setPatient_dob(rs.getString(6));
				ap.setPatient_email(rs.getString(7));
				ap.setPatient_phno(rs.getString(8));
				ap.setPatient_diseases(rs.getString(9));
				ap.setAppoint_date_time(rs.getString(10));
				ap.setDoc_id(rs.getInt(11));
				ap.setConfirmation(rs.getString(12));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}
	
	public boolean doctorApprove(int id, int doctId, String comm) {
		boolean f = false;
		try {
			String sql = "update appointment set confirmation=? where id=? and doc_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public int countAppointmentByDocotrId(int did) {
		int i = 0;
		try {
			String sql = "select * from appointment where doc_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countApprovedAppointmentByDocotrId(int did) {
		int i = 0;
		try {
			String sql = "select * from appointment where doc_id=? and confirmation = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ps.setString(2, "Confirmed");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countPendingAppointmentByDocotrId(int did) {
		int i = 0;
		try {
			String sql = "select * from appointment where doc_id=? and confirmation = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ps.setString(2, "Pending");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countPCanceledAppointmentByDocotrId(int did) {
		int i = 0;
		try {
			String sql = "select * from appointment where doc_id=? and confirmation = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ps.setString(2, "Canceled");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countTotalAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countTotalPendingAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment where confirmation='Pending'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countTotalCanceledAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment where confirmation='Canceled'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countTotalApprovedAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment where confirmation='Confirmed'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

}