package service;

import model.User;
import java.util.Optional;

public interface UserService {

    Optional<User> register(String firstName, String lastName, String email, String rawPassword);

    Optional<User> login(String email, String rawPassword);

    void logout();

    boolean deleteAccount(String email);
}