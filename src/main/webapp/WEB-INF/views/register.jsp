<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f8;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background: #fff;
	padding: 40px 30px;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
	width: 400px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

label {
	display: block;
	margin: 10px 0 5px;
	color: #555;
}

input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 15px;
}

button {
	width: 100%;
	padding: 12px;
	background: #28a745;
	border: none;
	color: #fff;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	background: #1e7e34;
}

p {
	text-align: center;
	margin-top: 15px;
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Đăng ký tài khoản</h2>
		<form method="post"
			action="${pageContext.request.contextPath}/register">
			<label>Username</label> <input name="username" required /> <label>Password</label>
			<input type="password" name="password" required /> <label>Họ
				tên</label> <input name="fullname" /> <label>Email</label> <input
				type="email" name="email" /> <label>Số điện thoại</label> <input
				name="phone" />

			<button type="submit">Đăng ký</button>
		</form>
		<p>
			Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng
				nhập</a>
		</p>
	</div>
</body>