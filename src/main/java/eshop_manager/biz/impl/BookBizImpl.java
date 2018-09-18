package eshop_manager.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.BookBiz;
import eshop_manager.dao.BookMapper;
import eshop_manager.entity.BookInfo;


public class BookBizImpl implements BookBiz {
	@Autowired
	private BookMapper bookDao;

	public List<BookInfo> selectBookByTypeID(String type_id,String book_name,String book_author,int status,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type_id", type_id);
		map.put("book_name", book_name);
		map.put("book_author", book_author);
		map.put("status", status);
		map.put("currentPage", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return bookDao.selectBookByTypeID(map);
	}

	public int selectTotalCount(String type_id,String book_name,String book_author,int status) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type_id", type_id);
		map.put("book_name", book_name);
		map.put("book_author", book_author);
		map.put("status", status);
		return bookDao.selectTotalCount(map);
	}

	public int addBook(BookInfo bookInfo) {
		// TODO Auto-generated method stub
		return bookDao.addBook(bookInfo);
	}
	
	public BookInfo selectBookById(int book_id) {
		// TODO Auto-generated method stub
		return bookDao.selectBookById(book_id);
	}
	
	public void insertBookPicList(int book_id, List<String> picList) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("bookId", book_id);
		paramMap.put("picList", picList);
		bookDao.insertBookPicList(paramMap);
	}
	
	public List<BookInfo> selectGarbage(int currentPage, int pageSize) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("start", (currentPage-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		return bookDao.selectGarbage(paramMap);
	}
	
	public int totalGarbageCount() {
		
		return bookDao.totalGarbageCount();
	}
	
	public void deleteBook(int book_id) {
		
		bookDao.deleteBook(book_id);
		
	}
	
	@Override
	public void returnGarbage(List<String> bookIdLsit) {
		bookDao.returnGarbage(bookIdLsit);
		
	}
	
	public void deleteGarbage(List<String> bookIdLsit) {
		
		bookDao.deleteGarbage(bookIdLsit);
		
	}
	
	public List<String> selectBookPicList(int book_id) {
		
		return bookDao.selectBookPicList(book_id);
	}

	public void UpateBookIsGarbage(int is_garbage, List<String> bookIds) {
		
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("is_garbage", is_garbage);
		paramMap.put("bookIdList", bookIds);
		bookDao.UpateBookIsGarbage(paramMap);
	}

	@Override
	public void UpateBookStatus(int status, List<String> bookIds) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("status", status);
		paramMap.put("bookIdList", bookIds);
		bookDao.UpateBookStatus(paramMap);
	}

	@Override
	public void UpateBookIsNew(int is_new, List<String> bookIds) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("is_new", is_new);
		paramMap.put("bookIdList", bookIds);
		bookDao.UpateBookIsNew(paramMap);
	}

	@Override
	public void UpateBookIsHot(int is_hot, List<String> bookIds) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("is_hot", is_hot);
		paramMap.put("bookIdList", bookIds);
		bookDao.UpateBookIsHot(paramMap);
	}

	

		

}
