<?php
    $link = mysqli_connect(
        'localhost',
        'root',
        '',
        'vue-test-task'
    );

    if($link !== false) {
        $data = [];
        foreach($_GET as $key=>&$item) {
            $data[$key] = htmlspecialchars($item);
        }
    
        $query = "SELECT * FROM data_ WHERE id={$data['id']} limit 1";
        $res = mysqli_fetch_assoc(mysqli_query($link, $query));
        
        mysqli_close($link);
        die(json_encode(['res' => true, 'posts' => $res]));
    } 

    die();