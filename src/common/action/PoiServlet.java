package common.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

import org.apache.poi.ConvertFacade;
import org.apache.poi.hwpf.converter.DocConverter;

import common.domain.ResponseEntity;

/**
 * @ClassName: PoiServlet
 * @Description:
 * @author albert
 * @date 2017��9��19�� ����12:41:36
 * 
 */
@WebServlet(value = "/poi")
@MultipartConfig
public class PoiServlet extends BaseServlet {

	private static final long serialVersionUID = 7890806721814771129L;
	private static final String TMP_NAME = "poicache";

	public void convert() throws Exception {

		// System.out.println(req.getCharacterEncoding());

		String savePath = request.getServletContext().getRealPath("/uploadFile");

		// System.out.println("�ļ�savepath:"+savePath);

		File dir = new File(savePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Collection<Part> parts = request.getParts();
		if (parts.size() == 1) {
			Part part = request.getPart("file");
			String header = part.getHeader("Content-Disposition");
			System.out.println("header:" + header);
			
			String fileName = getFileName(header);
			System.out.println("fileName:" + fileName);
			
			
			String suffix = "."+fileName.substring(fileName.lastIndexOf(".") + 1);
			System.out.println("suffix:"+suffix);
			
			
			part.write(savePath + File.separator + fileName);
			/*String htmlFile = savePath + File.separator + TMP_NAME + ".html";
			//System.out.println("html·��:" + htmlFile);

			ConvertFacade.convert(savePath + File.separator + fileName,htmlFile);*/
			System.out.println("文件路径" + savePath + File.separator + fileName);
			//System.out.println("html路径" + htmlFile);
			
			
			/*BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(htmlFile))); 
			StringBuffer sb = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			write(resp, ResponseEntity.success(sb.toString()));*/
			
			
		}
	}

	/**
	 * @param header
	 * @return
	 */
	public String getFileName(String header) {
		return header.substring(header.indexOf("filename") + 10,
				header.length() - 1);
	}
}