package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Member;

import net.sf.json.JSONArray;
import DAL.ContentDao;
import DAL.MemberDao;

public class Biaodan extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Biaodan() {
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
        System.out.println("dd");
        String caption = request.getParameter("Caption");
        caption = new String(caption.getBytes("ISO8859_1"),"utf-8");
        String contact = request.getParameter("Contact");
        contact = new String(contact.getBytes("ISO8859_1"),"utf-8");
        String post = request.getParameter("Post");
        post = new String(post.getBytes("ISO8859_1"),"utf-8");
        String tel = request.getParameter("Tel");
        String mobile = request.getParameter("Mobile");
        String fax = request.getParameter("Fax");
        String email = request.getParameter("Email");
        String memo = request.getParameter("Memo");
        memo = new String(memo.getBytes("ISO8859_1"),"utf-8");
        System.out.println(memo);
        Member member = new Member();
        member.setCaption(caption);
        member.setContact(contact);
        member.setPost(post);
        member.setTel(tel);
        member.setMobile(mobile);
        member.setFax(fax);
        member.setEmail(email);
        member.setMemo(memo);
        int b = new MemberDao().save(member);
        if(b!=0){
        	out.print("<script>alert('提交成功')</script>");
        	out.print("<script>location.assign('WebPage/wyrh.jsp');</script>");
     	   out.print("true");
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
