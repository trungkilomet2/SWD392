package Model;

public class Company {
    private int companyId;
    private String companyName;
    private String city;
    private String district;
    private String commune;
    private String address;
    private String location;
    private String phone;
    private String email;
    private String website;
    private String description;
    private String detail;
    private String companyType;
    private String imageCompany;
    private String logoCompany;
    private int statusCompany;


    public Company() {

    }

    public Company(int companyId, String companyName, String city, String district, String commune, String address, String location, String phone, String email, String website, String description, String detail, String companyType, String imageCompany, String logoCompany, int statusCompany) {
        this.companyId = companyId;
        this.companyName = companyName;
        this.city = city;
        this.district = district;
        this.commune = commune;
        this.address = address;
        this.location = location;
        this.phone = phone;
        this.email = email;
        this.website = website;
        this.description = description;
        this.detail = detail;
        this.companyType = companyType;
        this.imageCompany = imageCompany;
        this.logoCompany = logoCompany;
        this.statusCompany = statusCompany;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    public String getImageCompany() {
        return imageCompany;
    }

    public void setImageCompany(String imageCompany) {
        this.imageCompany = imageCompany;
    }

    public String getLogoCompany() {
        return logoCompany;
    }

    public void setLogoCompany(String logoCompany) {
        this.logoCompany = logoCompany;
    }

    public int getStatusCompany() {
        return statusCompany;
    }

    public void setStatusCompany(int statusCompany) {
        this.statusCompany = statusCompany;
    }
}
