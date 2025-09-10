package vn.iotstar.service;

import java.util.List;
import vn.iotstar.entity.Category;

public interface CategoryService {
	List<Category> findAll();

	Category findById(int id);

	void create(Category c);

	void update(Category c);

	void delete(int id);
}
