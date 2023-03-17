<?php
$uploads_dir = '/uploads';
foreach ($_FILES["upload"]["error"] as $key => $error) {
    if ($error == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["upload"]["tmp_name"][$key];
        // basename() で、ひとまずファイルシステムトラバーサル攻撃は防げるでしょう。
        // ファイル名についてのその他のバリデーションも、適切に行いましょう。
        $name = basename($_FILES["upload"]["name"][$key]);
        move_uploaded_file($tmp_name, "$uploads_dir/$name");
 
        echo json_encode([
            "uploaded" => true,
            "url" => "$uploads_dir/$name"
        ]);
    }
}
?>