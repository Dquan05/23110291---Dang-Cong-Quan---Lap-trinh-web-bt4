<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f4f6f8;
}

.sidebar {
	width: 220px;
	height: 100vh;
	background: #0d6efd;
	color: #fff;
	position: fixed;
	top: 0;
	left: 0;
	padding-top: 20px;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	padding: 12px 20px;
	color: #fff;
	text-decoration: none;
}

.sidebar a:hover {
	background: #084298;
}

.header {
	margin-left: 220px;
	background: #fff;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.content {
	margin-left: 220px;
	padding: 20px;
}
</style>
</head>
<body>
	<div class="sidebar">
		<h2>Xin chào</h2>
		<p style="text-align: center; font-weight: bold;">${sessionScope.user.fullName}</p>
		<a href="${pageContext.request.contextPath}/home">Trang chủ</a> <a
			href="${pageContext.request.contextPath}/category">Quản lý danh
			mục</a> <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
	</div>

	<div class="header">
		<h3>Dashboard</h3>
		<span>Xin chào, ${sessionScope.user.fullName}</span>
	</div>

	<div class="content">
		<h2>Chào mừng bạn đến hệ thống quản lý!</h2>
		<p>Chọn chức năng từ menu bên trái để bắt đầu.</p>
	</div>
</body>
</html>
