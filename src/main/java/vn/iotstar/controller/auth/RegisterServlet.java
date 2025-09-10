package vn.iotstar.controller.auth;

import java.io.IOException;

import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private final UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = new User();
		u.setUserName(req.getParameter("username"));
		u.setPassWord(req.getParameter("password"));
		u.setEmail(req.getParameter("email"));
		u.setFullName(req.getParameter("fullname"));
		u.setPhone(req.getParameter("phone"));
		u.setRoleid(1); // hoặc 2, tùy bạn

		try {
			userService.register(u);
			resp.sendRedirect(req.getContextPath() + "/login");
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
		}
	}
}
