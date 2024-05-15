
<?php
require 'PHPMailer/PHPMailerAutoload.php';
if(isset($_POST['email']))
{


$mail = new PHPMailer;


$mail->Host = 'smtp1.example.com;smtp2.example.com';  
$mail->SMTPAuth = true;                               
$mail->Username = 'trivedidarshita30.com';           
$mail->Password = 'bkeujtsnethteahq';                           
$mail->SMTPSecure = 'tls';                           
$mail->Port = 587;                                    

$mail->setFrom('trivedidarshita30.com', 'Darshita');
$mail->addAddress('joe@example.net', 'Verification');    


$mail->addAttachment('/var/tmp/file.tar.gz');         
$mail->addAttachment('/tmp/image.jpg', 'new.jpg');   
$mail->isHTML(true);                                
$mail->Subject = 'Here is the subject';
$mail->Body    = 'This is the HTML message body <b>in bold!</b>';
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if(!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message has been sent';
}
}
?>