<?php
    $link = mysqli_connect(
        'localhost',
        'root',
        '',
        'vue-test-task'
    );

    if($link !== false) {
        $query = "DELETE FROM data_ WHERE id=".htmlspecialchars($_GET['id'])." LIMIT 1;";
        $res = mysqli_query($link, $query);

        mysqli_close($link);
        die(json_encode(['res' => $res]));
    } 

    die();