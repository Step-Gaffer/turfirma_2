<?php
include 'func_db.php';
$clientCategories = getClientCategories();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавить клиента</title>
    <style>
        label {
            font-weight: 700;
            margin: 3px;
            display: inline-block;
            width: 210px;
        }
    </style>
</head>

<body>
    <form action="addClient.php" method="post">
        <div><label for="name">ФИО: </label><input type="text" name="name"></div>
        <div><label for="dataPassport">Номер и серия паспорта: </label><input type="text" name="dataPassport"></div>
        <div><label for="dataDetailsPassport">Дата выдачи паспорта: </label><input type="date"
                name="dataDetailsPassport"></div>
        <div><label for="availabilityVisa">Наличие визы: </label>
            <select name="availabilityVisa">
                <option value='Да'>Да</option>
                <option value='Нет'>Нет</option>
            </select>
        </div>
        <div><label for="dataVisa">Срок истечения: </label><input type="date" name="dataVisa"></div>
        <div><label for="IDcategory">Категория: </label>
            <select name="IDcategory">
                <?php
                foreach ($clientCategories as $c) {
                    $key = $c['IDcategory'];
                    $val = $c['categoryName'];
                    echo "<option value='$key'>$val</option>";
                }
                ?>
            </select>
        </div>
        <div><input type="submit" value="Добавить в таблицу"></div>
    </form>
</body>

</html>