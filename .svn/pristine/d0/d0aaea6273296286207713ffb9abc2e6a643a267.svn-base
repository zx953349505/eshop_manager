package eshop_manager.dao;

import java.util.List;
import java.util.Map;

import eshop_manager.entity.BookInfo;


public interface BookMapper {
	/**
	 * 根据条件查询书籍
	 * @return
	 */
	List<BookInfo> selectBookByTypeID(Map<String, Object> map);

	/**
	 * 查询总记录数
	 * @return
	 */
	int selectTotalCount(Map<String, Object> map);
	
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
	 * 根据id查询书籍子图列表
	 * @param book_id
	 * @return
	 */
	List<String> selectBookPicList(int book_id);
	
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
	void returnGarbage(List<String> bookIdList);
	
	/**
	 * 删除图书(从回收站删除，彻底删除)
	 * @param bookInfo
	 * @return
	 */
	void deleteGarbage(List<String> bookIdList);
	
	/**
	 * 插入子图表
	 * @param paramMap
	 */
	void insertBookPicList(Map<String, Object> paramMap);
	
	/**
	 * 查询回收站书籍
	 * @return
	 */
	List<BookInfo> selectGarbage(Map<String, Object> paramMap);
	
	/**
	 * 查询回收站书籍总数
	 * @return
	 */
	int totalGarbageCount();
	
	/**
	 * 批量修改图书是否为垃圾
	 */
	void UpateBookIsGarbage(Map<String, Object> paramMap);
	
	/**
	 * 批量修改图书上下架
	 */
	void UpateBookStatus(Map<String, Object> paramMap);
	
	/**
	 * 批量修改图书是否新品
	 */
	void UpateBookIsNew(Map<String, Object> paramMap);
	
	/**
	 * 批量修改图书是否热卖
	 */
	void UpateBookIsHot(Map<String, Object> paramMap);
	
	
}
