# Question C7

SET @PatientID = 108;

SELECT 
    A.AppointmentID,
    A.ApptDate,
    T.TreatmentName,
    D.FullName AS DoctorName
FROM Appointment A
INNER JOIN Treatment T
    ON A.TreatmentID = T.TreatmentID
INNER JOIN Doctor D
    ON A.DoctorID = D.DoctorID
WHERE A.PatientID = @PatientID;



