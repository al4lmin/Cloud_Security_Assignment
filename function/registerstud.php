<?php
require_once 'db_connect.php';
$conn = OpenCon();

$status = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name = $_POST['name'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $specialization = $_POST['specialization'];

    $userSql = "INSERT INTO user (`user_name`, `user_password`, `user_email`, `user_phone`, `user_role`)
                VALUES ('$name', '$password', '$email', '$phone', 'student')";
    $userInsert = $conn->query($userSql);

    if($userInsert){
        $sql = "SELECT * FROM user WHERE user_name = '$name' AND user_email = '$email'";
        $result = $conn->query($sql);
        $row = mysqli_fetch_array($result);
        $userId = $row['user_ID'];

        $studSql = "INSERT INTO student (`specialization`, `user_ID`)
                    VALUES ('$specialization', '$userId')";
        $studInsert = $conn->query($studSql);
        $status = true;

        // Get the last inserted ID
        $sql = "SELECT s.student_ID FROM student s
                JOIN user u ON u.user_ID = s.user_ID
                WHERE u.user_ID = '$userId'";
        $result = $conn->query($sql);
        $row = mysqli_fetch_array($result);
        $student_ID = $row['student_ID'];
    }
 
    if($status){
        echo "<script>
                    alert('You have successfully registered your account. This is your ID: {$student_ID}');
                    window.location.href = '../login.php';
            </script>";
    }
    else {
        echo '<script>
                    alert("Registration failed. Please try again.");
                    window.location.href = "../student_register.php";
            </script>';
    }

}

?>