package com.entity;

public class Appointment {
	private int id;
	private int patient_id;
	private String patient_name;
	private String patient_address;
	private String patient_gender;
	private String patient_dob;
	private String appoint_date_time;
	private String patient_email;
	private String patient_phno;
	private String patient_diseases;
	private int doc_id;
	private String confirmation;
	
	public Appointment() {
		super();
	}
	public Appointment(int id, int patient_id, String patient_name, String patient_address, String patient_gender,
			String patient_dob, String appoint_date_time, String patient_email, String patient_phno,
			String patient_diseases, int doc_id, String confirmation) {
		super();
		this.id = id;
		this.patient_id = patient_id;
		this.patient_name = patient_name;
		this.patient_address = patient_address;
		this.patient_gender = patient_gender;
		this.patient_dob = patient_dob;
		this.appoint_date_time = appoint_date_time;
		this.patient_email = patient_email;
		this.patient_phno = patient_phno;
		this.patient_diseases = patient_diseases;
		this.doc_id = doc_id;
		this.confirmation = confirmation;
	}
	
	public Appointment(int patient_id, String patient_name, String patient_address, String patient_gender,
			String patient_dob, String appoint_date_time, String patient_email, String patient_phno,
			String patient_diseases, int doc_id, String confirmation) {
		super();
		this.patient_id = patient_id;
		this.patient_name = patient_name;
		this.patient_address = patient_address;
		this.patient_gender = patient_gender;
		this.patient_dob = patient_dob;
		this.appoint_date_time = appoint_date_time;
		this.patient_email = patient_email;
		this.patient_phno = patient_phno;
		this.patient_diseases = patient_diseases;
		this.doc_id = doc_id;
		this.confirmation = confirmation;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	public String getPatient_name() {
		return patient_name;
	}
	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}
	public String getPatient_address() {
		return patient_address;
	}
	public void setPatient_address(String patient_address) {
		this.patient_address = patient_address;
	}
	public String getPatient_gender() {
		return patient_gender;
	}
	public void setPatient_gender(String patient_gender) {
		this.patient_gender = patient_gender;
	}
	public String getPatient_dob() {
		return patient_dob;
	}
	public void setPatient_dob(String patient_dob) {
		this.patient_dob = patient_dob;
	}
	public String getAppoint_date_time() {
		return appoint_date_time;
	}
	public void setAppoint_date_time(String appoint_date_time) {
		this.appoint_date_time = appoint_date_time;
	}
	public String getPatient_email() {
		return patient_email;
	}
	public void setPatient_email(String patient_email) {
		this.patient_email = patient_email;
	}
	public String getPatient_phno() {
		return patient_phno;
	}
	public void setPatient_phno(String patient_phno) {
		this.patient_phno = patient_phno;
	}
	public String getPatient_diseases() {
		return patient_diseases;
	}
	public void setPatient_diseases(String patient_diseases) {
		this.patient_diseases = patient_diseases;
	}
	public int getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}
	public String getConfirmation() {
		return confirmation;
	}
	public void setConfirmation(String confirmation) {
		this.confirmation = confirmation;
	}
	
}
