<!doctype html>
<html>
<head>
    <title>
        Blog System
    </title>
    <link rel="stylesheet" type="text/css" href="../../global/css/bootstrap.css">
</head>
<body>
<a href="#">Home</a>
<a href="#">Login</a>
<a href="#">Register</a>

    <?php
    foreach($this->blogs as $blog){
    ?>
    <tr><td><table border="1" style="width: 500px;">
                <tr><td>Title :</td><td><?php echo $blog['title'];?></td></tr>
                <tr><td>Description:</td><td><?php echo html_entity_decode($blog['description']);?></td></tr>
                <tr><td colspan=2 align='center'>Comments:
                        <table border="1" style="width: 500px;">
                            <?php foreach($this->comments as $comment){?>
                            <tr><td><?php echo $comment['comment']?></td><td>is Approved:<?php echo $comment['isApprove']?></td></tr>
                            <?php } ?>
                            <tr><td><form action="/Comment/add" method="post">
                                        <input type="text" name='comment'>
                                        <input type='hidden' name='blog_id' value='<?php echo $blog['id'];?>'>
                                        <input type="submit" name="submit" value="comment">
                                    </form></td></tr>
                        </table>
                </td></tr>
            </table>
            <?php

            }
            ?>
        </td></tr>

</body>
</html>