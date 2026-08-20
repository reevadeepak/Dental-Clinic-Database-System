# Question C9

SELECT 
    D.DoctorID,
    D.FullName,
    D.Role,
    COUNT(A.AppointmentID) AS TotalAppointments
FROM Doctor D
INNER JOIN Appointment A
    ON D.DoctorID = A.DoctorID
GROUP BY D.DoctorID, D.FullName, D.Role
HAVING COUNT(A.AppointmentID) > (
    SELECT AVG(AppointmentCount)
    FROM (
        SELECT COUNT(A1.AppointmentID) AS AppointmentCount
        FROM Doctor D1
        INNER JOIN Appointment A1
            ON D1.DoctorID = A1.DoctorID
        WHERE D1.Role = D.Role
        GROUP BY D1.DoctorID
    ) AS RoleAvg
);




