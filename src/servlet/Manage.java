package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ContentService;
import DAL.ContentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Manage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Manage() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           response.setContentType("text/html;charset=utf-8");
           PrintWriter out = response.getWriter();
           
   		//获取分页参数
   		int page;
   		int rows;
   		String p=request.getParameter("page");
   		if(p==null){
   			page=0;
   		}else{
   			page=Integer.parseInt(p);
   		}
   		String row=request.getParameter("rows");
   		if(row==null){
   			rows=10;
   		}else{
   			rows=Integer.parseInt(row);
   		}
   		
           JSONArray jsonarray = new JSONArray();
           Integer c=(Integer.valueOf(request.getParameter("Cat")));
           Integer d=(Integer.valueOf(request.getParameter("Id")));
           if(d == 1){
           jsonarray = (new ContentService()).getTimeById(c.intValue(),page,rows); //超级管理员 
           }else{
           jsonarray = (new ContentService()).getById(c.intValue(),d.intValue(),page,rows);}
           if(jsonarray.size()>0){
   			JSONObject obj=new JSONObject();
   			int total=(new ContentService()).getContentTotal(c);
   			obj.put("total", total);
   			obj.put("rows", jsonarray);
   			out.print(obj);
           }else{
        	   out.print("error");
           }
           out.flush();
           out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
