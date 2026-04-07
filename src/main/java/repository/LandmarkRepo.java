package repository;

import model.Landmark;
import Enum.Category;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface LandmarkRepo {

    boolean save(Landmark landmark);
    Optional<Landmark> getLandmarkById(int id);
    boolean update(Landmark landmark);
    boolean delete(int id);
    List<Landmark> getAll();
    List<Landmark> getLandmarkByCategory(Category category);
}
