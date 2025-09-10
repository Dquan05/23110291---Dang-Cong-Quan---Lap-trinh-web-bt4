package vn.iotstar.controller.auth;

import java.io.IOException;
import java.util.Arrays;

import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private final UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// đọc cookie nếu có
		String savedUser = "";
		String savedPass = "";
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			savedUser = Arrays.stream(cookies).filter(c -> "username".equals(c.getName())).map(Cookie::getValue)
					.findFirst().orElse("");
			savedPass = Arrays.stream(cookies).filter(c -> "password".equals(c.getName())).map(Cookie::getValue)
					.findFirst().orElse("");
		}
		req.setAttribute("savedUser", savedUser);
		req.setAttribute("savedPass", savedPass);
		req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember");

		User u = userService.login(username, password);
		if (u == null) {
			req.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
			req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
			return;
		}

		req.getSession().setAttribute("user", u);

		// remember me
		if ("on".equals(remember)) {
			Cookie c1 = new Cookie("username", username);
			Cookie c2 = new Cookie("password", password);
			int age = 7 * 24 * 60 * 60;
			c1.setMaxAge(age);
			c2.setMaxAge(age);
			resp.addCookie(c1);
			resp.addCookie(c2);
		}
		resp.sendRedirect(req.getContextPath() + "/home");
	}
}
