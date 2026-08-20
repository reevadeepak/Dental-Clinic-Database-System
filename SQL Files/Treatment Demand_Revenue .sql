# Question C5

SELECT 
    T.TreatmentName,
    COUNT(A.AppointmentID) AS TimesPerformed,
    SUM(I.Amount) AS TotalRevenue
FROM Treatment T
INNER JOIN Appointment A
    ON T.TreatmentID = A.TreatmentID
INNER JOIN Invoice I
    ON A.AppointmentID = I.AppointmentID
GROUP BY T.TreatmentName
HAVING COUNT(A.AppointmentID) > 1
   AND SUM(I.Amount) > 3000;

   
   
   