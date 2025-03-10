# Hospital Management System

## Overview
This module allows patients to register, log in, manage their profiles, search for doctors, book appointments, and cancel appointments. Additionally, doctors can manage appointments and update their profiles. Admins have full control over managing specialists, doctors, patients, and appointments in the Hospital Management System (HMS).

## Tools Used
- Eclipse IDE
- MySQL Workbench
- Java
- JDBC
- Servlet
- Bootstrap

## Tech Stack
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Java (Servlets), JDBC
- **Database**: MySQL
- **Server**: Apache Tomcat

## Installation

### Prerequisites
Make sure you have the following software installed:
- [Java JDK](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [Apache Tomcat](https://tomcat.apache.org/)
- [MySQL](https://www.mysql.com/)
- [JDBC Driver for MySQL](https://dev.mysql.com/downloads/connector/j/)
- [Eclipse IDE](https://www.eclipse.org/downloads/) or any IDE supporting Java Servlets

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/drsnpm/hospital-management-system.git
   
2. Configure the database in `DBConnect.java` and update `web.xml`.
3. Compile and run the server using Apache Tomcat:
   ```bash
   javac -cp .;path-to-mysql-connector.jar *.java
   ```
4. Deploy the WAR file in Tomcat's `webapps` directory.
5. Start the Tomcat server and access the application at:
   ```
   http://localhost:8080/hms
   ```
6. Open the application in your browser and start using the patient, doctor, and admin modules!


## Features for Patient
1. **Patient Registration** – New patients can register by their credential. Email verification for security.
2. **Patient Login & Authentication** – Secure login system using username & password.
3. **Profile Management** – Patients can view and update their personal details.
4. **Change Password** – Change password securely. Old password verification for security.
5. **Search Available Doctors** – Search for doctors by specialization, availability, or name.
6. **Book Appointment with Doctor** – Schedule an appointment with an available doctor. Select date, time, and reason for the visit.
7. **View Appointment Details** – View doctor’s details, appointment date, time, and status.
8. **Cancel Appointment** – Patients can cancel appointments before a set deadline.
9. **Logout Securely** – Option to log out securely to prevent unauthorized access.

## Features for Doctor
1. **Doctor Login & Authentication** – Secure login system using username & password.
2. **Profile Management** – Doctor can view and update their personal details..
3. **Change Password** – Change password securely. Old password verification for security.
4. **View Appointments** – Doctors can see pending, approved, and canceled appointments from patients.
5. **Approve or Reject Appointments** – Doctors can approve or reject appointment requests.
6. **Logout Securely** – Option to log out securely to prevent unauthorized access.


## Features for Admin
1. **Admin Login** – Secure authentication for admin access.
2. **Manage Specialists** – Add or delete specialist categories (e.g., cardiology, dermatology, neurology).
3. **Manage Doctors** – Add, update, and delete doctor profiles.
4. **Manage Patients** – Add, update, and delete patient profiles..
5. **Manage Appointments** – View the pending, approve, or delete patient appointments.
6. **Profile Management** – Admins can update their personal details.
7. **Change Password** –  Admins can change their password securely. Old password verification for security.
8. **Logout Securely** – Option to log out securely to prevent unauthorized access.



## Snapshots
### Home Page
![Image](https://github.com/user-attachments/assets/040d015d-7eb0-4aef-8d14-5588ae0c51eb)
### Patient Register page
![Image](https://github.com/user-attachments/assets/9f46b4fc-1092-4f98-9a8e-550b18ed1abc)
### Patient Login page
![Image](https://github.com/user-attachments/assets/4e905ce8-5df3-4ec9-a229-18790bc955c2)
### Patient Home page
![Image](https://github.com/user-attachments/assets/63e04fa0-bb26-4229-adb6-8e6e1d7c21d6)
### Patient Appointment page
![Image](https://github.com/user-attachments/assets/ef7a4fc2-bfce-4db7-ac8f-09e3fce0ebf3)
### Patient Appointment History page
![Image](https://github.com/user-attachments/assets/f96a26d4-754c-4e50-842e-07aa6ab7f446)
### Patient Profile page
![Image](https://github.com/user-attachments/assets/a9faf7a2-8cc6-4dc6-8fa8-031be61cba43)
### Patient profile Update page
![Image](https://github.com/user-attachments/assets/d6cafa7d-fd87-4871-a1d2-fdb9e821301c)


### Doctor Dashboard Page
![Image](https://github.com/user-attachments/assets/eb161829-7d6f-4f96-980e-65f298174801)
### Doctor View Patient Appointments Page
![Image](https://github.com/user-attachments/assets/d862111f-933c-40b4-a4df-79dfd810017c)
### Doctor View Patient Details Page
![Image](https://github.com/user-attachments/assets/8528ba9b-f436-4f62-97bc-02e9044b5b61)


### Admin Dashboard Page
![Image](https://github.com/user-attachments/assets/dbcf48c0-5ae6-41a9-884a-a71ae0e874a9)
### Admin Manage Specialist Page
![Image](https://github.com/user-attachments/assets/98c96ce9-61ad-4673-95b1-a2ec95f7d47d)
### Admin Add Specialist Page
![Image](https://github.com/user-attachments/assets/733be067-d7f9-47c0-b1bb-8d236d536e36)
### Admin Manage Doctor Page
![Image](https://github.com/user-attachments/assets/4372ab39-98ef-4510-a778-057868decfc4)
### Admin Add Doctor Page
![Image](https://github.com/user-attachments/assets/e98fd5ad-4311-43b8-be7b-c8f4e0c428ca)
### Admin Manage Patient Page
![Image](https://github.com/user-attachments/assets/dd25e8a2-1b02-4e1e-a17e-b49d3fe91bb7)
### Admin Add Patient Page
![Image](https://github.com/user-attachments/assets/a305ee18-de6a-4463-ad2a-c98571e16904)
### Admin manage Appointments
![Image](https://github.com/user-attachments/assets/bc1217e5-bf03-48d9-9bba-ae4f05948599)
### Admin Profile Page
![Image](https://github.com/user-attachments/assets/1376da14-b883-4d48-9002-e405e2a5a752)


















