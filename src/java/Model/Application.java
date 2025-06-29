package Model;

public class Application {
    private int application;
    private int jobid;
    private int cvid;
    private String submitDate;
    private int status;

    public Application() {
    }

    public Application(int application, int jobid, int cvid, String submitDate, int status) {
        this.application = application;
        this.jobid = jobid;
        this.cvid = cvid;
        this.submitDate = submitDate;
        this.status = status;
    }

    public int getApplication() {
        return application;
    }

    public void setApplication(int application) {
        this.application = application;
    }

    public int getJobid() {
        return jobid;
    }

    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

    public int getCvid() {
        return cvid;
    }

    public void setCvid(int cvid) {
        this.cvid = cvid;
    }

    public String getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(String submitDate) {
        this.submitDate = submitDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
