package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
import entity.User;

public class LoginServ extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServ() {
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
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String text=request.getHeader("referer");
		System.out.println(text);
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String chkCode="";
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("rand");
		if (obj!=null)
		{
			chkCode = obj.toString();
		}
		String code=request.getParameter("yz");
		if (code.equals(chkCode)){
			if ((!username.equals("")) && (!password.equals(""))){
				User user=new User();
				user=(new UserService()).UserLogin(username,password);
				if(user!=null){
					 session.setAttribute("userid", user.getUserId());
					 session.setAttribute("name", user.getName());
					 out.flush();//Çå¿Õ»º´æ
			         out.println("<script>");//Êä³öscript±êÇ©
			         out.println("window.open('Page/index.jsp','_parent')");//jsÓï¾ä£ºÊä³öÍøÒ³»ØÍËÓï¾ä
			         //out.println("window.reload()");
			         out.println("</script>");//Êä³öscript½áÎ²±êÇ©
					System.out.println("µÇÂ¼");
					return;
				}else{response.sendRedirect("login.jsp");}
			}else{response.sendRedirect("login.jsp");}
		}else{response.sendRedirect("login.jsp");}
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
