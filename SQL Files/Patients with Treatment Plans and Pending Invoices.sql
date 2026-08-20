# Question C8

SELECT
    P.FullName
FROM Patient P
WHERE EXISTS(
    SELECT 1
    FROM TreatmentPlan TP
    WHERE TP.PatientID = P.PatientID
)
AND EXISTS(
    SELECT 1
    FROM Appointment A
    INNER JOIN Invoice I
        ON A.AppointmentID = I.AppointmentID
    WHERE A.PatientID = P.PatientID
        AND I.PaymentStatus = 'Pending'
);