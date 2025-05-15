<?php
    session_start();
    include('db_connect.php');
    $conn = OpenCon();

        if (isset($_SESSION["user_ID"]) && isset($_SESSION["user_name"])) {
            $auditID = $_SESSION["user_ID"];
            $auditUname = $_SESSION["user_name"];
            $audit_action = "Log out";

            $sql = "INSERT INTO audit_log ( 
                user_id, 
                username, 
                action) VALUES(
                '$auditID',
                '$auditUname',
                '$audit_action'
                )";

            $conn->query($sql);

            }


    // Unset all session variables
    $_SESSION = array();

    // Delete cookies
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
    }

    session_destroy();
    
    echo "<script>
            alert('Logout Successfully!');
            window.location.href = '../login.php';
        </script>";
?>
