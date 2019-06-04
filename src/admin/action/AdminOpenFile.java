package admin.action;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Collection;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;

import org.apache.poi.ConvertFacade;
import org.apache.poi.hwpf.converter.DocConverter;

import admin.dao.AdminFilesDao;
import admin.dao.impl.AdminFilesDaoImpl;

import common.action.BaseServlet;
import common.bean.FileInfoBean;
import common.domain.ResponseEntity;


@WebServlet(value = "/admin/adminOpenFile")
@MultipartConfig
public class AdminOpenFile extends BaseServlet {

	private static final long serialVersionUID = 7890806721814771129L;
	private static final String TMP_NAME = "poicache";

	public void convert() throws Exception {

		request.setCharacterEncoding("UTF-8");
		int fileId =Integer.parseInt( request.getParameter("fileId"));
		System.out.println(fileId);
		AdminFilesDao dao =new AdminFilesDaoImpl();
		FileInfoBean bean=dao.findFileById(fileId);
		
		HttpSession session=request.getSession();
		
		/*System.out.println(bean.getFileName());
		*/
		String savePath = request.getServletContext().getRealPath("/upload");
		// File newfile = new File(fileLocation + "\\" + fileName + fileType);
		
		if(bean.getFileForm().equals("doc")||bean.getFileForm().equals("docx")
				||bean.getFileForm().equals("xls")||bean.getFileForm().equals("xlsx")){
			
			File dir = new File(savePath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
	
			String htmlFile = savePath + File.separator + TMP_NAME + ".html";
			// System.out.println(htmlFile);
			String filePath = savePath + File.separator + bean.getFileId() + "."+ bean.getFileForm();
			
			System.out.println("filePath:" + filePath);
			//System.out.println("htmlFile:" + htmlFile);
			
			
			ConvertFacade.convert(filePath, htmlFile);
	
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(htmlFile)));
			StringBuffer sb = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			write(response, ResponseEntity.success(sb.toString()));
		}else if(bean.getFileForm().equals("pdf")){
			response.getWriter().print("pdf,"+bean.getFileId());
		}else if(bean.getFileForm().equals("ppt")||bean.getFileForm().equals("pptx")){
			response.getWriter().print("ppt,"+bean.getFileId());
		}
	}

	public String getFileName(String header) {
		return header.substring(header.indexOf("filename") + 10,
				header.length() - 1);
	}
}