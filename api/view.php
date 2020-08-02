<?php
    $link = mysqli_connect(
        'localhost',
        'root',
        '',
        'vue-test-task'
    );

    if($link !== false) {
        $query = "SELECT id, title, description, creation_date, type FROM data_";
        $resDb = mysqli_query($link, $query);
        $res = [];

        while($item = mysqli_fetch_assoc($resDb)) {
            $res[] = $item;
        }

        mysqli_close($link);
        die(json_encode(['res' => true, 'data_' => $res]));
    } 

    die();