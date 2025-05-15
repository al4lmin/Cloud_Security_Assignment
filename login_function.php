<?php
    session_start();
    include ('db_connect.php');
    $conn = OpenCon();

    if(isset($_POST['login'])){
    $user_ID = mysqli_real_escape_string($conn, $_POST['user_ID']);  // student_ID in this case
    $password = $_POST['password']; // don't escape password

    switch($user_ID[0]){
        case '1': // student IDs start with 1xxxx
            $sql = "SELECT u.user_ID, u.user_name, u.user_password, u.user_role, s.student_ID AS specific_ID 
                    FROM user u
                    JOIN student s ON u.user_ID = s.user_ID
                    WHERE s.student_ID = '$user_ID'";
            break;

        case '5': // supervisor
            $sql = "SELECT u.user_ID, u.user_name, u.user_password, u.user_role, s.supervisor_ID AS specific_ID 
                    FROM user u
                    JOIN supervisor s ON u.user_ID = s.user_ID
                    WHERE s.supervisor_ID = '$user_ID'";
            break;

        case '8': // admin
            $sql = "SELECT u.user_ID, u.user_name, u.user_password, u.user_role, a.admin_ID AS specific_ID 
                    FROM user u
                    JOIN admin a ON u.user_ID = a.user_ID
                    WHERE a.admin_ID = '$user_ID'";
            break;

        default:
            echo "<script>alert('Invalid ID');window.location.href='../login.php';</script>";
            exit();
    }

    $result = $conn->query($sql);

    if ($result && mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);

// DEBUG: Show the password from DB and user input
echo "Entered password: " . $password . "<br>";
echo "Hashed password from DB: " . $row['user_password'] . "<br>";

if (password_verify($password, $row['user_password'])) {
    // Success
    echo "success";
} else {
    echo "Password verification failed";
    exit();
}


        if (password_verify($password, $row['user_password'])) {
            // login success
            $_SESSION["user_name"] = $row['user_name'];
            $_SESSION["user_ID"] = $row['specific_ID'];
            $_SESSION["user_role"] = $row['user_role'];

            $audit_action = "Log in"; 
            $auditUname = $_SESSION["user_name"];
            $auditID = $_SESSION["user_ID"];

            $sql = "INSERT INTO audit_log (
            user_id, 
            username, 
            action) VALUES(
            '$auditID',
            '$auditUname',
            '$audit_action'
            )";

            $conn->query($sql);

            header('Location:../index.php');
            exit();
        } else {
            // password wrong
            echo "<script>alert('Invalid password');window.location.href='../login.php';</script>";
        }
    } else {
        // no such user
        echo "<script>alert('Invalid user ID');window.location.href='../login.php';</script>";
    }
}


?>