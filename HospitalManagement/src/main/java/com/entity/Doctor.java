package com.entity;

public class Doctor {
	private int id;
	private String name;
	private String qualification;
	private String specialist;
	private String dob;
	private String gender;
	private String phNo;
	private String email;
	private String pass;
	
	public Doctor() {
		super();
	}
	
	public Doctor(String name, String qualification, String specialist, String dob, String gender,
			String phNo, String email, String pass) {
		super();
		this.name = name;
		this.qualification = qualification;
		this.specialist = specialist;
		this.dob = dob;
		this.gender = gender;
		this.phNo = phNo;
		this.email = email;
		this.pass = pass;
	}
	public Doctor(int id, String name, String qualification, String specialist, String dob, String gender,
			String phNo, String email, String pass) {
		super();
		this.id = id;
		this.name = name;
		this.qualification = qualification;
		this.specialist = specialist;
		this.dob = dob;
		this.gender = gender;
		this.phNo = phNo;
		this.email = email;
		this.pass = pass;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialist() {
		return specialist;
	}
	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhNo() {
		return phNo;
	}
	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
