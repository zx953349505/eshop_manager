package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.BookInfo;


public interface BookBiz {
	/**
	 * 通过条件查询书籍
	 * @return
	 */
	List<BookInfo> selectBookByTypeID(String type_id,String book_name,String book_author,int status,int currentPage,int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	int selectTotalCount(String type_id,String book_name,String book_author,int status);
	
	/**
	 * 添加图书
	 * @param bookInfo
	 * @return
	 */
	int addBook(BookInfo bookInfo);
	
	/**
	 * 根据id查询书籍
	 * @param book_id
	 * @return
	 */
	BookInfo selectBookById(int book_id);
	
	/**
	 * 删除图书(移入回收站,标记为垃圾)
	 * @param bookInfo
	 * @return
	 */
	void deleteBook(int book_id);
	
	/**
	 * 还原图书(从回收站还原书籍，设为不是垃圾)
	 * @param bookInfo
	 * @return
	 */
	void returnGarbage(List<String> bookIdLsit);
	
	/**
	 * 删除图书(从回收站删除，彻底删除)
	 * @param bookInfo
	 * @return
	 */
	void deleteGarbage(List<String> bookIdLsit);
	
	/**
	 * 插入子图表
	 * @param book_id
	 * @param picList
	 */
	void insertBookPicList(int book_id,List<String> picList);
	
	/**
	 * 查询回收站书籍
	 * @return
	 */
	List<BookInfo> selectGarbage(int currentPage, int pageSize);
	
	/**
	 * 查询回收站书籍总数
	 * @return
	 */
	int totalGarbageCount();
	
	/**
	 * 根据id查询书籍子图列表
	 * @param book_id
	 * @return
	 */
	List<String> selectBookPicList(int book_id);
	
	/**
	 * 批量修改图书是否为垃圾
	 */
	void UpateBookIsGarbage(int is_garbage, List<String> bookIds);
	
	/**
	 * 批量修改图书上下架
	 */
	void UpateBookStatus(int status, List<String> bookIds);
	
	/**
	 * 批量修改图书是否新品
	 */
	void UpateBookIsNew(int is_new, List<String> bookIds);
	
	/**
	 * 批量修改图书是否热卖
	 */
	void UpateBookIsHot(int is_hot, List<String> bookIds);
	
}
