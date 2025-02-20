package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Patient;
import com.entity.Specialist;

public class SpecialistDao {

	private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addSpecialist(Specialist s) {
        boolean f = false;
        try {
            String sql = "INSERT INTO specialist(name) VALUES(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getName());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

	public List<Specialist> getAllSpecialist() {
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;

		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setName(rs.getString(2));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public boolean deleteSpecialistById(int id) {
	    String sql = "DELETE FROM specialist WHERE id = ?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, id);
	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected == 1;
	    } catch (SQLException e) {
	        System.err.println("Error deleting specialist: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}
	public Specialist getSpecialistById(int id) {
	    Specialist s = null;
	    try {
	        String sql = "SELECT * FROM specialist WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            s = new Specialist(rs.getInt("id"), rs.getString("name"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return s;
	}
	public int countSpecialist() {
		int i = 0;
		try {
			String sql = "select * from specialist";
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