package model;
import Enum.Category;
import jakarta.persistence.*;

@Entity
@Table(name="landmarks")
public class Landmark {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private String name;
    private Category category;
    private String description;
    private String latitude;
    private String longitude;
    private String imagePath;

    public Landmark(){

    }

    public Landmark(int id, String name, Category category, String description, String latitude, String longitude, String imagePath) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.latitude = latitude;
        this.longitude = longitude;
        this.imagePath = imagePath;
    }

    public Landmark(String name, Category category, String description, String latitude, String longitude, String imagePath) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.latitude = latitude;
        this.longitude = longitude;
        this.imagePath = imagePath;
    }
    public Landmark(int id,String name, Category category, String description, String latitude, String longitude) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.latitude = latitude;
        this.longitude = longitude;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
