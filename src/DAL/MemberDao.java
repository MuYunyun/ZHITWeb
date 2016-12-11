package DAL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Member;
public class MemberDao {
	 private Connection conn;
     private PreparedStatement pstm;
     private ResultSet rs;
     
     public int save(Member member){
    	 int i=0;
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "insert into T_Member(Caption,Contact,Post,Tel," +
    		 		"Mobile,Fax,Email,Memo)values(?,?,?,?,?,?,?,?)";
    		         pstm = conn.prepareStatement(sql);
    		         pstm.setString(1, member.getCaption());
    		         pstm.setString(2, member.getContact());
    		         pstm.setString(3, member.getPost());
    		         pstm.setString(4, member.getTel());
    		         pstm.setString(5, member.getMobile());
    		         pstm.setString(6, member.getFax());
    		         pstm.setString(7, member.getEmail());
    		         pstm.setString(8, member.getMemo());
    		         i=pstm.executeUpdate();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     
    public int deleteMemberId(int memberId){
    	 int i=0;
    	 try{
    		 conn = DBConn.getCon();
    		 String sql = "delete from T_Member where MemberId=?";
    		 pstm = conn.prepareStatement(sql);
    		 pstm.setInt(1, memberId);
    		 i = pstm.executeUpdate();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }finally{
    		 DBConn.closeDB(conn, pstm, rs);
    	 }
    	 return i;
     }
     
     public List selectAllMember(){
    	 List list = new ArrayList();
    	    try{
    	    	conn = DBConn.getCon();
    	    	String sql = "select * from T_Member";
    	    	pstm = conn.prepareStatement(sql);
    	    	rs = pstm.executeQuery();
    	    	while(rs.next()){
    	    		Member member = new Member();
    	    		member.setMemberId(rs.getInt("MemberId"));
    	    		member.setCaption(rs.getString("Caption"));
    	    		member.setContact(rs.getString("Contact"));
    	    		member.setPost(rs.getString("Post"));
    	    		member.setTel(rs.getString("Tel"));
    	    		member.setMobile(rs.getString("Mobile"));
    	    		member.setFax(rs.getString("Fax"));
    	    		member.setEmail(rs.getString("Email"));
    	    		member.setMemo(rs.getString("Memo"));
    	    		list.add(member);
    	    	}
    	    }catch(Exception e){
    	    	e.printStackTrace();
    	    }
    	    return list;
     }
         
 
}
