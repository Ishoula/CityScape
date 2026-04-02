package repository;

import model.User;

public interface UserRepo {

    public void save(User user);
    public User findUser(User user);
    public void deleteUser(User user);
}
