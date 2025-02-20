package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;
import com.entity.Patient;

public class DoctorDao {
	private Connection conn;

    public DoctorDao(Connection conn) {
        this.conn = conn;
    }
    public List<Doctor> searchDoctor(String ch) {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {
			String sql = "select * from doctor where name like ? or specialist like ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setQualification(rs.getString(3));
				d.setSpecialist(rs.getString(4));
				d.setDob(rs.getString(5));
				d.setGender(rs.getString(6));
				d.setPhNo(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setPass(rs.getString(9));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
    public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {

			String sql = "select * from doctor order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setQualification(rs.getString(3));
				d.setSpecialist(rs.getString(4));
				d.setDob(rs.getString(5));
				d.setGender(rs.getString(6));
				d.setPhNo(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setPass(rs.getString(9));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
    public boolean addDoctor(Doctor d) {
        boolean f = false;
        try {
            String sql = "INSERT INTO doctor(name, qualification, specialist, dob, gender, phone_number, email, password) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getName());
            ps.setString(2, d.getQualification());
            ps.setString(3, d.getSpecialist());
            ps.setString(4, d.getDob());
            ps.setString(5, d.getGender());
            ps.setString(6, d.getPhNo());
            ps.setString(7, d.getEmail());
            ps.setString(8, d.getPass());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String sql = "delete from doctor where id=?";
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
    public Doctor getDoctorById(int id) {

		Doctor d = null;
		try {

			String sql = "select * from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setQualification(rs.getString(3));
				d.setSpecialist(rs.getString(4));
				d.setDob(rs.getString(5));
				d.setGender(rs.getString(6));
				d.setPhNo(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setPass(rs.getString(9));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
    public boolean emailExists(String email) {
        boolean exists = false;
        try {
            String sql = "SELECT * FROM doctor WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
    public boolean checkEmailExists(String email, int docId) {
	    String sql = "SELECT * FROM doctor WHERE email = ? AND id != ?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, email);
	        ps.setInt(2, docId);

	        try (ResultSet rs = ps.executeQuery()) {
	            return rs.next(); 
	        }
	    } catch (Exception e) {
	        System.err.println("Error checking email existence: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}


    
    public boolean updateDoctorProfile(Doctor d) {
        boolean f = false;
        try {
            String sql = "UPDATE doctor SET name=?, qualification=?, specialist=?, dob=?, gender=?, phone_number=?, email=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getName());
            ps.setString(2, d.getQualification());
            ps.setString(3, d.getSpecialist());
            ps.setString(4, d.getDob());
            ps.setString(5, d.getGender());
            ps.setString(6, d.getPhNo());
            ps.setString(7, d.getEmail());
            ps.setInt(8, d.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public Doctor login(String email, String password) {
    	Doctor d = null;
        try {
            String sql = "SELECT * FROM doctor WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setQualification(rs.getString("qualification"));
                d.setSpecialist(rs.getString("specialist"));
                d.setDob(rs.getString("dob"));
                d.setGender(rs.getString("gender"));
                d.setPhNo(rs.getString("phone_number"));
                d.setEmail(rs.getString("email"));
                d.setPass(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }
    public boolean checkOldPassword(int id, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from doctor where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
    public boolean changePassword(int id, String newPassword) {
		boolean f = false;

		try {
			String sql = "update doctor set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
    public int countDoctor() {
		int i = 0;
		try {
			String sql = "select * from doctor";
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
