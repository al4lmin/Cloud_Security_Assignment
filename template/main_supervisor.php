<?php
    if (!defined('MAIN_SUPERVISOR') || MAIN_SUPERVISOR !== true) {
        die('Forbidden: Direct access is not allowed.');
    }
?>

<div class="operation-task">
    <a href="approved_list.php">
        <img src="images/approved.png" alt="approved_list">
        <p>Approved Project</p>
    </a>
</div>
<div class="operation-task">
    <a href="rejected_list.php">
        <img src="images/rejected.png" alt="rejected_list">
        <p>Rejected Project</p>
    </a>
</div>
<div class="operation-task">
    <a href="supervised.php">
        <img src="images/supervised.png" alt="pending_list">
        <p>Supervised Student</p>
    </a>
</div>
<div class="operation-task">
    <a href="meeting_sv.php">
        <img src="images/submit_meeting.png" alt="pending_list">
        <p>Meeting Management</p>
    </a>
</div>
<div class="operation-task">
    <a href="goals_sv.php">
        <img src="images/goal_and_progress.png" alt="student_list">
        <p>Goal and Progress</p>
    </a>
</div>
<div class="operation-task">
    <a href="proposal_submission.php">
        <img src="images/submit_proposal.png" alt="registration">
        <p>Proposal Submission</p>
    </a>
</div>
<div class="operation-task">
    <a href="assessment.php">
        <img src="images/submit_assesstment.png" alt="registration">
        <p>Assesstment Submission</p>
    </a>
</div>