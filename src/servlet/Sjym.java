package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Content;
import entity.Counter;
import service.ContentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import DAL.ContentDao;

public class Sjym extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Sjym() {
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
               doPost(request,response);
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
		String u = request.getParameter("Con");
		
        int contentId =(Integer.parseInt(u));
        
      //统计访问次数
        Content content = new Content();
		content.setContentId(contentId);
		boolean b = (new ContentService()).updateTimes(content);
		if(b){
			System.out.print("True");
		}else{
			System.out.print("False");
		}
        
		JSONObject jsonobject = (new ContentService()).getContentById(contentId);
		if(jsonobject!=null){
     	   out.print(jsonobject);
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
