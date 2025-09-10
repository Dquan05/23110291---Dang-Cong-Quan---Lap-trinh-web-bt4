<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
	width: 350px;
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

input[type=text], input[type=password] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 15px;
}

button {
	width: 100%;
	padding: 12px;
	background: #007bff;
	border: none;
	color: #fff;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	background: #0056b3;
}

.alert {
	color: red;
	text-align: center;
	margin-bottom: 10px;
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
		<h2>Đăng nhập</h2>

		<c:if test="${not empty alert}">
			<div class="alert">${alert}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/login" method="post">
			<label>Tài khoản</label> <input type="text" name="username"
				value="${param.username}" placeholder="Nhập tài khoản" required />

			<label>Mật khẩu</label> <input type="password" name="password"
				placeholder="Nhập mật khẩu" required /> <label><input
				type="checkbox" name="remember" /> Ghi nhớ</label>

			<button type="submit">Đăng nhập</button>
		</form>

		<p>
			Chưa có tài khoản? <a
				href="${pageContext.request.contextPath}/register">Đăng ký</a>
		</p>
	</div>
</body>
</html>
