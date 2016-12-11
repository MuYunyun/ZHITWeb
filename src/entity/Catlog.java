package entity;

public class Catlog {
       private int catlogId;
       private String caption;
       private int parentId;
       private String catURL;
       private String cntURL;
       public Catlog(){
    	   super();
       }
	public int getCatlogId() {
		return catlogId;
	}
	public void setCatlogId(int catlogId) {
		this.catlogId = catlogId;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getCatURL() {
		return catURL;
	}
	public void setCatURL(String catURL) {
		this.catURL = catURL;
	}
	public String getCntURL() {
		return cntURL;
	}
	public void setCntURL(String cntURL) {
		this.cntURL = cntURL;
	}
}
