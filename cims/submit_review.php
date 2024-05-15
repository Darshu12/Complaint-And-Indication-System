<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $name = $_POST["name"];
    $email = $_POST["email"];
    $message = $_POST["message"];
    
    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Invalid email format. Please provide a valid email address.";
        exit;
    }
    
    // Save feedback to a file (you can modify this to save to a database)
    $file = fopen("feedback.txt", "a");
    fwrite($file, "Name: $name\nEmail: $email\nReview: $message\n\n");
    fclose($file);
    
    echo "Thank you for your review!";
} else {
    // Redirect back to the feedback form if accessed directly
    header("Location: index.html");
    exit;
}
?>
