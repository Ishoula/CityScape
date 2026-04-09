package service;

import model.Landmark;
import Enum.*;
import java.util.*;

public interface LandmarkService {
    Optional<Landmark> registerLandmark(Landmark landmark);
    Optional<Landmark> getLandmarkById(int id);
    Optional<Landmark> updateLandmark(Landmark landmark);
    boolean deleteLandmark(int id);
    List<Landmark> getAllLandmarks();
    List<Landmark> getLandmarksByCategory(Category category);
    List<Landmark> getLandmarksByCity(City city);
    List<Landmark> getLandmarksByProvince(Province province);
}
