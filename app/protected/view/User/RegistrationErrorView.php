<html>
<head>
    <title>Registration Errors</title>
    <link rel="stylesheet" type="text/css" href="../../global/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../global/css/main.css">
</head>
<body>
<?php $this->useTemplate('head')?>
    <br><br>
    <h3>Registration Form Errors</h3>
    <table border="1">
        <tr><th>Fields</th><th>Errors</th></tr>
        <?php
            foreach($this->error_field as $field){
                foreach($this->validation_errors[$field] as $val){
                    echo '<tr><td>'.ucwords(str_replace('_',' ',$field)).'</td><td>'.ucfirst($val).'</td></tr>';
                }
            }
        ?>
    </table>
</body>
</html>