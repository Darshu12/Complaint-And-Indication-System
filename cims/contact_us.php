<?php
define('DB_SERVER', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'cmspro');
$con = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_POST['submit'])) {
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    // Use prepared statements to prevent SQL injection
    $stmt = mysqli_prepare($con, "INSERT INTO contactdata (firstname, lastname, phone, email, message) VALUES (?, ?, ?, ?, ?)");

    mysqli_stmt_bind_param($stmt, 'sssss', $firstname, $lastname, $phone, $email, $message);

    if (mysqli_stmt_execute($stmt)) {
        echo "Thank You For Contacting Us";
    } else {
        echo "Error: Couldn't enter data. " . mysqli_error($con);
    }

    mysqli_stmt_close($stmt);
    mysqli_close($con);
}
?>
