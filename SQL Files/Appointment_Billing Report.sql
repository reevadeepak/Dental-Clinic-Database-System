# Question C1

SELECT
P.FullName AS PatientName,
D.FullName AS DoctorName,
T.TreatmentName,
A.ApptDate,
A.ApptTime,
R.RoomName,
I.Amount,
I.PaymentStatus
FROM Appointment A
INNER JOIN Patient P
ON A.PatientID = P.PatientID
INNER JOIN Doctor D
ON A.DoctorID = D.DoctorID
INNER JOIN Treatment T
ON A.TreatmentID = T.TreatmentID
INNER JOIN Room R
ON A.RoomID = R.RoomID
INNER JOIN Invoice I
ON A.AppointmentID = I.AppointmentID;


    
    