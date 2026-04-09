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
    @Column(columnDefinition = "TEXT")
    private String description;
    private String imageName;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Embedded
    private Address address;


    public Landmark(){

    }

    public Landmark(int id, String name, Category category, String description, String imageName, Address address) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.address=address;
        this.imageName = imageName;
    }

    public Landmark(String name, Category category, String description, String imageName,Address address) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.address=address;
        this.imageName = imageName;
    }
    public Landmark(int id,String name, Category category, String description, Address address) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.address=address;


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

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
}
