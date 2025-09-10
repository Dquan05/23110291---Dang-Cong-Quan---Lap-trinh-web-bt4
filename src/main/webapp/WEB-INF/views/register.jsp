<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
		<h2>Đăng ký tài khoản</h2>

		<c:if test="${not empty alert}">
			<div class="alert">
				<c:out value="${alert}" />
			</div>
		</c:if>

		<form method="post"
			action="${pageContext.request.contextPath}/register">
			<label>Username</label> <input type="text" name="username"
				value="<c:out value='${param.username}'/>" required /> <label>Password</label>
			<input type="password" name="password" required /> <label>Họ
				tên</label> <input type="text" name="fullname"
				value="<c:out value='${param.fullname}'/>" /> <label>Email</label>
			<input type="email" name="email"
				value="<c:out value='${param.email}'/>" /> <label>Số điện
				thoại</label> <input type="text" name="phone"
				value="<c:out value='${param.phone}'/>" />

			<button type="submit">Đăng ký</button>
		</form>

		<p>
			Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng
				nhập</a>
		</p>
	</div>
</body>
</html>
