package vn.iotstar.service.impl;

import java.util.List;

import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	private final CategoryDAO dao = new CategoryDAO();

	@Override
	public List<Category> findAll() {
		return dao.findAll();
	}

	@Override
	public Category findById(int id) {
		return dao.findById(id);
	}

	@Override
	public void create(Category c) {
		dao.insert(c);
	}

	@Override
	public void update(Category c) {
		dao.update(c);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}
}
