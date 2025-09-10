<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
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

h2 {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
}

th {
	background: #0d6efd;
	color: #fff;
}

img {
	max-height: 60px;
}

a.btn {
	padding: 6px 12px;
	border-radius: 4px;
	color: #fff;
	text-decoration: none;
}

a.edit {
	background: #007bff;
}

a.delete {
	background: #dc3545;
}

a.add {
	background: #28a745;
	padding: 8px 15px;
}

.top-action {
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="sidebar">
		<h2>Menu</h2>
		<a href="${pageContext.request.contextPath}/home">Trang chủ</a> <a
			href="${pageContext.request.contextPath}/category">Quản lý danh
			mục</a> <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
	</div>

	<div class="header">
		<h3>Quản lý danh mục</h3>
		<span>Xin chào, ${sessionScope.user.fullName}</span>
	</div>

	<div class="content">
		<div class="top-action">
			<a class="btn add"
				href="${pageContext.request.contextPath}/category?action=new">+
				Thêm danh mục</a>
		</div>
		<table>
			<tr>
				<th>STT</th>
				<th>Hình ảnh</th>
				<th>Tên danh mục</th>
				<th>Hành động</th>
			</tr>
			<c:forEach var="c" items="${categories}" varStatus="s">
				<tr>
					<td>${s.index + 1}</td>
					<td><c:if test="${not empty c.image}">
							<img src="${pageContext.request.contextPath}/uploads/${c.image}" />
						</c:if></td>
					<td>${c.name}</td>
					<td><a class="btn edit"
						href="${pageContext.request.contextPath}/category?action=edit&id=${c.id}">Sửa</a>
						<a class="btn delete"
						href="${pageContext.request.contextPath}/category?action=delete&id=${c.id}"
						onclick="return confirm('Xóa danh mục này?')">Xóa</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
