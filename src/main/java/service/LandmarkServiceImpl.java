package service;

import model.Landmark;
import Enum.*;
import model.User;
import repository.LandmarkRepo;
import repository.LandmarkRepoImpl;

import java.util.*;

public class LandmarkServiceImpl implements LandmarkService{

    private LandmarkRepo landmarkRepo;

    public LandmarkServiceImpl(LandmarkRepoImpl landmarkRepo) {
        this.landmarkRepo=landmarkRepo;
    }

    @Override
    public Optional<Landmark> registerLandmark(Landmark landmark) {
        boolean success= landmarkRepo.save(landmark);
        if(success){
            return Optional.of(landmark);
        }
        return Optional.empty();
    }

    @Override
    public Optional<Landmark> getLandmarkById(int id) {
        return landmarkRepo.getLandmarkById(id);
    }

    @Override
    public Optional<Landmark> updateLandmark(Landmark landmark) {
        boolean updated= landmarkRepo.update(landmark);
        if(updated) return Optional.of(landmark);
        return Optional.empty();
    }

    @Override
    public boolean deleteLandmark(int id) {
        return landmarkRepo.delete(id);

    }

    @Override
    public List<Landmark> getAllLandmarks() {
        return landmarkRepo.getAll();
    }

    @Override
    public List<Landmark> getLandmarksByCategory(Category category) {
        return landmarkRepo.getLandmarkByCategory(category);
    }

    @Override
    public List<Landmark> getLandmarksByCity(City city) {
        return landmarkRepo.getLandmarkByCity(city);
    }

    @Override
    public List<Landmark> getLandmarksByProvince(Province province) {
        return landmarkRepo.getLandmarkByProvince(province);
    }


}
