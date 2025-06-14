<?php

$link = false;

function openDB()
{
    global $link;

    $link = mysqli_connect("localhost", "root", "", "individualnaya_rabota_tur_firma");
    mysqli_query($link, "SET NAMES UTF8");
}

function closeDB()
{
    global $link;
    $link = false;
}

function getClients()
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM clients");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getClientsRow($id)
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM clients WHERE IDClient = $id");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function deleteClientsRow($id)
{
    global $link;
    openDB();

    try {
        $isDeleted = mysqli_query($link, "DELETE FROM clients WHERE IDClient = $id");
    } catch (Exception $e) {
        die("Ошибка: " . $e->getMessage());
    } finally {
        closeDB();
        return $isDeleted;
    }
}

function addClient($name, $dataPassport, $dataDetailsPassport, $availabilityVisa, $dataVisa, $IDcategory)
{
    global $link;
    openDB();

    try {
        mysqli_query($link, "
        INSERT INTO clients SET
        fullName = '$name',
        dataPassport = '$dataPassport',
        dataDetailsPassport = '$dataDetailsPassport',
        availabilityVisa = '$availabilityVisa',
        dataVisa = '$dataVisa',
        IDcategory = '$IDcategory'
        ");
    } catch (Exception $e) {
        die("Ошибка: " . $e->getMessage());
    }
    closeDB();
}

function getClientCategory($id)
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM client_categories WHERE IDcategory = $id");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getClientCategories()
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM client_categories");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}
?>