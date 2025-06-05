package Model;

public class CV {
    
        
    private int cvId;
        private int seekerId;
    private int cvStatus;
    private byte[] cvLink;

    public CV() {
    }

    public CV(int cvId, int seekerId, int cvStatus, byte[] cvLink) {
        this.cvId = cvId;
        this.seekerId = seekerId;
        this.cvStatus = cvStatus;
        this.cvLink = cvLink;
    }

    

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getSeekerId() {
        return seekerId;
    }

    public void setSeekerId(int seekerId) {
        this.seekerId = seekerId;
    }

    public int getCvStatus() {
        return cvStatus;
    }

    public void setCvStatus(int cvStatus) {
        this.cvStatus = cvStatus;
    }

    public byte[] getCvLink() {
        return cvLink;
    }

    public void setCvLink(byte[] cvLink) {
        this.cvLink = cvLink;
    }



}
