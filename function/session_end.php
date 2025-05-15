<?php
    session_start();

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
