<?php
// Establish database connection
private $server = "mysql:host=localhost;dbname=ecomm";
	private $username = "root";
	private $password = "";
	private $options  = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,);
	protected $conn;
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Insert data into database table
if (isset($_POST['visitor_name']) && isset($_POST['visitor_email']) && isset($_POST['concerned_department']) && isset($_POST['email_title']) && isset($_POST['visitor_message'])) {
    $visitor_name = $_POST['visitor_name'];
    $visitor_email = $_POST['visitor_email'];
    $concerned_department = $_POST['concerned_department'];
    $email_title = $_POST['email_title'];
    $visitor_message = $_POST['visitor_message'];

    $sql = "INSERT INTO contact_messages (visitor_name, visitor_email, concerned_department, email_title, visitor_message) VALUES ('$visitor_name', '$visitor_email', '$concerned_department', '$email_title', '$visitor_message')";
    if (mysqli_query($conn, $sql)) {
        echo "Message sent successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

// Close database connection
mysqli_close($conn);
?>
