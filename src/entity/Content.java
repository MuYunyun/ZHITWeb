package entity;
public class Content {
       private int contentId;
       private Catlog catlog;
       private String caption;
       private String createDate;
       private int times;
       private User authorId;
       private String source;
       private String text;
       private String pic;
       private String refPic;
       private int hot;
       public Content(){
    	   super();
       }
	
    public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public Catlog getCatlog() {
		return catlog;
	}
	public void setCatlog(Catlog catlog) {
		this.catlog = catlog;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
		public User getAuthorId() {
		return authorId;
	}
	public void setAuthorId(User authorId) {
		this.authorId = authorId;
	}
    public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getRefPic() {
		return refPic;
	}
	public void setRefPic(String refPic) {
		this.refPic = refPic;
	}

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}
      
}
