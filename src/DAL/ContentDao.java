package DAL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

import net.sf.json.JSONArray;
import entity.Catlog;
import entity.Content;
import entity.User;
public class ContentDao {
	 private Connection conn;
     private PreparedStatement pstm;
     private ResultSet rs;
     SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
/*     Date date = new Date();
     String f = d.format(date);*/
     /*Date f = d.parse(dd);*/
     /*SimpleDateFormat ff=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/

     public int insertContent(Content content){
    	 int i=0;
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "insert into T_Content(CatlogId,Caption,CreateDate,Times,AuthorId,Source,Text,Pic,RefPic,Hot)values(?,?,getdate(),0,?,?,?,?,?,?)";
    		         pstm = conn.prepareStatement(sql);
    		         pstm.setInt(1, content.getCatlog().getCatlogId());
    		         pstm.setString(2, content.getCaption());
    		         pstm.setInt(3, content.getAuthorId().getUserId());
    		         pstm.setString(4, content.getSource());
    		         pstm.setString(5, content.getText());
    		         pstm.setString(6, content.getPic());
    		         pstm.setString(7, content.getRefPic());
    		         pstm.setInt(8, content.getHot());
    		         i=pstm.executeUpdate();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     
     
     public int deleteContent(int contentId){
    	 int i=0;
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "delete from T_Content where ContentId=?";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, contentId);
    		 i = pstm.executeUpdate();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
       
     public int updateContent(Content content){
    	 int i = 0;
    	 try{
    		 conn = DBConn.getCon();
    		String sql = "update T_Content set Caption=?,CreateDate=getdate()," +
    				"Source=?,Pic=?,RefPic=?,Text=?,Hot=? where ContentId=?";
    		        pstm = conn.prepareStatement(sql);
 			        pstm.setString(1, content.getCaption());
 			        pstm.setString(2, content.getSource());
 			        pstm.setString(3, content.getPic());
 			        pstm.setString(4, content.getRefPic());
 			        pstm.setString(5, content.getText());
 			        pstm.setInt(6, content.getHot());
 			        pstm.setInt(7, content.getContentId());
 			        i=pstm.executeUpdate();
    	 }catch(Exception e){
    		e.printStackTrace(); 
    	 }finally{
    		     DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     
     //阅读次数
     public int updateTimes(Content content){
    	 int i = 0;
    	 try{
    		 conn = DBConn.getCon();
    		String sql = "update T_Content set Times=(select Times from T_Content where ContentId=?)+1 where ContentId=?";
    		        pstm = conn.prepareStatement(sql);
 			        pstm.setInt(1, content.getContentId());
 			        pstm.setInt(2, content.getContentId());
 			        i=pstm.executeUpdate();
    	 }catch(Exception e){
    		e.printStackTrace(); 
    	 }finally{
    		     DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     

     //通知文件
     public List selectIndexById(int indexId){
    	 List<Content>list=new ArrayList<Content>();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_Content,T_User where T_Content.AuthorId = T_User.UserId and CatlogId=? order by CreateDate desc";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, indexId);
    		 rs = pstm.executeQuery();
    		 SimpleDateFormat ff=new SimpleDateFormat("yyyy年MM月dd日 hh时mm分");
    		 while(rs.next()){
    			Content content = new Content();
    			content.setContentId(rs.getInt("ContentId"));
 	    		content.setCaption(rs.getString("Caption"));
 	    		content.setCreateDate(f.format(rs.getTimestamp("CreateDate")));
 	    		content.setTimes(rs.getInt("Times"));
 	    		content.setSource(rs.getString("Source"));
 	    		content.setText(rs.getString("Text"));
 	    		content.setPic(rs.getString("Pic"));
 	    		content.setRefPic(rs.getString("RefPic"));
 	    		content.setHot(rs.getInt("Hot"));
 	    	    User user = new User();
 	    	    user.setUserId(rs.getInt("UserId"));
 	    	    content.setAuthorId(user);
 	    	    Catlog catlog = new Catlog();                //CntURL待开发
 	    	    catlog.setCatlogId(rs.getInt("CatlogId"));
 	    	    content.setCatlog(catlog);
 	    		list.add(content);
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return list;
     }
     
     //管理端时间
     public List selecttimeById(int indexId){
    	 List<Content>list=new ArrayList<Content>();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_Content,T_User where T_Content.AuthorId = T_User.UserId and CatlogId=? order by CreateDate desc";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, indexId);
    		 rs = pstm.executeQuery();
    		 SimpleDateFormat ff=new SimpleDateFormat("yyyy年MM月dd日");
    		 while(rs.next()){
    			Content content = new Content();
    			content.setContentId(rs.getInt("ContentId"));
 	    		content.setCaption(rs.getString("Caption"));
 	    		content.setCreateDate(ff.format(rs.getTimestamp("CreateDate")));
 	    		content.setTimes(rs.getInt("Times"));
 	    		content.setSource(rs.getString("Source"));
 	    		content.setText(rs.getString("Text"));
 	    		content.setPic(rs.getString("Pic"));
 	    		content.setRefPic(rs.getString("RefPic"));
 	    		content.setHot(rs.getInt("Hot"));
 	    	    User user = new User();
 	    	    user.setUserId(rs.getInt("UserId"));
 	    	    content.setAuthorId(user);
 	    		list.add(content);
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return list;
     }
     
     
     //管理员权限
     public List selectById(int indexId,int userId){
    	 List<Content>list=new ArrayList<Content>();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_Content,T_User where T_Content.AuthorId = T_User.UserId and CatlogId=? and UserId=? order by CreateDate desc";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, indexId);
    		 pstm.setInt(2, userId);
    		 rs = pstm.executeQuery();
    		 SimpleDateFormat ff=new SimpleDateFormat("yyyy年MM月dd日");
    		 while(rs.next()){
    			Content content = new Content();
    			content.setContentId(rs.getInt("ContentId"));
 	    		content.setCaption(rs.getString("Caption"));
 	    		content.setCreateDate(ff.format(rs.getTimestamp("CreateDate")));
 	    		content.setTimes(rs.getInt("Times"));
 	    		content.setSource(rs.getString("Source"));
 	    		content.setText(rs.getString("Text"));
 	    		content.setPic(rs.getString("Pic"));
 	    		content.setRefPic(rs.getString("RefPic"));
 	    		content.setHot(rs.getInt("Hot"));
 	    	    User user = new User();
 	    	    user.setUserId(rs.getInt("UserId"));
 	    	    content.setAuthorId(user);
 	    		list.add(content);
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return list;
     }

     
     
   //内容
     public Content selectContentById(int contentId){
    	 Content content = new Content();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_Content,T_User where T_Content.AuthorId = T_User.UserId  " +
    		 		"and ContentId = ?";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, contentId);
    		 rs = pstm.executeQuery();
    		 SimpleDateFormat ff=new SimpleDateFormat("yyyy年MM月dd日 hh时mm分");
    		 while(rs.next()){
    			content.setContentId(rs.getInt("ContentId"));
    	    	content.setCaption(rs.getString("Caption"));
 	    		content.setCreateDate(ff.format(rs.getTimestamp("CreateDate")));
 	    		content.setTimes(rs.getInt("Times"));
 	    		content.setSource(rs.getString("Source"));
 	    		content.setText(rs.getString("Text"));
 	    		content.setPic(rs.getString("Pic"));
 	    		content.setRefPic(rs.getString("RefPic"));
 	    		content.setHot(rs.getInt("Hot"));
 	    	    User user = new User();
 	    	    user.setUserId(rs.getInt("UserId"));
 	    		content.setAuthorId(user);
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return content;
     }
     
     //热点
     public List selectHot(){
    	 List<Content> list = new ArrayList<Content>();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_Content,T_Catlog where T_Content.CatlogId = T_Catlog.CatlogId and Hot = 1 order by CreateDate desc";
    		 pstm = conn.prepareStatement(sql);
    		 rs = pstm.executeQuery();
    		 while(rs.next()){
    			Content content = new Content();
    			content.setContentId(rs.getInt("ContentId"));
    	    	content.setCaption(rs.getString("Caption"));
 	    		content.setCreateDate(f.format(rs.getDate("CreateDate")));
 	    		content.setTimes(rs.getInt("Times"));
 	    		content.setSource(rs.getString("Source"));
 	    		content.setText(rs.getString("Text"));
 	    		content.setPic(rs.getString("Pic"));
 	    		content.setRefPic(rs.getString("RefPic"));
 	    		
 	    		Catlog catlog = new Catlog();
 	    		catlog.setCatlogId(rs.getInt("CatlogId"));
 	    		content.setCatlog(catlog);
	    		list.add(content);
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return list;
     }
     

     //图片
       public List selectPic(){
      	 List<Content>list=new ArrayList<Content>();
      	 try{
      		 conn = DBConn.getCon();
      		 String sql = "select * from T_Content,T_Catlog where T_Content.CatlogId = T_Catlog.CatlogId and ParentId = 2 order by CreateDate desc";
      		 pstm = conn.prepareStatement(sql);
      		 rs = pstm.executeQuery();
      		 while(rs.next()){
      			Content content = new Content();
      			content.setContentId(rs.getInt("ContentId"));
   	    		content.setCaption(rs.getString("Caption"));
   	    		content.setCreateDate(f.format(rs.getDate("CreateDate")));
   	    		content.setPic(rs.getString("Pic"));
   	    		content.setRefPic(rs.getString("RefPic"));
   	    		
   	    		Catlog catlog = new Catlog();
   	    		catlog.setCatlogId(rs.getInt("CatlogId"));
   	    		content.setCatlog(catlog);
   	    		list.add(content);
      		 }
      	 }catch(Exception e){
      		 e.printStackTrace();
      	 }finally{
      		 DBConn.closeDB(conn, pstm, rs);
      	 }
      	 return list;
       }
}
