package vn.iotstar.service;

import vn.iotstar.entity.User;

public interface UserService {
	User login(String username, String password);

	void register(User user) throws Exception;
}
