package common.dao;

import java.util.HashMap;
import java.util.List;

import common.bean.Comment;
import common.bean.FileInfoBean;


public interface showFileDao {

	/**
	 * ���id��������
	 * @return
	 */
	public FileInfoBean fileinfo(int id);
	
	/**
	 * �������id�������
	 */
	public List<Comment> filecomment(int id);
	public void addComment(Comment comment);
	public void add(String username,int fileid,String date);
}
