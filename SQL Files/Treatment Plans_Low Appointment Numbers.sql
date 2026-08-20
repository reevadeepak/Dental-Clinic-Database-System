# Question C3

SELECT 
    TP.TreatmentPlanID,
    P.FullName,
    T.TreatmentName,
    COUNT(A.AppointmentID) AS ScheduledAppointments,
    T.NumberOfSessions
FROM TreatmentPlan TP
INNER JOIN Patient P
    ON TP.PatientID = P.PatientID
INNER JOIN Treatment T
    ON TP.TreatmentID = T.TreatmentID
LEFT JOIN Appointment A
    ON TP.TreatmentPlanID = A.TreatmentPlanID
GROUP BY TP.TreatmentPlanID, P.FullName, T.TreatmentName, T.NumberOfSessions
HAVING COUNT(A.AppointmentID) < (
    SELECT T2.NumberOfSessions
    FROM TreatmentPlan TP2
    INNER JOIN Treatment T2
        ON TP2.TreatmentID = T2.TreatmentID
    WHERE TP2.TreatmentPlanID = TP.TreatmentPlanID
);

