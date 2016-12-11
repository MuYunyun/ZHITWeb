package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import service.ContentService;
import entity.Catlog;
import entity.Content;
import entity.User;

public class updateContentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletFileUpload upload;
	private final long MAXSize = 4194304*2L;//4*2MB
	private String filedir=null;
	/**
	 * Constructor of the object.
	 */
	public updateContentServ() {
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
		PrintWriter out1 = response.getWriter();

		Map<String, String> map = new HashMap<String, String>();  
		String savePath = this.getServletContext().getRealPath("/")+"images";
		File file = new File(savePath);
		//判断上传文件的保存目录是否存在
		if (!file.exists() && !file.isDirectory()) {
		System.out.println(savePath+"目录不存在，需要创建");
		//创建目录
		file.mkdir();
		}
		//消息提示
		String message = "";
		
		try{
		//使用Apache文件上传组件处理文件上传步骤：
		//1、创建一个DiskFileItemFactory工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//2、创建一个文件上传解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		//解决上传文件名的中文乱码
		upload.setHeaderEncoding("UTF-8"); 
		//3、判断提交上来的数据是否是上传表单的数据
		if(!ServletFileUpload.isMultipartContent(request)){
		//按照传统方式获取数据
        return;
		}
		//4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
		List<FileItem> list = upload.parseRequest(request);
		

		for(FileItem item : list){
		 	   if(item.isFormField()){
			    String name = item.getFieldName();
				String value = item.getString("UTF-8");
				    map.put(name, value);}
		 	     else{
				    String name = item.getFieldName();
					String filename = item.getName();
					map.put(name, filename);
				}
		       }
		
		    String refPic = map.get("RefPic");
		    String Pic = map.get("Pic");
		    System.out.println(refPic);
		    System.out.println(Pic);
		    if(refPic.equals("") && Pic.equals("")){  //对象不存在是null,字符串为空要这样写
				String caption = map.get("Caption");
				String source = map.get("Source");
				String text = map.get("Text");
				int hot = Integer.parseInt(map.get("Hot"));
				int contentId = Integer.parseInt(map.get("ContentId"));		
				Content content = new Content();
				content.setCaption(caption);
				content.setSource(source);
				content.setText(text);
				content.setHot(hot);
				content.setContentId(contentId);
				boolean b = (new ContentService()).updateContent(content);
				if(b){
					out1.print("True");
				}else{
					out1.print("False");
				}
				out1.flush();
				out1.close();	
		    }else{		for(FileItem item : list){
		        //如果fileitem中封装的是普通输入项的数据
				if(item.isFormField()){	
				String name = item.getFieldName();
				//解决普通输入项的数据的中文乱码问题
				String value = item.getString("UTF-8");
				map.put(name, value);
				}else{//如果fileitem中封装的是上传文件
				//得到上传的文件名称，	
				String filename = item.getName();
				/*map.put("filepath", filename);*/
				if(filename==null || filename.trim().equals("")){
				continue;
				}
				//注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如： c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
				//处理获取到的上传文件的文件名的路径部分，只保留文件名部分
				filename = filename.substring(filename.lastIndexOf("\\")+1);
				//获取item中的上传文件的输入流
				InputStream in = item.getInputStream();
 /*               //得到文件保存的名称
                String saveFilename = makeFileName(filename);*/
				//创建一个文件输出流
				FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
				//创建一个缓冲区
				byte buffer[] = new byte[1024];
				//判断输入流中的数据是否已经读完的标识
				int len = 0;
				//循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
				while((len=in.read(buffer))>0){
				//使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
				out.write(buffer, 0, len);
				}
				
				String caption = map.get("Caption");
				String source = map.get("Source");
				String text = map.get("Text");
				int hot = Integer.parseInt(map.get("Hot"));
				int contentId = Integer.parseInt(map.get("ContentId"));		
				Content content = new Content();
				content.setCaption(caption);
				content.setSource(source);
				content.setPic(filename);
				content.setRefPic(filename);
				content.setText(text);
				content.setHot(hot);
				content.setContentId(contentId);
				boolean b = (new ContentService()).updateContent(content);
				if(b){
					out1.print("True");
				}else{
					out1.print("False");
				}
				//关闭输入流
				in.close();
				//关闭输出流
				out.close();
				out1.flush();
				out1.close();
				//删除处理文件上传时生成的临时文件
				item.delete();
				message = "文件上传成功！";

				}
				
				}}
				}catch (Exception e) {
				message= "文件上传失败！";
				e.printStackTrace();
				 
				}
			}

    private String makeFileName(String filename){  
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString() + "_" + filename;
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
