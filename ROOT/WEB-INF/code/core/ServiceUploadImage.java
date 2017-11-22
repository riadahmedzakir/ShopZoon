package core;

import entity.Config;
import java.io.*;
import java.util.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*; 

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

public class ServiceUploadImage extends HttpServlet 
{
	public void init() throws ServletException { }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{  
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter(); 
		String tempName = "product"+Config.timeUnic();
		
		DiskFileItemFactory factory = new DiskFileItemFactory(); 
		factory.setSizeThreshold(1024*3*1024);
		factory.setRepository(new File("c:\\"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax( 1024*3*1024 );
		try{ 
			List fileItems = upload.parseRequest(request);
			Iterator i = fileItems.iterator();
			while ( i.hasNext () ) 
			{
				FileItem fi = (FileItem)i.next(); 
				File file = new File(Config.root+"/img/temp/",tempName+".png") ;  
				fi.write( file ) ; 
				out.print("ok"+tempName+".png");
			} 
		}
		catch(Exception ex) { out.print(ex.toString()); } 
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	public void destroy() {  } 
}