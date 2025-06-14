<?PHP
include 'func_db.php';

$clients = getClients();
$clientsRow = getClientsRow(4);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Клиенты</title>
</head>

<body style="margin:10px;">
    <a href="addClientPage.php">Добавить клиента</a>
    <h1>Клиенты</h1>
    <table class="table">
        <th>ID</th>
        <th>ФИО</th>
        <th>Номер и серия паспорта</th>
        <th>Дата выдачи паспорта</th>
        <th>Наличие визы</th>
        <th>Срок истечения</th>
        <th>Категория</th>
        <?php foreach ($clients as $row) {
            echo "<tr>";
            foreach ($row as $key => $val) {
                if ($key == 'IDcategory') {
                    $category = getClientCategory($val)[0]['categoryName'];
                    echo "<td>$category</td>";
                } else
                    echo "<td>$val</td>";
            }
            $IDClient = $row['IDclient'];
            echo "<td><a href=\"deleteClient.php?id=$IDClient\">Удалить</a></td>";
            echo "</tr>";
        }

        ?>
    </table class="table">
    <hr>
    <hr>
    <hr>
    <h2>Клиент</h2>
    <table>
        <th>ID</th>
        <th>ФИО</th>
        <th>Номер и серия паспорта</th>
        <th>Дата выдачи паспорта</th>
        <th>Наличие визы</th>
        <th>Срок истечения</th>
        <th>Категория</th>
        <?php foreach ($clientsRow as $row) {
            echo "<tr>";
            foreach ($row as $key => $val) {
                if ($key == 'IDcategory') {
                    $category = getClientCategory($val)[0]['categoryName'];
                    echo "<td>$category</td>";
                } else
                    echo "<td>$val</td>";
            }
            echo "</td>";
        } ?>
    </table>
</body>

</html>