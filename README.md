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
   git clone https://github.com/drsnpm/online-railway-reservation-system.git
   
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
3. **Profile Management** – Patients can view and update their personal details..
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
5. **Book Appointment with Doctor** – Schedule an appointment with an available doctor. Select date, time, and reason for the visit.
6. **Approve or Reject Appointments** – Doctors can approve or reject appointment requests.
7. **Logout Securely** – Option to log out securely to prevent unauthorized access.



## Features for Admin
1. **Admin Login** – Secure authentication for admin access.
2. **Manage Specialists** – Add or delete specialist categories (e.g., cardiology, dermatology, neurology).
3. **Manage Doctors** – Add, update, and delete doctor profiles.
4. **Manage Patients** – Add, update, and delete patient profiles..
5. **Manage Appointments** – View the pending, approve, or cancel patient appointments.
6. **Profile Management** – Admins can update their personal details.
7. **Change Password** –  Admins can change their password securely. Old password verification for security.
8. **Logout Securely** – Option to log out securely to prevent unauthorized access.



## Snapshots
### Home Page
![Image](https://github.com/user-attachments/assets/e2c7c3d7-2a38-4c30-aa24-eed40c5f9ef7)
### Patient Register page
![Image](https://github.com/user-attachments/assets/582e5db0-edf7-4939-b03e-c8f56884e59b)
### Patient Login page
![Image](https://github.com/user-attachments/assets/a3f4ea22-a1a6-4f0a-adeb-e95b69282fde)
### Patient Home page
![Image](https://github.com/user-attachments/assets/06e34ac7-2591-4832-ae25-df032464e67f)
### Patient Appointment page
![Image](https://github.com/user-attachments/assets/9b022ef9-0db1-4781-a148-97eef4cfdc9c)
### Patient Appointment History page
![Image](https://github.com/user-attachments/assets/191a898a-780a-4120-976c-aace82ad17d2)
### Patient Profile page
![Image](https://github.com/user-attachments/assets/53ad5fa0-0e72-4847-9f49-0796596d4d05)
### Patient profile Update page
![Image](https://github.com/user-attachments/assets/c86ff60c-9eb3-4ebf-98cf-0bfe02df0be3)
### Doctor Dashboard Page
![Image](https://github.com/user-attachments/assets/9ad80394-7cd0-43c6-a724-43950f91bf26)
### Doctor View Patient Appointments Page
![Image](https://github.com/user-attachments/assets/7606fdb6-47e9-4345-9b51-204039e7aaa7)
### Doctor View Patient Details Page
![Image](https://github.com/user-attachments/assets/4adecc31-1354-4d99-9686-c83fe0f6a5e6)

### Admin Dashboard Page
![Image](https://github.com/user-attachments/assets/3870495d-316b-47d4-8408-6d6329affa2e)
### Admin Manage Specialist Page
![Image](https://github.com/user-attachments/assets/482cf0bd-6611-45ee-b0dc-fa23aad84c0b)
### Admin Add Specialist Page
![Image](https://github.com/user-attachments/assets/7323d57a-f412-4e35-aed0-9847efcad134)
### Admin Manage Doctor Page
![Image](https://github.com/user-attachments/assets/acb32610-82d0-49fc-863a-f79e1d421173)
### Admin Add Doctor Page
![Image](https://github.com/user-attachments/assets/19096851-2a0e-4ddb-b9ae-d43b8f6d7072)
### Admin Manage Patient Page
![Image](https://github.com/user-attachments/assets/a7e3a059-5e6a-4364-8f9a-6a44b09ee427)
### Admin Add Patient Page
![Image](https://github.com/user-attachments/assets/596c15e2-88fc-4066-ba04-8abac3c303b4)
### Admin Profile Page
![Image](https://github.com/user-attachments/assets/53f519af-bb97-473f-ab26-baaa4e4cf8c1)
