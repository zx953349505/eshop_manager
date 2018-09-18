package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.BookInfo;


public interface BookBiz {
	/**
	 * ͨ��������ѯ�鼮
	 * @return
	 */
	List<BookInfo> selectBookByTypeID(String type_id,String book_name,String book_author,int status,int currentPage,int pageSize);
	/**
	 * ��ѯ�ܼ�¼��
	 * @return
	 */
	int selectTotalCount(String type_id,String book_name,String book_author,int status);
	
	/**
	 * ���ͼ��
	 * @param bookInfo
	 * @return
	 */
	int addBook(BookInfo bookInfo);
	
	/**
	 * ����id��ѯ�鼮
	 * @param book_id
	 * @return
	 */
	BookInfo selectBookById(int book_id);
	
	/**
	 * ɾ��ͼ��(�������վ,���Ϊ����)
	 * @param bookInfo
	 * @return
	 */
	void deleteBook(int book_id);
	
	/**
	 * ��ԭͼ��(�ӻ���վ��ԭ�鼮����Ϊ��������)
	 * @param bookInfo
	 * @return
	 */
	void returnGarbage(List<String> bookIdLsit);
	
	/**
	 * ɾ��ͼ��(�ӻ���վɾ��������ɾ��)
	 * @param bookInfo
	 * @return
	 */
	void deleteGarbage(List<String> bookIdLsit);
	
	/**
	 * ������ͼ��
	 * @param book_id
	 * @param picList
	 */
	void insertBookPicList(int book_id,List<String> picList);
	
	/**
	 * ��ѯ����վ�鼮
	 * @return
	 */
	List<BookInfo> selectGarbage(int currentPage, int pageSize);
	
	/**
	 * ��ѯ����վ�鼮����
	 * @return
	 */
	int totalGarbageCount();
	
	/**
	 * ����id��ѯ�鼮��ͼ�б�
	 * @param book_id
	 * @return
	 */
	List<String> selectBookPicList(int book_id);
	
	/**
	 * �����޸�ͼ���Ƿ�Ϊ����
	 */
	void UpateBookIsGarbage(int is_garbage, List<String> bookIds);
	
	/**
	 * �����޸�ͼ�����¼�
	 */
	void UpateBookStatus(int status, List<String> bookIds);
	
	/**
	 * �����޸�ͼ���Ƿ���Ʒ
	 */
	void UpateBookIsNew(int is_new, List<String> bookIds);
	
	/**
	 * �����޸�ͼ���Ƿ�����
	 */
	void UpateBookIsHot(int is_hot, List<String> bookIds);
	
}
