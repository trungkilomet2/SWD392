/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Lawliez57
 */

// Quan ly job
public class Job {

    private int jobId;
    private int recruiterId;
    private int categoryId;
    private String jobTittle;
    private String jobDescription;
    private String requirements;
    private String location;
    private String position;
    private String experience;
    private String skills;
    private String gender;
    private String profession;
    private String jobType;
    private int numberOfSeeker;
    private String salary;
    private String workingTime;
    private String createDate;
    private String endDate;
    private int status;
    
    public Job() {
        
    }

    public Job(int jobId, int recruiterId, int categoryId, String jobTittle, String jobDescription, String requirements, String location, String position, String experience, String skills, String gender, String profession, String jobType, int numberOfSeeker, String salary, String workingTime, String createDate, String endDate, int status) {
        this.jobId = jobId;
        this.recruiterId = recruiterId;
        this.categoryId = categoryId;
        this.jobTittle = jobTittle;
        this.jobDescription = jobDescription;
        this.requirements = requirements;
        this.location = location;
        this.position = position;
        this.experience = experience;
        this.skills = skills;
        this.gender = gender;
        this.profession = profession;
        this.jobType = jobType;
        this.numberOfSeeker = numberOfSeeker;
        this.salary = salary;
        this.workingTime = workingTime;
        this.createDate = createDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getRecruiterId() {
        return recruiterId;
    }

    public void setRecruiterId(int recruiterId) {
        this.recruiterId = recruiterId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getJobTittle() {
        return jobTittle;
    }

    public void setJobTittle(String jobTittle) {
        this.jobTittle = jobTittle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public int getNumberOfSeeker() {
        return numberOfSeeker;
    }

    public void setNumberOfSeeker(int numberOfSeeker) {
        this.numberOfSeeker = numberOfSeeker;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getWorkingTime() {
        return workingTime;
    }

    public void setWorkingTime(String workingTime) {
        this.workingTime = workingTime;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    

}
