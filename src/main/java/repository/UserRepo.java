package repository;

import model.User;
import java.util.Optional;

public interface UserRepo {
    // Returns the generated ID or a boolean for success
    boolean save(User user);

    // Using Optional prevents NullPointerExceptions in your Service logic
    Optional<User> findByEmail(String email);

    void deleteByEmail(String email);

    // Useful for checking if a user exists without loading the whole object
    boolean existsByEmail(String email);
}