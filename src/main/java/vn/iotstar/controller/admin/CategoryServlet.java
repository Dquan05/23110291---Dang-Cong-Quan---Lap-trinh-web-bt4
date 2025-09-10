package vn.iotstar.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = { "/category", "/admin/categories" })
@MultipartConfig
public class CategoryServlet extends HttpServlet {
	private final CategoryService service = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action == null || action.equals("list")) {
			// hiển thị danh sách
			List<Category> list = service.findAll();
			req.setAttribute("items", list);
			req.getRequestDispatcher("/WEB-INF/views/category-list.jsp").forward(req, resp);

		} else if (action.equals("create")) {
			// thêm mới → cat = null
			req.setAttribute("cat", null);
			req.getRequestDispatcher("/WEB-INF/views/category-form.jsp").forward(req, resp);

		} else if (action.equals("edit")) {
			// sửa → cat = Category tìm theo id
			int id = Integer.parseInt(req.getParameter("id"));
			Category c = service.findById(id);
			req.setAttribute("cat", c);
			req.getRequestDispatcher("/WEB-INF/views/category-form.jsp").forward(req, resp);

		} else if (action.equals("delete")) {
			// xóa
			int id = Integer.parseInt(req.getParameter("id"));
			service.delete(id);
			resp.sendRedirect(req.getContextPath() + "/category");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String idStr = req.getParameter("id");
		String name = req.getParameter("name");

		// xử lý upload ảnh
		Part part = req.getPart("image");
		String fileName = null;
		if (part != null && part.getSize() > 0) {
			fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
			String appPath = req.getServletContext().getRealPath("");
			File uploadDir = new File(appPath, "uploads");
			if (!uploadDir.exists())
				uploadDir.mkdirs();
			File dest = new File(uploadDir, fileName);
			try {
				Files.copy(part.getInputStream(), dest.toPath());
			} finally {
				part.delete();
			}
		}

		if (idStr == null || idStr.isBlank()) {
			// create
			Category c = new Category();
			c.setName(name);
			if (fileName != null) {
				c.setImage(fileName);
			}
			service.create(c);
		} else {
			// update
			int id = Integer.parseInt(idStr);
			Category c = service.findById(id);
			if (c != null) {
				c.setName(name);
				if (fileName != null) {
					c.setImage(fileName);
				}
				service.update(c);
			}
		}

		// sau khi thêm/sửa thì quay lại danh sách
		resp.sendRedirect(req.getContextPath() + "/category");
	}
}
