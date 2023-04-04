<?php

	include 'includes/session.php';

	if(isset($_POST['signup'])){
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$email = $_POST['email'];
		$password = $_POST['password'];
		$repassword = $_POST['repassword'];

		$_SESSION['firstname'] = $firstname;
		$_SESSION['lastname'] = $lastname;
		$_SESSION['email'] = $email;

	

		if($password != $repassword){
			$_SESSION['error'] = 'Passwords did not match';
			header('location: signup.php');
		}
		else{
			$conn = $pdo->open();

			$stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM users WHERE email=:email");
			$stmt->execute(['email'=>$email]);
			$row = $stmt->fetch();
			if($row['numrows'] > 0){
				$_SESSION['error'] = 'Email already taken';
				header('location: signup.php');
			}
			else{
				$now = date('Y-m-d');
				$password = password_hash($password, PASSWORD_DEFAULT);


				// try{
				// 	$stmt = $conn->prepare("INSERT INTO users (email, password, firstname, lastname, activate_code, created_on) VALUES (:email, :password, :firstname, :lastname, :code, :now)");
					
				
		    		

				//         unset($_SESSION['firstname']);
				//         unset($_SESSION['lastname']);
				//         unset($_SESSION['email']);

				//         $_SESSION['success'] = 'Account created. Check your email to activate.';
				//         header('location: signup.php');

				//     } 
				//     catch (Exception $e) {
				//         $_SESSION['error'] = 'Message could not be sent. Mailer Error: ';
				//         header('location: signup.php');
				//     }

                   
				try {
					$stmt = $conn->prepare("INSERT INTO users (email, password, firstname, lastname, activate_code, created_on) VALUES (:email, :password, :firstname, :lastname, :code, :now)");
					
					// bind parameters
					$stmt->bindParam(':email', $email);
					$stmt->bindParam(':password', $password);
					$stmt->bindParam(':firstname', $firstname);
					$stmt->bindParam(':lastname', $lastname);
					$stmt->bindParam(':code', $code);
					$stmt->bindParam(':now', $now);
				
					// generate activation code
					$code = md5(uniqid(rand()));
				
					// execute the statement
					if ($stmt->execute()) {
						// send activation email
						$to = $email;
						$subject = 'Activate Your Account';
						$message = 'Dear ' . $firstname . ',\r\n\r\n';
						$message .= 'Thank you for signing up for our website. Please click the link below to activate your account:\r\n\r\n';
						$message .= 'http://www.example.com/activate.php?code=' . $code . '\r\n\r\n';
						$message .= 'If you did not sign up for our website, please ignore this message.\r\n\r\n';
						$message .= 'Thank you,\r\n';
						$message .= 'The Example Team';
						$headers = 'From: webmaster@example.com' . "\r\n" .
							'Reply-To: webmaster@example.com' . "\r\n" .
							'X-Mailer: PHP/' . phpversion();
						mail($to, $subject, $message, $headers);
				
						// unset session variables and redirect to signup page
						unset($_SESSION['firstname']);
						unset($_SESSION['lastname']);
						unset($_SESSION['email']);
				
						$_SESSION['success'] = 'Account created. Check your email to activate.';
						header('location: signup.php');
					} else {
						$_SESSION['error'] = 'Failed to create account';
						header('location: signup.php');
					}
				} catch (Exception $e) {
					$_SESSION['error'] = 'Message could not be sent. Mailer Error: ' . $e->getMessage();
					header('location: signup.php');
				}
				

				}
				catch(PDOException $e){
					$_SESSION['error'] = $e->getMessage();
					header('location: register.php');
				}

				$pdo->close();

			}

		}

	}
	else{
		$_SESSION['error'] = 'Fill up signup form first';
		header('location: signup.php');
	}

?>