<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${empty cat ? 'Thêm' : 'Sửa'}danh mục</title>
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

form {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	max-width: 500px;
}

label {
	display: block;
	margin: 10px 0 5px;
}

input[type=text], input[type=file] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 15px;
}

button {
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	color: #fff;
	background: #007bff;
	cursor: pointer;
	margin-right: 10px;
}

button:hover {
	background: #0056b3;
}

a.cancel {
	font-size: 14px;
	color: #555;
	text-decoration: none;
}

img {
	max-height: 100px;
	margin-top: 10px;
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
		<h3>${empty cat ? 'Thêm' : 'Sửa'}danh mục</h3>
		<span>Xin chào, ${sessionScope.user.fullName}</span>
	</div>

	<div class="content">
		<form method="post"
			action="${pageContext.request.contextPath}/category"
			enctype="multipart/form-data">

			<input type="hidden" name="id" value="<c:out value='${cat.id}'/>" />

			<label>Tên danh mục</label> <input type="text" name="name"
				value="<c:out value='${cat.name}'/>" required /> <label>Ảnh
				đại diện</label> <input type="file" name="image" />

			<c:choose>
				<c:when test="${not empty cat.image}">
					<img src="${pageContext.request.contextPath}/uploads/${cat.image}"
						alt="Ảnh danh mục" />
				</c:when>
				<c:otherwise>
					<p style="color: #888; font-size: 13px;">Chưa có ảnh</p>
				</c:otherwise>
			</c:choose>

			<button type="submit">${empty cat ? 'Thêm' : 'Cập nhật'}</button>
			<a class="cancel" href="${pageContext.request.contextPath}/category">Quay
				lại</a>
		</form>
	</div>
</body>
</html>
