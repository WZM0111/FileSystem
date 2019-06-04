package common.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.jspsmart.upload.*;

import common.bean.FileInfoBean;
import common.dao.FileDao;
import common.dao.impl.FileDaoImpl;
//import jspsmartupload.com.jspsmart.upload.SmartUpload;
//import jspsmartupload.com.jspsmart.upload.SmartUploadException;
//import com.jspsmart.upload.Request;
//import sss.com.jspsmart.upload.*;

public class UploadServlet extends HttpServlet {
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	final public ServletConfig getServletConfig() {
		return config;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse

	response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		
		SmartUpload mySmartUpload1 = new SmartUpload();
		mySmartUpload1.setCharset("utf-8");
		mySmartUpload1.initialize(getServletConfig(), request, response);

		// 设定上传限制
		// 1.限制每个上传文档的最大长度。
		// mySmartUpload.setMaxFileSize(2*1024*1024); //单个上传文件不超过2M
		// // 2.限制总上传数据的长度。
		// mySmartUpload.setTotalMaxFileSize(10*1024*1024); //总上传文件不超过10M
		// // 3.设定允许上传的文档（通过扩展名限制）,仅允许doc,txt文档。
		mySmartUpload1.setAllowedFilesList("xlsx,xls,docx,doc,ppt,pptx,pdf");

		try {
			// 上传文件
			mySmartUpload1.upload();
			// 4.设定禁止上传的文档（通过扩展名限制）,禁止上传带有exe,bat, jsp,htm,html扩展名的文档和没有扩展名的文档。
			// mySmartUpload.setDeniedFilesList("exe,bat,jsp,htm,html");

		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 读取其他数据
		Request req = mySmartUpload1.getRequest();
		String username = req.getParameter("username1");
		String filetype = req.getParameter("type");
		String introduce=req.getParameter("introduce");
		String strprice=req.getParameter("fileprice");
		System.out.println("sdsadsd:"+strprice);
		int price=Integer.parseInt(strprice);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String uploadDate=sdf.format(new Date());
		
		// String s1=new
		// String(req.getParameter("test").getBytes("utf-8"),"gbk");
		// 逐一提取上传文件信息,保存文档
		// for(int i = 0; i < mySmartUpload.getFiles().getCount(); i++) {
		String savePath = this.getServletContext().getRealPath(
				"/upload");
		System.out.println("111::"+savePath);
		File file1 = new File(savePath);
		if (!file1.exists() && !file1.isDirectory()) {
			System.out.println(savePath + "目录不存在，需要创建");
			// 创建目录
			file1.mkdir();
		}
		com.jspsmart.upload.File file = mySmartUpload1.getFiles().getFile(0);

		// if (file.isMissing()) continue;

		// 显示当前文件信息
		System.out.println("username:" + username);
		System.out.println("filetype:" + filetype);
		System.out.println("introduce:" + introduce);
		System.out.println("price:" + price);
		
		System.out.println("表单项名:" + file.getFieldName());
		System.out.println("文件长度:" + file.getSize());
		String filenames = file.getFileName();
		System.out.println("文件名:" + filenames);

		String filename = filenames.substring(0, filenames.lastIndexOf("."));
		System.out.println("不带后缀的文件名:" + filename);
		String fileform=file.getFileExt();
		System.out.println("文件扩展名:" + fileform);
		System.out.println("文件全名:" + file.getFilePathName());
		// 　　 // 将文件另存
		 FileDao fileDao=new FileDaoImpl();
	      FileInfoBean fileInfoBean=new FileInfoBean();
	      fileInfoBean.setFileName(filename);
	      fileInfoBean.setFileForm(fileform);
	      fileInfoBean.setFileType(filetype);
	      fileInfoBean.setUsername(username);
	      fileInfoBean.setIntroduce(introduce);
	      fileInfoBean.setPrice(price);
	      fileInfoBean.setUploadDate(uploadDate);
	      fileDao.add(fileInfoBean);
	      
	      FileInfoBean fileinfos=fileDao.findfile(filename, username);
	      
		try {

			file.saveAs(file1 + "\\" + fileinfos.getFileId()+"."+fileform, SmartUpload.SAVE_AUTO);

		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		String imagepath=this.getServletContext().getRealPath("/upload/image");
		File file2 = new File(imagepath);
		if (!file2.exists() && !file2.isDirectory()) {
			System.out.println(imagepath + "目录不存在，需要创建");
			// 创建目录
			file2.mkdir();
		}
		String htmlpath=this.getServletContext().getRealPath("/upload/html");
		File file3 = new File(htmlpath);
		if (!file3.exists() && !file3.isDirectory()) {
			System.out.println(htmlpath + "目录不存在，需要创建");
			// 创建目录
			file3.mkdir();
		}
		if("pptx".equals(fileform)||"ppt".equals(fileform)){
			POIPptToHtml.pptToHtml(file1+"\\"+fileinfos.getFileId()+"."+fileform, file1+"\\html");
		}
		out.println("<script type=\"text/javascript\">alert('文件已上传，正在审核中，请稍后！')");
		out.println("window.location='myUpload.jsp'");
	    out.println("</script>"); 
	}
}
// }
