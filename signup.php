<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - Car Rental System</title>
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
    </style>
    
</head>
<body>
    <div class="login-container">
        <div class="login-form">
            <h2>Sign Up</h2>
            <form action="register.php" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <button type="submit" class="btn">Register</button>
                <p>Already have an account? <a href="login.php">Login here</a></p>
            </form>
        </div>
    </div>
</body>
</html>
