<!DOCTYPE html>
<html>
<head>
    <title>Login - Car Rental System</title>
    <!-- <link rel="stylesheet" href="path/to/your/styles.css"> -->

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #301e8b, #6c5b7b);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
           
        }


         header {
            color: #fff;
            text-align: center;
            padding: 10px;
            border-bottom: 4px solid #ffcc00;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        @keyframes twinkling {
            0%, 100% {
                background: linear-gradient(to bottom, #800080, #800080);
            }
            50% {
                background: linear-gradient(to bottom, #800080, #800080);
            }
        }

        .title {
            color: #FF8C00; /* Adjust the title color as needed */
            font-size: 36px; /* Adjust the font size as needed */
            text-align: center;
            margin-top: 20px; /* Add space at the top */
        }

        .navigation {
            display: flex;
            justify-content: center;
            margin-top: 20px; /* Add space below the title */
        }

        .navigation a {
            text-decoration: none;
            color: #b957f2; /* Adjust the link color as needed */
            font-weight: bold; /* Make the links bold */
            margin: 0 10px; /* Add space between the buttons */
        }

        .login-container {
            background-color: rgba(0, 0, 0, 0.7);
            border: 2px solid #000;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            padding: 20px;
            text-align: center;
            margin-top: 100px;
        }

        .login-form {
            max-width: 400px;
            margin: 0 auto;
        }

        h2 {
            color: #fff;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #fff;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #333;
            border-radius: 3px;
        }

        .btn {
            background-color: #b957f2;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.1s;
        }

        .btn:hover {
            background-color: #FF8C00;
        }

        .login-container:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.7);
        }


        /* Arrow button styling */
        .arrow-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }
        
        /* Add hover effect */
        .arrow-button:hover {
            background-color: #45a049;
        }
        
        /* Arrow icon styling */
        .arrow-button::after {
            content: "➔"; /* Unicode for right arrow */
            margin-left: 8px;
        }
    </style>




</head>
<body>

    <div class="login-container">
        <div class="login-form">
        <a href="index.php" class="arrow-button">Home </a>
            <h2>Login</h2>
            <form action="authenticate.php" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <!-- Error message display -->
                <?php if (isset($_GET['error'])): ?>
                    <p style="color: red;"><?php echo htmlspecialchars($_GET['error']); ?></p>
                <?php endif; ?>

                <button type="submit" class="btn">Login</button>
                <p>Don't have an account? <a href="signup.php">Sign up here</a></p>
            </form>
        </div>
    </div>
</body>
</html>



