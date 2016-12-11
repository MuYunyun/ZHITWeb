package service;

import java.util.List;

import entity.Catlog;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import DAL.CatlogDao;
import DAL.UserDao;

public class CatlogService {
	
    public JSONObject selectCatlogById(int catlogid){
   	 JSONObject object = new JSONObject();
   	 Catlog catlog = (new CatlogDao()).selectCatById(catlogid);
   	 object.put("CatlogId", String.valueOf(catlog.getCatlogId()));
   	 object.put("Caption", catlog.getCaption());
   	 object.put("ParentId", String.valueOf(catlog.getParentId()));
   	 object.put("CatURL", catlog.getCatURL());
   	 object.put("CntURL", catlog.getCntURL());
   	 return object;
    }
	
	
	public JSONArray getCatlog(int n) {
		JSONArray array=new JSONArray();
		List<Catlog>catloglist = (new CatlogDao()).selectCatlogById(n);
			for(Catlog catlog:catloglist){
            JSONObject object = new JSONObject();
            JSONObject object2 = new JSONObject();
            object2.put("CatURL", catlog.getCatURL());
			object.put("id", String.valueOf(catlog.getCatlogId()));
			object.put("text", catlog.getCaption());
			object.put("ParentId", String.valueOf(catlog.getParentId()));
			object.put("CntURL", catlog.getCntURL());
			
			object.put("attributes", object2);
			array.add(object);
            }
		return array;
	}
	
	public JSONObject getCatlogByCatId(int n) {
		    JSONObject object = new JSONObject();
		    Catlog catlog = (new CatlogDao()).selectCatlogByCatId(n);
		    object.put("id", String.valueOf(catlog.getCatlogId()));
			object.put("text", catlog.getCaption());
			object.put("ParentId", String.valueOf(catlog.getParentId()));
			object.put("CntURL", catlog.getCntURL());
            
		return object;
	}
	
	public JSONObject getCatlogByName(String n) {
	    JSONObject object = new JSONObject();
	    Catlog catlog = (new CatlogDao()).selectCatlogByName(n);
	    object.put("id", String.valueOf(catlog.getCatlogId()));
		object.put("ParentId", String.valueOf(catlog.getParentId()));
		object.put("CntURL", catlog.getCntURL());
        
	return object;
}
}
