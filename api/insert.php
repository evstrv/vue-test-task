<?php
    $link = mysqli_connect(
        'localhost',
        'root',
        '',
        'vue-test-task'
    );

    if($link !== false) {
        $data = json_decode(file_get_contents('php://input'), true);

        foreach($data as &$item) {
            $item = htmlspecialchars($item);
        }

        $query = "INSERT INTO data_(" . implode(',', array_keys($data)) . ") VALUES('" . implode("','", array_values($data)) . "')";
        $res = mysqli_query($link, $query);

        mysqli_close($link);
        die(json_encode(['res' => $res]));
    } 

    die();