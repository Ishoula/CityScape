package service;

import model.User;
import org.mindrot.jbcrypt.BCrypt;
import repository.UserRepo;
import repository.UserRepoImpl;

import java.util.Optional;

public class UserServiceImpl implements UserService{

    private UserRepo userRepo;
    private User currentUser;

    public UserServiceImpl(UserRepoImpl userRepo) {
        this.userRepo=userRepo;
    }

    @Override
    public Optional<User> register(String firstName, String lastName, String email, String rawPassword) {
        String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
        User newUser = new User(firstName, lastName, email, hashedPassword);

        boolean success = userRepo.save(newUser);
        if (success) {
            return Optional.of(newUser);
        }
        return Optional.empty();
    }

    @Override
    public Optional<User> login(String email, String rawPassword) {
      Optional<User> userOptional = userRepo.findByEmail(email);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            this.currentUser=user;
            if (BCrypt.checkpw(rawPassword, user.getPassword())) {
                return userOptional;
            }
        }
        return Optional.empty();

    }

    @Override
    public void logout() {
        this.currentUser=null;
    }

    @Override
    public boolean deleteAccount(String email) {
        Optional<User> userOptional=userRepo.findByEmail(email);
        if(userOptional.isPresent()){
            User user=userOptional.get();
            userRepo.deleteByEmail(email);
            return true;
        }
        return false;
    }
}
