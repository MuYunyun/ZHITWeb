package service;

import DAL.UserDao;
import entity.User;
import net.sf.json.JSONObject;

public class UserService {
     public JSONObject selectUserById(int userid){
    	 JSONObject object = new JSONObject();
    	 User user = (new UserDao()).selectUserById(userid); 
    	 object.put("UserId", String.valueOf(user.getUserId()));
    	 object.put("UserName", user.getUserName());
    	 object.put("UserPwd", user.getUserPwd());
    	 object.put("Name", user.getName());
    	 object.put("ShowName", user.getShowName());
    	 object.put("Memo", user.getMemo());
    	 object.put("Enabled", String.valueOf(user.getEnabled()));
    	 return object;
     }
     
     public User UserLogin(String username, String password) {
    		// TODO Auto-generated method stub
    		User user = new User();
    		user = (new UserDao()).Login(username,password);
    		return user;
    	}

}

