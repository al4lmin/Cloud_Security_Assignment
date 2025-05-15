<?php
    require ("function/session.php");
    require ('function/db_connect.php');
    require ('function/check_role.php');

    restrict_admin();

    $conn = openCon();

    $sql = "SELECT 
            stu.student_ID,
            u.user_name AS student_name,
            u.user_email AS student_email,
            u.user_phone AS student_phone,
            stu.specialization AS specialization,
            CASE
                WHEN p.proposal_status IN ('pending', 'reject') THEN ''
                ELSE sup.supervisor_ID
            END AS supervisor_ID,
            CASE 
                WHEN p.proposal_status IN ('pending', 'reject') THEN ''
                ELSE us.user_name
            END AS supervisor_name
        FROM student stu
        JOIN user u ON stu.user_ID = u.user_ID
        LEFT JOIN proposal p ON stu.student_ID = p.student_ID
        LEFT JOIN supervisor sup ON p.supervisor_ID = sup.supervisor_ID
        LEFT JOIN user us ON sup.user_ID = us.user_ID";

    if(isset($_POST['submit'])) {
        $student_name = $_POST['student_name'];
        $supervisor_name = $_POST['supervisor_name'];
        $specialization = $_POST['specialization'];
        $conditions = [];
        
        if (!empty($student_name)) {
            $conditions[] = "u.user_name LIKE '%$student_name%'";
        }
        if (!empty($supervisor_name)) {
            $conditions[] = "us.user_name LIKE '%$supervisor_name%'";
        }
        if ($specialization !== "All Specializations") {
            $conditions[] = "stu.specialization = '$specialization'";
        }

        // Add the WHERE clause if there are conditions
        if (count($conditions) > 0) {
            $sql .= " WHERE " . implode(" AND ", $conditions);
        }
    }
    $result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/base.css">
    <link rel="stylesheet" href="static/reusable.css">
    <link rel="stylesheet" href="static/table.css">
    <title>Student List</title>
</head>

<body>
    <?php
        include "template/navbar.php";
    ?>

    <main>
        <div class="content-container">
            <form action="student_list.php" method="POST" class="filter-container" >
                <h2>Filters: </h2>
                <label for="student_name">Student Name:</label>
                <input type="text" id="student_name" name="student_name" placeholder="Name...">
                <label for="supervisor_name">Supervisor Name:</label>
                <input type="text" id="supervisor_name" name="supervisor_name" placeholder="Name...">
                <label for="speacilization">Specialization:</label>
                <select id="speacilization" name="specialization">
                    <option name="All Specializations">All Specializations</option>
                    <option name="Computer Science">Computer Science</option>
                    <option name="Cybersecurity">Cybersecurity</option>
                    <option name="Game Development">Game Development</option>
                    <option name="Data Science">Data Science</option>
                    <option name="Software Enginering">Software Enginering</option>
                    <option name="Information System">Information System</option>
                </select>
                <input type="submit" name="submit" value="Search">
            </form>

            <div id="studList-table-container" class="table-container">
                <h1>Student List</h1>
                <table id="student-list-table" class="modern-table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Specialization</th>
                            <th>Supervisor</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                            if(mysqli_num_rows($result) >= 1) {
                                $count = 1;
                                while($row = $result->fetch_assoc()) {
                                    echo "<tr>
                                            <td>$count</td>
                                            <td>".$row['student_ID']."</td>
                                            <td>
                                                <a href='view_profile.php?id=".$row['student_ID']."&name=".$row['student_name']."&role=student'>
                                                    ".$row['student_name']."
                                                </a>
                                            </td>
                                            <td>".$row['student_email']."</td>
                                            <td>".$row['student_phone']."</td>
                                            <td>".$row['specialization']."</td>
                                            <td>";
                                            
                                            if (!empty($row['supervisor_ID']) && !empty($row['supervisor_name'])) {
                                                echo "<a href='view_profile.php?id=".$row['supervisor_ID']."&name=".$row['supervisor_name']."&role=supervisor'> 
                                                        Dr. ".$row['supervisor_name']."
                                                    </a>";
                                            } else {
                                                echo "-";
                                            }

                                    echo   "</td>
                                        </tr>";
                                    $count+=1;
                                }
                            }
                            else {
                                echo "<td colspan=7 style='text-align: center;'>No Students Available</td>";
                            }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <?php
        include "template/footer.php";
    ?>  
</body>
</html>