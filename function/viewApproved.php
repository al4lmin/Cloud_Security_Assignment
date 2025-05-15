<?php
require_once 'db_connect.php';
$conn = OpenCon(); 

function viewData(){
    global $conn;

    // Get filter parameters from the URL (GET request)
    $searchName = isset($_GET['searchName']) ? $_GET['searchName'] : '';
    $searchSupervisor = isset($_GET['searchSupervisor']) ? $_GET['searchSupervisor'] : '';
    $searchSpecial= isset($_GET['specialization']) ? $_GET['specialization'] : 'all-specializations';

    // Base SQL query
    $sql = "SELECT * FROM proposal WHERE proposal_status = 'approve'";

    // Apply filters based on user input
    if ($searchName) {
        $searchName = $conn->real_escape_string($searchName);  // Prevent SQL Injection
        $sql .= " AND student_name LIKE '%$searchName%'";
    }

    if ($searchSupervisor) {
        $searchSupervisor = $conn->real_escape_string($searchSupervisor);  // Prevent SQL Injection
        $sql .= " AND supervisor_name LIKE '%$searchSupervisor%'";
    }
    
    if ($searchSpecial != 'all-specializations') {
        $sql .= " AND specialization = '$searchSpecial'";
    }

    // Execute the SQL query
    $result = $conn->query($sql);

    // Check if any results are found
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $studID = $row['student_ID'];
            $studName = $row['student_name'];
            $title = $row['project_title'];
            $specialization = $row['specialization'];
            $proposeBy = $row['proposed_by'];
            $supervisor = $row['supervisor_name'];

            // Display the filtered data in a table row
            echo "<tr>
                    <td>".$studID."</td>
                    <td>".$studName."</td>
                    <td>".$title."</td>
                    <td>".$specialization."</td>
                    <td>".$proposeBy."</td>
                    <td>".$supervisor."</td>
                </tr>";
        }
    } else {
        echo "<tr><td colspan='6'>No records found</td></tr>";
    }
}
?>
