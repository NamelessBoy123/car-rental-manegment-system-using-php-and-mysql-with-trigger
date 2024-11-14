<?php
session_start();
include 'connect.php'; // Ensure you have a PDO connection in connect.php

// Initialize error message
$error = "";

// Retrieve form data
$username = $_POST['username'];
$password = $_POST['password'];

// Prepare and execute SQL query
$sql = "SELECT * FROM users WHERE username = :username";
$stmt = $con->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->execute();

// Check if user exists
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user) {
    // Verify password
    if (password_verify($password, $user['password'])) {
        $_SESSION['username'] = $user['username'];
        header("Location: index.php"); // Redirect to the homepage or dashboard
        exit();
    } else {
        $error = "Invalid password.";
    }
} else {
    $error = "No user found with that username.";
}

// Close the PDO connection by setting it to null
$con = null;


if (!empty($error)) {
    header("Location: login.php?error=" . urlencode($error));
    exit();
}

?>

