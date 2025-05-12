<?php
    session_start();
    include ('db_connect.php');
    $conn = OpenCon();

    if(isset($_POST['login'])){
        $user_ID = mysqli_real_escape_string($conn, $_POST['user_ID']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);
    
        switch($user_ID[0]){
            case '1': //student
                $sql = "SELECT u.user_ID, u.user_name, u.user_password, u.user_role, s.student_ID AS specific_ID FROM user u
                        JOIN student s ON u.user_ID = s.user_ID
                        WHERE s.student_ID = '$user_ID' AND u.user_password = '$password'";
                break;

            case '5': //supervisor
                $sql = "SELECT u.user_ID, u.user_name, u.user_password, u.user_role, s.supervisor_ID AS specific_ID FROM user u
                        JOIN supervisor s ON u.user_ID = s.user_ID
                        WHERE s.supervisor_ID = '$user_ID' AND u.user_password = '$password'";
                break;
                        
            case '8': //admin
                $sql = "SELECT u.user_ID, u.user_name, u.user_password, u.user_role, a.admin_ID AS specific_ID FROM user u
                        JOIN admin a ON u.user_ID = a.user_ID
                        WHERE a.admin_ID = '$user_ID' AND u.user_password = '$password'";
                break;
            
            default:
                echo "<script>alert('Invalid ID');window.location.href='../login.php';</script>";
                exit();
        }

        $result = $conn->query($sql);
        $rowcount = mysqli_num_rows($result);

        if ($rowcount == 1){
            $row = mysqli_fetch_array($result);
            $_SESSION["user_name"] = $row['user_name'];
            $_SESSION["user_ID"] = $row['specific_ID'];
            $_SESSION["user_role"] = $row['user_role'];

            header('Location:../index.php');
        }else {
            echo "<script>alert('Invalid password');window.location.href='../login.php';</script>";
        }
    }
    else {
        echo "<script>alert('Page Not Accessible');window.location.href='../login.php';</script>";
    }

?>
