package vn.iotstar.service.impl;

import vn.iotstar.dao.UserDAO;
import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;

public class UserServiceImpl implements UserService {
	private final UserDAO userDAO = new UserDAO();

	@Override
	public User login(String username, String password) {
		User u = userDAO.findByUserName(username);
		if (u != null && u.getPassWord().equals(password)) {
			return u;
		}
		return null;
	}

	@Override
	public void register(User user) throws Exception {
		if (userDAO.findByUserName(user.getUserName()) != null) {
			throw new Exception("Username đã tồn tại");
		}
		userDAO.insert(user);
	}
}
