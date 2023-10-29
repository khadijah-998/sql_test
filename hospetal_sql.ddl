CREATE TABLE Pationt (
    pationt_id          INT         NOT NULL,
    first_name          VARCHAR     NOT NULL,
    last_name           VARCHAR     NOT NULL,
    nationality         VARCHAR     NOT NULL,
    gender              VARCHAR     NOT NULL,
    pationt_address     VARCHAR     NOT NULL,
    dob                 date        NOT NULL,
    phone               INT         NOT NULL,
    email               VARCHAR     NOT NULL,
    PRIMARY KEY (pationt_id)
);


CREATE TABLE Doctor (
    doctor_id       INT         NOT NULL,
    personal_id     INT         NOT NULL,
    first_name      VARCHAR     NOT NULL,
    last_name       VARCHAR     NOT NULL,
    specalist       VARCHAR     NOT NULL,
    PRIMARY KEY (doctor_id)
);


CREATE TABLE Appointment (
    appointment_id       INT      NOT NULL,
    appointment_number   VARCHAR  NOT NULL,
    appointment_type     VARCHAR  NOT NULL,
    appointment_created  date     NOT NULL,
    appointment_date     date     NOT NULL,
    appointment_time     Time     NOT NULL,
    doctor_id            INT      NOT NULL,
    appointment_desc     VARCHAR  NOT NULL,
    employee_id          INT      NOT NULL,
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);


CREATE TABLE Room(
    room_no     INT         NOT NULL,
    room_type   VARCHAR     NOT NULL,
    status      VARCHAR     NOT NULL,
    PRIMARY KEY (room_no)
);


CREATE TABLE Hospital (
    hospital_id     INT         NOT NULL,
    hospital_name   VARCHAR     NOT NULL,
    hospital_type   VARCHAR     NOT NULL,
    area            VARCHAR     NOT NULL,          
    road            VARCHAR     NOT NULL,
    building        VARCHAR     NOT NULL,
    country         VARCHAR     NOT NULL,
    PRIMARY KEY (hospital_id)
);

CREATE TABLE  Hospital_Contact(
    hospital_id     INT         NOT NULL,
    phone           INT         NOT NULL,
    email           VARCHAR     NOT NULL,
    PRIMARY KEY (hospital_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);


CREATE TABLE Medicine(
    medicine_id             INT         NOT NULL,
    medicine_name           VARCHAR     NOT NULL,
    medicine_type           VARCHAR     NOT NULL,
    medicine_cost           VARCHAR     NOT NULL,
    medicine_description    VARCHAR     NOT NULL,
    PRIMARY KEY(medicine_id)
);


CREATE TABLE Supplier(
    supplier_id         INT         NOT NULL,
    supplier_company    VARCHAR     NOT NULL,
    phone               INT         NOT NULL,
    email               VARCHAR     NOT NULL,
    supplier_address    VARCHAR     NOT NULL,
    PRIMARY KEY(supplier_id)
);


CREATE TABLE Medicine_Report(
    medicine_id       INT         NOT NULL,
    company           VARCHAR     NOT NULL,
    quantity          INT         NOT NULL,
    production_date   date        NOT NULL,
    expier_date       date        NOT NULL,
    country           VARCHAR     NOT NULL,
    supplier_id       INT         NOT NULL,
    PRIMARY KEY(medicine_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);


CREATE TABLE Lab (
    employee_id     INT         NOT NULL,
    lab_no          VARCHAR     NOT NULL,
    pationt_id      INT         NOT NULL,
    test_code       VARCHAR     NOT NULL,
    test_type       VARCHAR     NOT NULL,
    weidth          INT         NOT NULL,
    height          INT         NOT NULL,
    blod_pressure   INT         NOT NULL,
    temperature     INT         NOT NULL,
    date            date        NOT NULL,
    category        VARCHAR     NOT NULL,
    pationt_type    VARCHAR     NOT NULL,
    test_result     VARCHAR     NOT NULL,
    PRIMARY KEY (pationt_id,test_code),
    FOREIGN KEY (pationt_id) REFERENCES Pationt(pationt_id)
);


CREATE TABLE Test_price(
    test_code       VARCHAR     NOT NULL,
    test_price      INT         NOT NULL,
    PRIMARY KEY(test_code),
    FOREIGN KEY (test_code) REFERENCES Lab(test_code)
);


CREATE TABLE Pationt_Report(
    pationt_id      INT         NOT NULL,
    report_id       INT         NOT NULL,
    diagnose        VARCHAR     NOT NULL,
    reference       VARCHAR     NOT NULL,
    medicine_id     INT         NOT NULL,
    medicine_name   VARCHAR     NOT NULL,
    doctor_id       INT         NOT NULL,
    PRIMARY KEY(report_id),
    FOREIGN KEY (pationt_id) REFERENCES Pationt(pationt_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id),
    FOREIGN KEY (medicine_name) REFERENCES Medicine(medicine_name),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);


CREATE TABLE Prescribed_Med(
    report_id       INT         NOT NULL,
    medicine_id     INT         NOT NULL,
    PRIMARY KEY(report_id,medicine_id),
    FOREIGN KEY (report_id) REFERENCES Pationt_Report(report_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);


CREATE TABLE Insurance (
    pationt_id      INT         NOT NULL,
    policy_no       VARCHAR     NOT NULL,
    insurance_code  VARCHAR     NOT NULL,
    publish_date    date        NOT NULL,
    expier_date     date        NOT NULL,
    maternity       VARCHAR     NOT NULL,
    dental          VARCHAR     NOT NULL,
    optecal         VARCHAR     NOT NULL,
    chronic_pac     VARCHAR     NOT NULL, 
    PRIMARY KEY(insurance_code,pationt_id),
    FOREIGN KEY (pationt_id) REFERENCES Pationt(pationt_id)

);


CREATE TABLE Insurance_Cover(
    insurance_code      VARCHAR     NOT NULL,
    insurance_company   VARCHAR     NOT NULL,
    insurance_plan      VARCHAR     NOT NULL,
    entry_fees          INT         NOT NULL,
    co_pay              INT         NOT NULL,
    co_insurance        VARCHAR     NOT NULL,
    med_coverage        VARCHAR     NOT NULL,
    FOREIGN KEY (insurance_code) REFERENCES Insurance(insurance_code)
 
);


CREATE TABLE Bill(
    bill_no             INT         NOT NULL,
    pationt_id          INT         NOT NULL,
    pationt_type
    doctor_charge       INT         NOT NULL,
    medicine_charge     INT         NOT NULL,
    room_charge         INT         NOT NULL,
    operation_charge    INT         NOT NULL,
    no_of_days          INT         NOT NULL,
    nursing_charge      INT         NOT NULL,
    lab_charge          INT         NOT NULL,
    advance             INT         NOT NULL,
    insurence_no        INT         NOT NULL,
    total_bill          INT         NOT NULL,
    PRIMARY KEY(bill_no),
    FOREIGN KEY (pationt_id) REFERENCES Pationt(pationt_id)
);


CREATE TABLE Department(
    department_id       INT         NOT NULL,
    department_name     VARCHAR     NOT NULL,
    department_manager  VARCHAR     NOT NULL ,
    PRIMARY KEY(department_id)
);


CREATE TABLE Employee_Master(
    employee_id     INT         NOT NULL,
    pationt_id      INT         NOT NULL,
    first_name      VARCHAR     NOT NULL,
    last_name       VARCHAR     NOT NULL,
    contry          VARCHAR     NOT NULL,
    gender          VARCHAR     NOT NULL,
    adress          VARCHAR     NOT NULL,
    dob             date        NOT NULL,
    mobile          INT         NOT NULL,
    email           VARCHAR     NOT NULL,
    department_id   INT         NOT NULL,
    PRIMARY KEY (employee_id,department_id),
    FOREIGN KEY (pationt_id) REFERENCES Patient(pationt_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);


CREATE TABLE Payroll(
    employee_id     INT         NOT NULL,
    salary          INT         NOT NULL,
    net_salary      INT         NOT NULL,
    horly_salary    INT         NOT NULL,
    bonus_salary    INT         NOT NULL,
    compensation    INT         NOT NULL,
    IBAN            INT         NOT NULL,
    account_no      INT         NOT NULL,
    PRIMARY KEY (employee_id,account_no),
    FOREIGN KEY (employee_id) REFERENCES Employee_Master(employee_id)
);


INSERT INTO Pationt (pationt_id, first_name, last_name, nationality, gender, pationt_address, dob, phone, email)
VALUES
    (1, 'John', 'Doe', 'American', 'Male', '123 Main St, Anytown, USA', '1990-01-15', '555-123-4567', 'john.doe@email.com'),
    (2, 'Jane', 'Smith', 'British', 'Female', '456 Elm St, Othertown, UK', '1985-06-20', '555-987-6543', 'jane.smith@email.com');


INSERT INTO Doctor (doctor_id, personal_id, first_name, last_name, specalist)
VALUES
    (1, 1001, 'Dr. Smith','jehad' ,'Cardiologist'),
    (2, 1002, 'Dr. Johnson','samer', 'Pediatrician');


INSERT INTO Appointment (appointment_id, appointment_number, appointment_type, appointment_created, appointment_date, appointment_time, doctor_id, appointment_desc, employee_id)
VALUES
    (1, 'APPT001', 'Checkup', '2023-10-25', '2023-10-28', '10:00:00', 1, 'Regular checkup', 1),
    (2, 'APPT002', 'Surgery', '2023-10-25', '2023-11-02', '14:30:00', 2, 'Appendectomy', 2);


INSERT INTO Room (room_no, room_type, status)
VALUES
    (101, 'Standard', 'Occupied'),
    (102, 'Deluxe', 'Vacant');

INSERT INTO Hospital (hospital_id, hospital_name, hospital_type, area, road, building, country)
VALUES
    (1, 'General Hospital', 'Public', 'Downtown', 'Hospital Rd', 'Main Building', 'USA'),
    (2, 'Private Clinic', 'Private', 'Suburb', 'Clinic Ave', 'Clinic Building', 'UK');


INSERT INTO Hospital_Contact (hospital_id, phone, email)
VALUES
    (1, '555-111-2222', 'contact@generalhospital.com'),
    (2, '555-333-4444', 'info@privateclinic.co.uk');


INSERT INTO Medicine (medicine_id, medicine_name, medicine_type, medicine_cost, medicine_description)
VALUES
    (1, 'Aspirin', 'Painkiller', '5.99', 'For pain relief'),
    (2, 'Amoxicillin', 'Antibiotic', '8.99', 'For bacterial infections');


INSERT INTO Supplier (supplier_id, supplier_company, phone, email, supplier_address)
VALUES
    (1, 'Pharma Co.', '555-999-8888', 'info@pharmaco.com', '123 Supplier St, City'),
    (2, 'MediCorp', '555-777-6666', 'sales@medicorp.com', '456 Med Supplies Ave, Town');

INSERT INTO Medicine_Report (medicine_id, company, quantity, production_date, expier_date, country, supplier_id)
VALUES
    (1, 'Pharma Co.', 100, '2023-10-01', '2024-10-01', 'USA', 1),
    (2, 'MediCorp', 200, '2023-09-15', '2024-09-15', 'UK', 2);


