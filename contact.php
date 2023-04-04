


<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	     
		  <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Contact page</title>
</head>
<body>
<center>
	<!-- Main content -->
  <form action="contact.php" method="post">
  <div class="elem-group">
    <label for="name">Your Name</label>
    <input type="text" id="name" name="visitor_name" placeholder="Enter Your Name" pattern=[A-Z\sa-z]{3,20} required>
  </div>
  <div class="elem-group">
    <label for="email">Your E-mail</label>
    <input type="email" id="email" name="visitor_email" placeholder="email.@example.com" required>
  </div>
  <div class="elem-group">
    <label for="department-selection">Choose Concerned Department</label>
    <select id="department-selection" name="concerned_department" required>
        <option value="">Select a Department</option>
        <option value="billing">Billing</option>
        <option value="marketing">Marketing</option>
        <option value="technical support">Technical Support</option>
    </select>
  </div>
  <div class="elem-group">
    <label for="title">Reason For Contacting Us</label>
    <input type="text" id="title" name="email_title" required placeholder="Unable to Reset my Password" pattern=[A-Za-z0-9\s]{8,60}>
  </div>
  <div class="elem-group">
    <label for="message">Write your message</label>
    <textarea id="message" name="visitor_message" placeholder="Say whatever you want." required></textarea>
  </div>
  <button type="submit">Send Message</button>
</form>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $visitor_name = test_input($_POST["visitor_name"]);
  $visitor_email = test_input($_POST["visitor_email"]);
  $concerned_department = test_input($_POST["concerned_department"]);
  $email_title = test_input($_POST["email_title"]);
  $visitor_message = test_input($_POST["visitor_message"]);

  // Save the data to the database
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "ecomm";

  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname);

  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  $sql = "INSERT INTO contact_messages (visitor_name, visitor_email, concerned_department, email_title, visitor_message)
  VALUES ('$visitor_name', '$visitor_email', '$concerned_department', '$email_title', '$visitor_message')";

  if ($conn->query($sql) === TRUE) {
    echo "";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  $conn->close();
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>
</center>
<style>
	div.elem-group {
  margin: 20px 20px 20px;;
}

label {
  display: block;
  font-family: 'Aleo';
  padding-bottom: 4px;
  font-size: 1.25em;
}

input, select, textarea {
  border-radius: 2px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  font-size: 1.25em;
  font-family: 'Aleo';
  width: 300px;
  padding: 4px;
}

textarea {
  height: 100px;
}

button {
  height: 40px;
  background: #3c8dbc;
  color: white;
  border: 2px solid darkgreen;
  font-size: 1.25em;
  font-family: 'Aleo';
  border-radius: 2px;
  cursor: pointer;
}

button:hover {
  border: 1px solid black;
}
	</style>

	
	     
	    </div>
	  </div>
  
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>