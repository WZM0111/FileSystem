package common.dao;

import java.util.HashMap;
import java.util.List;

import common.bean.FileInfoBean;
import common.utils.PageBean;

public interface FileDao {
	/**
	 * 查找所有分类
	 * @return
	 */
	public List<FileInfoBean> findType();
	/**
	 * 查找该分类下的前6个文件
	 * @param filetype
	 * @return
	 */
	public List<FileInfoBean> findname(String filetype);
	/**
	 * 添加文件到数据库
	 * @param fileinfobean
	 */
	
	public void add(FileInfoBean fileinfobean);

	/**
	 * 获取所有分类下的文件
	 */
	public PageBean<FileInfoBean> getFilesList(String filetype,int page,int pageSize);
	/**
	 *根据文件名和用户名查找文件id
	 * @param filename
	 * @param username
	 * @return
	 */
	
	public FileInfoBean findfile(String filename,String username);

	/**
	 * 查找用户上传的文档
	 * @param username
	 * @return
	 */
	public PageBean<FileInfoBean> findFilesByUsername(String username,int page,int pageSize);
	
	/**
	 * 查找用户下载的文档
	 * @param username
	 * @return
	 */
	public PageBean<FileInfoBean> findDfilesByUsername(String username,int page,int pageSize);
	
	/**
	 * 根据id删除下载记录
	 * @param id
	 */
	public void deleteDownloadFileById(int id);
	
	/**
	 * 根据id删除文件
	 * @param id
	 */
	public void deleteUploadFileById(int id);
	
	public int getTotalRecordNumber(HashMap queryInforMap);

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);

	/**
	 * 根据content搜索相关内容，不需要分页
	 * @param content
	 * @return
	 */
	public List<FileInfoBean> filetypes(String content);
	
	
}
