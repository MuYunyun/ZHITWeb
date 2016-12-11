package DAL;
import java.sql.*;

public class DBConn {
	private static final String url = "jdbc:sqlserver://localhost:1433;DatabaseName=ZHITWEB";
	private static final String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	/**
	 * 获取连接的方法
	 * @return
	 */
	public static Connection getCon(){
		Connection conn=null;
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,"sa","peipei");
			System.out.println("数据库连接成功");
		} catch (Exception e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		return conn;
	} 
	
	/**
	 * 关闭连接
	 */
	public static void close(ResultSet rs,Statement stmt,Connection conn){
		try {
			if(rs!=null)
				rs.close();
			if(stmt !=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//关闭数据库，释放资源
	public static void closeDB(Connection conn,PreparedStatement pstm,ResultSet rs){
		try {
			if(rs!=null)
				rs.close();
			if(pstm!=null)  
				pstm.close();
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public static void main(String[] args){
		getCon();
	}
}