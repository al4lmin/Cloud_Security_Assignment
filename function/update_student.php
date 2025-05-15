<?php
    require("session.php");
    require ('db_connect.php');

    if($_SESSION['user_role'] != "admin") {
        die('Forbidden: Direct access is not allowed.');
    }

    $conn = openCon();
    $sql = "SELECT 
                u.user_name as student_name,  
                u.user_email as student_email,  
                u.user_phone as student_phone,  
                stu.specialization,
                sup.supervisor_ID,
                p.project_title,
                p.co_supervisor_name,
                p.proposed_by,
                p.project_type, 
                p.project_specialization,
                IFNULL(us.user_name, 'N/A') AS supervisor_name
            FROM user u 
            JOIN student stu ON u.user_ID = stu.user_ID
            LEFT JOIN proposal p ON stu.student_ID = p.student_ID
            LEFT JOIN supervisor sup ON p.supervisor_ID = sup.supervisor_ID
            LEFT JOIN user us ON s.user_ID = us.user_ID
            WHERE s.student_ID ='" .$_GET['id']. "' ";
    $result = $conn -> query($sql);
    $row = mysqli_fetch_array($result);

    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
    <link rel="stylesheet" href="../static/update_student.css">
</head>

<body>
    <form action="update_student.php">
        <div>
            <label for="student_id">Student ID:</label>
            <input type="text" id="student_id" value=<?php echo $_GET['id']; ?> readonly>
        </div>
        <div>
            <label for="student_name">Student Name:</label>
            <input type="text" id="student_name" value=<?php echo $row['student_name']; ?>>
        </div>
        <div>
            <label for="student_email">Student Email:</label>
            <input type="text" id="student_email" value=<?php echo $row['student_email']; ?> >
        </div>
    </form>
</body>
</html>