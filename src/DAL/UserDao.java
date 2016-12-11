package DAL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.User;

public class UserDao {
     private Connection conn;
     private PreparedStatement pstm;
     private ResultSet rs;
     
     /*±£¥Ê”√ªß*/
     public int save(User user){
    	 int i=0;
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "insert into T_User(UserName,UserPwd,Name," +
    		 		"ShowName,Memo,Enabled)values(?,?,?,?,?,?)";
    		         pstm = conn.prepareStatement(sql);
    		         pstm.setString(1, user.getUserName());
    		         pstm.setString(2, user.getUserPwd());
    		         pstm.setString(3, user.getName());
    		         pstm.setString(4, user.getShowName());
    		         pstm.setString(5, user.getMemo());
    		         pstm.setInt(6, user.getEnabled());
    		         i = pstm.executeUpdate();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     
     public int deleteUser(int userId){
    	 int i=0;
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "delete from T_User where UserId=?";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, userId);
    		 i = pstm.executeUpdate();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     
     
     public User selectUserById(int userid){
    	 User user = new User();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_User where UserId=?";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, userid);
    		 rs = pstm.executeQuery();
    		 while(rs.next()){
    				user.setUserId(rs.getInt("UserId"));
    	    		user.setUserName(rs.getString("UserName"));
    	    		user.setUserPwd(rs.getString("UserPwd"));
    	    		user.setName(rs.getString("Name"));
    	    		user.setShowName(rs.getString("ShowName"));
    	    		user.setMemo(rs.getString("Memo"));
    	    		user.setEnabled(rs.getInt("Enabled"));
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return user;
     }
     
     public User Login(String username,String password){
    	 User user=new User();
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "select * from T_User where UserName=? and UserPwd=? and Enabled=1";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setString(1, username);
    		 pstm.setString(2, password);
    		 rs=pstm.executeQuery();
    		 if(rs.next()){
    			 user.setUserId(rs.getInt("UserId"));
    			 user.setName(rs.getString("Name"));
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return user;
     }
}
