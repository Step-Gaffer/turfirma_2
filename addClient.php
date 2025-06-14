<?php
include 'func_db.php';
addClient(
    $_POST['name'],
    $_POST['dataPassport'],
    $_POST['dataDetailsPassport'],
    $_POST['availabilityVisa'],
    $_POST['dataVisa'],
    $_POST['IDcategory']
);
header("Location: .");