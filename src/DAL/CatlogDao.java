package DAL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Catlog;
import entity.User;
public class CatlogDao {
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	
    public Catlog selectCatById(int catlogId){
   	 Catlog catlog = new Catlog();
   	 try{
   		 conn = DBConn.getCon();
   		 String sql = "select * from T_Catlog where CatlogId=?";
   		 pstm = conn.prepareStatement(sql);
   		 pstm.setInt(1, catlogId);
   		 rs = pstm.executeQuery();
   		 while(rs.next()){
   			    catlog.setCatlogId(rs.getInt("CatlogId"));
   			    catlog.setCaption(rs.getString("Caption"));
   			    catlog.setParentId(rs.getInt("ParentId"));
   			    catlog.setCatURL(rs.getString("CatURL"));
   			    catlog.setCntURL(rs.getString("CntURL"));
   		 }
   	 }catch(Exception e){
   		 e.printStackTrace();
   	 }finally{
   		 DBConn.closeDB(conn, pstm, rs);
   	 }
   	 return catlog;
    }
	
	
	public List<Catlog> selectCatlogById(int n) {
		List<Catlog>list=new ArrayList<Catlog>();
		try {
			conn=DBConn.getCon();
			String sql="select * from T_Catlog where ParentId=?";
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, n);
			rs=pstm.executeQuery();
			while(rs.next()){
				Catlog catlog=new Catlog();
				catlog.setCatlogId(rs.getInt("CatlogId"));
				catlog.setCaption(rs.getString("Caption"));
				catlog.setParentId(rs.getInt("ParentId"));
				catlog.setCatURL(rs.getString("CatURL"));
				catlog.setCntURL(rs.getString("CntURL"));
				list.add(catlog);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, pstm, rs);
		}
		return list;
	}
	
	public Catlog selectCatlogByCatId(int n) {
		Catlog catlog=new Catlog();
		try {
			conn=DBConn.getCon();
			String sql="select * from T_Catlog where CatlogId=?";
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, n);
			rs=pstm.executeQuery();
			while(rs.next()){
				catlog.setCatlogId(rs.getInt("CatlogId"));
				catlog.setCaption(rs.getString("Caption"));
				catlog.setParentId(rs.getInt("ParentId"));
				catlog.setCatURL(rs.getString("CatURL"));
				catlog.setCntURL(rs.getString("CntURL"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, pstm, rs);
		}
		return catlog;
	}
	
	public Catlog selectCatlogByName(String n) {
		Catlog catlog=new Catlog();
		try {
			conn=DBConn.getCon();
			
			String sql="select * from T_Catlog where Caption=?";
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, n);
			rs=pstm.executeQuery();
			while(rs.next()){
				catlog.setCatlogId(rs.getInt("CatlogId"));
				catlog.setCaption(rs.getString("Caption"));
				catlog.setParentId(rs.getInt("ParentId"));
				catlog.setCatURL(rs.getString("CatURL"));
				catlog.setCntURL(rs.getString("CntURL"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, pstm, rs);
		}
		return catlog;
	}

}
