<?php
    require ('function/session.php');
    require ('function/db_connect.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/reusable.css">
    <link rel="stylesheet" href="static/base.css">
    <link rel="stylesheet" href="static/index.css">
    <link rel="stylesheet" href="static/calender.css">
    <title>MMU FYP System</title>
</head>

<body>
    <?php
        require "template/navbar.php";
    ?>

    <main>
        <h1 class="title-font">FYP PORTAL</h1>
        <div id="container">
            <aside id="side-bar-panel">
                <div id="user-info">
                    <div id="picture-content">
                        <img id="user_picture" src="images/user_profile2.png" alt="user_img">
                        <h3 id="user-name"><?php echo $_SESSION["user_name"]; ?></h3>
                    </div>
                    <p id="user-id"><?php echo $_SESSION["user_ID"]; ?></p>      
                    <p id="user-role"><?php echo ucfirst($_SESSION["user_role"]); ?></p>             
                </div>
                
                <div id="user-navigation">
                    <h3>Navigation</h3>
                    <ul>
                        <li>
                            <a href="profile.php">
                                <img src="images/my_profile.png" alt="my_profile">
                                My Profile
                            </a>
                        </li>
                        <li>
                            <a href="https://online.mmu.edu.my/" target="_blank">
                                <img src="images/internet.png" alt="student_portal">
                                MMU Portal
                          </a>                 
                        </li>
                        <li>
                            <a href="https://clic.mmu.edu.my/" target="_blank">
                                <img src="images/clic_system.png" alt="clic">
                                CLIC
                            </a>                  
                        </li>
                        <li>
                            <a href="https://ebwise.mmu.edu.my/" target="_blank">
                                <img src="images/book.png" alt="ebwise">
                                Ebwise
                            </a>                  
                        </li>
                        <li>
                            <a href="https://mmuexpert.mmu.edu.my/" target="_blank">
                                <img src="images/lecture.png" alt="lecture_list">
                                Lecture List
                            </a>                   
                        </li>
                        <li>
                            <a href="function/session_end.php">
                                <img src="images/logout.png" alt="logout">
                                Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>

            <div id="center-panel">
                <div id="operation-content">

                    <?php
                        if($_SESSION["user_role"] == "admin"){
                            define('MAIN_ADMIN', true);
                            include("template/main_admin.php");
                        }
                        elseif($_SESSION["user_role"] == "supervisor"){
                            define('MAIN_SUPERVISOR', true);
                            include("template/main_supervisor.php");
                        }
                        else{
                            define('MAIN_STUDENT', true);
                            include("template/main_student.php");
                        }
                    ?>
                </div>

                <h2>Annoucement Board</h2>
                <div id="announcement-board">
                    <div id="announcement-content">

                        <?php
                            $conn = openCon();
                            $sql = "SELECT * FROM announcement";
                            $result = $conn-> query($sql);
                            $rowcount = mysqli_num_rows($result);

                            if($rowcount > 0) {
                                while($row = $result->fetch_assoc()) {
                                    echo '<div class="annoucement-text">
                                          <span class="title">'.strtoupper($row['announcement_title']) .'</span>
                                          <span class="text">'.$row['announcement_content'].'</span>
                                          <span class="author">By: '.$row['post_by'].'</span>
                                          </div>';
                                }
                            }else {
                                echo '<div class="annoucement-text">No announcement yet</div>';
                            }
                        ?>
                    </div>
                </div>

            </div>

            <div id="activity-bar-panel">
                <div id="calendar-container">
                    <h2>Calendar</h2>
                    
                    <table id="calendar">
                        <caption id="calendar-caption"></caption>
                        <thead>
                            <tr>
                                <th>S</th>
                                <th>M</th>
                                <th>T</th>
                                <th>W</th>
                                <th>T</th>
                                <th>F</th>
                                <th>S</th>                       
                            </tr>
                        </thead>
                        <tbody id="calendar-data"></tbody>
                    </table>
                </div>

                <div id="event-container">
                    <h2>Event</h2>
                    <div>
                        <?php
                            $conn = openCon();

                            $sql = "SELECT * FROM event ORDER BY event_date ASC";
                            $result = $conn-> query($sql);
                            $rowcount = mysqli_num_rows($result);

                            if($rowcount > 0) {
                                while($row = $result->fetch_assoc()) {
                                    $formatted_date = date('d F Y', strtotime($row['event_date']));
                                    echo '<div class="event-details">
                                          <h3>'.$formatted_date.'</h3>
                                          <p>'. strtoupper($row['event_title']).'</p>
                                          </div>';
                                }
                            }
                            else {
                                echo "No event currently";
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <?php
        include "template/footer.php";
    ?>    

    <script src="static/index.js"></script>

</body>

</html>


