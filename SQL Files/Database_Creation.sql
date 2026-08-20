# Create and use the database
CREATE DATABASE TotallyToothyClinic;
USE TotallyToothyClinic;

# Create Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    HomeAddress VARCHAR(255)
);

# Create Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Role VARCHAR(50),
    Specialization VARCHAR(50)
);

# Create Treatment table
CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price INT,
    Duration INT,
    NumberOfSessions INT
);

# Create Room table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(20),
    RoomCategory VARCHAR(30)
);

# Create Allergy table
CREATE TABLE Allergy (
    AllergyID INT PRIMARY KEY,
    AllergyName VARCHAR(50) NOT NULL,
    Description VARCHAR(255)
);

# Create Patient_Allergy junction table
CREATE TABLE Patient_Allergy (
    PatientID INT,
    AllergyID INT,
    PRIMARY KEY (PatientID, AllergyID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (AllergyID) REFERENCES Allergy(AllergyID)
);

# Create TreatmentPlan table (needed before Appointment)
CREATE TABLE TreatmentPlan (
    TreatmentPlanID INT PRIMARY KEY,
    StartDate DATE NOT NULL,
    ExpectedEndDate DATE,
    Notes VARCHAR(255),
    PatientID INT,
    DoctorID INT,
    TreatmentID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);

# Create Appointment table with TreatmentPlanID included from the start
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    ApptDate DATE NOT NULL,
    ApptTime TIME NOT NULL,
    BookingMethod VARCHAR(20),
    PaymentType VARCHAR(20),
    PatientID INT,
    DoctorID INT,
    TreatmentID INT,
    RoomID INT,
    TreatmentPlanID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY (TreatmentPlanID) REFERENCES TreatmentPlan(TreatmentPlanID)
);

# Create Invoice table
CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    Amount INT NOT NULL,
    IssueDate DATE NOT NULL,
    PaymentStatus VARCHAR(15),
    PaymentMethod VARCHAR(20),
    AppointmentID INT UNIQUE NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

# Insert Doctor data
INSERT INTO Doctor (DoctorID, FullName, ContactNumber, Email, Role, Specialization) VALUES
(1, 'Mutsawashe Mandinde', '0554179651', 'mandindemutsawashe@gmail.com', 'Orthodontist', 'Braces & Alignment'),
(2, 'Reeva Deepak', '0501122334', 'reevadeepak@gmail.com', 'General Dentist', 'Cosmetic Dentistry'),
(3, 'Solomon Orange', '0525556667', 'solomonorange@gmail.com', 'Oral Surgeon', 'Oral Surgery'),
(4, 'Esther Blue', '0589998887', 'estherblue@gmail.com', 'Dental Hygienist', 'Periodontics'),
(5, 'Samuel Sapphire', '0501112222', 'samuelsapphire@toothyclinic.com', 'Pediatric Dentist', 'Childrens Dentistry'),
(6, 'Rachel Rose', '0503334444', 'rachelrose@toothyclinic.com', 'Endodontist', 'Root Canal Specialist'),
(7, 'Gideon Gold', '0505556666', 'gideongold@toothyclinic.com', 'Prosthodontist', 'Dentures & Implants'),
(8, 'Hannah Honey', '0507778888', 'hannahhoney@toothyclinic.com', 'Periodontist', 'Gum Disease Specialist'),
(9, 'Isaac Indigo', '0509990000', 'isaacindigo@toothyclinic.com', 'Oral Surgeon', 'Maxillofacial Surgery'),
(10, 'Phoebe Pear', '0501234567', 'phoebepear@toothyclinic.com', 'General Dentist', 'General Dentistry');

# Insert Patient data
INSERT INTO Patient (PatientID, FullName, ContactNumber, Email, HomeAddress) VALUES
(101, 'Isaac Mango', '0567771111', 'isaacmango@gmail.com', 'Villa 42, Jumeirah 1, Dubai'),
(102, 'Gideon Violet', '0567772222', 'gideonviolet@gmail.com', 'Apt 1004, Burj Vista, Downtown Dubai'),
(103, 'Delilah Cherry', '0567773333', 'delilahcherry@gmail.com', 'Frond D, Palm Jumeirah, Dubai'),
(104, 'Ezekiel Lime', '0567774444', 'ezekiellime@gmail.com', '123 Montgomery Drive, Waterfalls, Dubai'),
(105, 'Ruth Silver', '0567775555', 'ruthsilver@gmail.com', 'Apt 220, Marina Gate 2, Dubai Marina'),
(106, 'Noah Pineapple', '0567776666', 'noahpineapple@gmail.com', 'Villa 9, Al Barari, Dubai'),
(107, 'Caleb Cherry', '0567777777', 'calebcherry@gmail.com', 'Villa 5, Arabian Ranches, Dubai'),
(108, 'Lydia Lavender', '0567778888', 'lydialavender@gmail.com', 'Apt 12, City Walk Building 5, Dubai'),
(109, 'Hanna Hazel', '0567779999', 'hannahazel@gmail.com', 'Townhouse 1, Serena, Dubai'),
(110, 'Joshua Jade', '0567770000', 'joshuajade@gmail.com', 'Apt 902, JBR, Dubai'),
(111, 'Sarah Saffron', '0568881111', 'sarahsaffron@gmail.com', 'Villa 33, Al Furjan, Dubai');

# Insert Room data
INSERT INTO Room (RoomID, RoomName, RoomCategory) VALUES
(201, 'Surgery 1', 'Orthodontics'),
(202, 'Surgery 2', 'General Dentistry'),
(203, 'X-Ray Suite', 'Diagnostics'),
(204, 'Consultation Room', 'Initial Assessment'),
(205, 'Hygiene Bay', 'Cleaning & Prevention'),
(206, 'Pediatric Wing', 'Kids Dentistry'),
(207, 'Surgery 3', 'Oral Surgery'),
(208, 'Recovery Room', 'Post-Op Care'),
(209, 'Lab 1', 'Prosthetics & Crowns'),
(210, 'Emergency Bay', 'Urgent Care');

# Insert Treatment data
INSERT INTO Treatment (TreatmentID, TreatmentName, Description, Price, Duration, NumberOfSessions) VALUES
(301, 'Routine Cleaning', 'Scaling and polishing for plaque removal', 150, 30, 1),
(302, 'Invisalign Install', 'Teeth straightening system with invisalign', 5500, 60, 15),
(303, 'Metal Braces', 'Traditional orthodontic alignment', 3500, 60, 12),
(304, 'Root Canal', 'Endodontic therapy to save a damaged tooth', 850, 90, 2),
(305, 'Teeth Whitening', 'Professional laser-assisted whitening', 400, 45, 1),
(306, 'Dental Implant', 'Titanium post replacement for missing teeth', 8000, 120, 3),
(307, 'Wisdom Tooth Extraction', 'Surgical removal of impacted wisdom teeth', 1200, 90, 1),
(308, 'Porcelain Veneers', 'Cosmetic shells for front teeth smile design', 12000, 180, 2),
(309, 'Emergency Filling', 'Urgent repair for tooth decay or cavities', 300, 45, 1),
(310, 'Full Mouth Recon', 'Complete restoration of all teeth in the mouth', 25000, 300, 10);

# Insert Allergy data
INSERT INTO Allergy (AllergyID, AllergyName, Description) VALUES
(401, 'Latex', 'Immediate facial swelling and patient begins looking like a balloon.'),
(402, 'Lidocaine', 'Severe hallucinations.'),
(403, 'Amoxicillin', 'Violent pink hives covering 90% of the body.'),
(404, 'Epinephrine', 'Extreme heart palpitations and patient cannot breathe.'),
(405, 'Nitrous Oxide', 'Uncontrollable laughing fits followed by weeping.'),
(406, 'Nickel', 'Rash and swelling if orthodontic wires contain nickel.'),
(407, 'Chlorhexidine', 'Severe mouth sores from standard surgical mouthwash.'),
(408, 'Codeine', 'Nausea, vomiting, and extreme dizziness.'),
(409, 'Acrylic', 'Inflammation of gums when in contact with denture bases.'),
(410, 'Iodine', 'Anaphylactic risk when using certain antiseptic solutions.');

# Insert Patient_Allergy data
INSERT INTO Patient_Allergy (PatientID, AllergyID) VALUES
(101, 403), (102, 402), (104, 401), (106, 405), (103, 408), 
(105, 407), (107, 406), (108, 410), (109, 409), (110, 404);

# Insert TreatmentPlan data 
INSERT INTO TreatmentPlan (TreatmentPlanID, StartDate, ExpectedEndDate, Notes, PatientID, DoctorID, TreatmentID) VALUES
(701, '2026-01-10', '2027-01-10', 'Patient requires monthly tightening.', 101, 1, 303),
(702, '2026-02-15', '2026-02-15', 'Standard maintenance, monitor gum health.', 102, 2, 301),
(703, '2026-02-20', '2026-03-20', 'Multi-stage root canal.', 103, 2, 304),
(704, '2026-03-01', '2026-12-01', 'Invisalign sequence; 15 trays total.', 104, 1, 302),
(705, '2026-03-05', '2026-03-10', 'Two part professional whitening process.', 105, 2, 305),
(706, '2026-01-20', '2026-04-20', 'Follow-up on braces, watch for latex sensitivity.', 106, 1, 303),
(707, '2026-03-10', '2027-03-10', 'Complex alignment for Caleb; consult surgeon if needed.', 107, 1, 303),
(708, '2026-02-01', '2026-02-28', 'Periodontal therapy; 4 sessions total.', 108, 2, 301),
(709, '2026-03-12', '2026-06-12', 'Extensive cosmetic restoration.', 109, 2, 302),
(710, '2026-03-15', '2026-03-15', 'Initial preventative assessment.', 110, 1, 301),
(711, '2026-03-06', '2026-04-06', 'Root canal treatment for tooth #19', 110, 2, 304),
(712, '2026-03-07', '2027-03-07', 'Full braces treatment', 111, 1, 303);

# Insert Appointment data with TreatmentPlanID included
INSERT INTO Appointment 
(AppointmentID, ApptDate, ApptTime, BookingMethod, PaymentType, PatientID, DoctorID, TreatmentID, RoomID, TreatmentPlanID)
VALUES
(600, '2026-03-10', '09:00:00', 'Online', 'Card', 101, 1, 303, 201, 701),
(610, '2026-03-15', '09:00:00', 'Online', 'Card', 101, 1, 303, 201, 701),
(611, '2026-03-20', '10:00:00', 'Phone', 'Cash', 101, 1, 303, 201, 701),
(601, '2026-03-10', '10:00:00', 'Phone', 'Cash', 102, 2, 301, 205, 702),
(612, '2026-03-16', '11:00:00', 'Online', 'Card', 102, 2, 301, 205, 702),
(613, '2026-03-21', '09:30:00', 'Walk-in', 'Cash', 102, 2, 301, 205, 702),
(602, '2026-03-10', '11:00:00', 'Online', 'Insurance', 103, 3, 307, 207, 703),
(614, '2026-03-17', '09:00:00', 'Online', 'Insurance', 103, 2, 304, 202, 703),
(615, '2026-03-22', '10:30:00', 'Phone', 'Cash', 103, 2, 304, 202, 703),
(616, '2026-03-18', '11:00:00', 'Walk-in', 'Card', 104, 1, 302, 201, 704),
(617, '2026-03-23', '12:00:00', 'Online', 'Card', 104, 1, 302, 201, 704),
(618, '2026-03-24', '09:00:00', 'Phone', 'Cash', 104, 1, 302, 201, 704),
(604, '2026-03-11', '10:30:00', 'Online', 'Card', 105, 5, 305, 206, 705),
(619, '2026-03-19', '10:00:00', 'Online', 'Card', 105, 2, 305, 206, 705),
(620, '2026-03-25', '11:30:00', 'Walk-in', 'Cash', 105, 2, 305, 206, 705),
(605, '2026-03-11', '12:00:00', 'Phone', 'Cash', 106, 6, 304, 202, 706),
(621, '2026-03-19', '12:00:00', 'Online', 'Card', 106, 6, 304, 202, 706),
(622, '2026-03-26', '09:00:00', 'Phone', 'Cash', 106, 6, 304, 202, 706),
(606, '2026-03-12', '09:00:00', 'Online', 'Insurance', 107, 7, 306, 209, 707),
(623, '2026-03-20', '10:30:00', 'Walk-in', 'Card', 107, 7, 306, 209, 707),
(624, '2026-03-27', '11:00:00', 'Online', 'Cash', 107, 7, 306, 209, 707),
(607, '2026-03-12', '10:30:00', 'Walk-in', 'Card', 108, 8, 301, 205, 708),
(625, '2026-03-21', '09:00:00', 'Phone', 'Card', 108, 8, 301, 205, 708),
(626, '2026-03-28', '10:30:00', 'Online', 'Cash', 108, 8, 301, 205, 708),
(608, '2026-03-12', '12:00:00', 'Online', 'Cash', 109, 9, 307, 207, 709),
(627, '2026-03-22', '09:00:00', 'Online', 'Card', 109, 9, 307, 207, 709),
(628, '2026-03-29', '10:30:00', 'Walk-in', 'Cash', 109, 9, 307, 207, 709),
(609, '2026-03-13', '09:00:00', 'Phone', 'Card', 110, 10, 301, 202, 710),
(711, '2026-03-06', '09:00:00', 'Phone', 'Cash', 110, 2, 304, 202, 710),
(629, '2026-03-23', '09:00:00', 'Online', 'Card', 110, 10, 301, 202, 710),
(630, '2026-03-24', '10:00:00', 'Online', 'Card', 111, 1, 303, 201, 712),
(631, '2026-03-25', '11:00:00', 'Phone', 'Cash', 111, 1, 303, 201, 712),
(632, '2026-03-26', '12:00:00', 'Walk-in', 'Card', 111, 1, 303, 201, 712);

INSERT INTO Invoice
(InvoiceID, Amount, IssueDate, PaymentStatus, PaymentMethod, AppointmentID)
VALUES
(950, 3500, '2026-03-10', 'Paid', 'Credit Card', 600),
(963, 3500, '2026-03-15', 'Pending', 'Card', 610),
(964, 3500, '2026-03-20', 'Pending', 'Cash', 611),
(951, 150, '2026-03-10', 'Pending', 'Cash', 601),
(965, 150, '2026-03-16', 'Pending', 'Card', 612),
(966, 150, '2026-03-21', 'Pending', 'Cash', 613),
(952, 1200, '2026-03-10', 'Paid', 'Insurance', 602),
(967, 850, '2026-03-17', 'Pending', 'Insurance', 614),
(968, 850, '2026-03-22', 'Pending', 'Cash', 615),
(969, 302, '2026-03-18', 'Pending', 'Card', 616),
(970, 302, '2026-03-23', 'Pending', 'Card', 617),
(971, 302, '2026-03-24', 'Pending', 'Cash', 618),
(954, 400, '2026-03-11', 'Paid', 'Credit Card', 604),
(972, 400, '2026-03-19', 'Pending', 'Card', 619),
(973, 400, '2026-03-25', 'Pending', 'Cash', 620),
(955, 850, '2026-03-11', 'Pending', 'Cash', 605),
(974, 850, '2026-03-19', 'Pending', 'Card', 621),
(975, 850, '2026-03-26', 'Pending', 'Cash', 622),
(956, 8000, '2026-03-12', 'Paid', 'Insurance', 606),
(976, 8000, '2026-03-20', 'Pending', 'Insurance', 623),
(977, 8000, '2026-03-27', 'Pending', 'Cash', 624),
(957, 150, '2026-03-12', 'Paid', 'Card', 607),
(978, 150, '2026-03-21', 'Pending', 'Card', 625),
(979, 150, '2026-03-28', 'Pending', 'Cash', 626),
(958, 1200, '2026-03-12', 'Paid', 'Cash', 608),
(980, 1200, '2026-03-22', 'Pending', 'Card', 627),
(981, 1200, '2026-03-29', 'Pending', 'Cash', 628),
(959, 150, '2026-03-13', 'Pending', 'Credit Card', 609),
(711, 850, '2026-03-06', 'Pending', 'Cash', 711),
(982, 150, '2026-03-23', 'Pending', 'Card', 629),
(983, 3500, '2026-03-24', 'Pending', 'Card', 630),
(984, 3500, '2026-03-25', 'Pending', 'Cash', 631),
(985, 3500, '2026-03-26', 'Pending', 'Card', 632);


