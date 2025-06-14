<?php
include 'func_db.php';
$isDeleted = deleteClientsRow($_GET['id']);
header("Location: .");