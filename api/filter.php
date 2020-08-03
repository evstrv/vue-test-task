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

        if($data['filter'] === '') {
            $query = "SELECT id, title, description, creation_date, type FROM data_";
            $resDb = mysqli_query($link, $query);
            $res = [];
        } else {
            $query = "SELECT id, title, description, creation_date, type FROM data_ where type like \"%{$data['filter']}%\"";
            $resDb = mysqli_query($link, $query);
            $res = [];
        }

        while($item = mysqli_fetch_assoc($resDb)) {
            $res[] = $item;
        }

        mysqli_close($link);
        die(json_encode(['res' => true, 'posts' => $res]));
    } 

    die();