/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lawliez57
 */
public class JobSeeker {

    private int seekerid;
    private int userid;
    private String skills ;
    private String industry;
    private String experience;
    private String position;
    private String profession;
    private String location;
    private String salary;

    public JobSeeker() {
        
    }

    public JobSeeker(int seekerid, int userid, String skills, String industry, String experience, String position, String profession, String location, String salary) {
        this.seekerid = seekerid;
        this.userid = userid;
        this.skills = skills;
        this.industry = industry;
        this.experience = experience;
        this.position = position;
        this.profession = profession;
        this.location = location;
        this.salary = salary;
    }

    public int getSeekerid() {
        return seekerid;
    }

    public void setSeekerid(int seekerid) {
        this.seekerid = seekerid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    
    
    
    
}
