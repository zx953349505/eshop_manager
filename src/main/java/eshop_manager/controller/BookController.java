package eshop_manager.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.biz.BookBiz;
import eshop_manager.biz.TypeBiz;
import eshop_manager.entity.BookInfo;
import eshop_manager.entity.TypeInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;


@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookBiz bookBiz;
	@Autowired
	private TypeBiz typeBiz;


	@RequestMapping("/bookManagerPage")	
	@CheckLoginRequired
	public  ModelAndView bookManagerPage(
			@RequestParam(value="book_name",required=false) String book_name ,
			@RequestParam(value="book_author",required=false) String book_author ,
			@RequestParam(value="type_id",required=false,defaultValue="-1") String type_id ,
			@RequestParam(value="status",required=false,defaultValue="-1") int status ,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage ,
			@RequestParam(value="pageSize",required=false,defaultValue="10") int pageSize 
			)throws Exception{
		ModelAndView modelAndView=new ModelAndView();
		List<BookInfo> bookList=bookBiz.selectBookByTypeID(type_id, book_name, book_author, status, currentPage, pageSize);
		List<TypeInfo> typeList=typeBiz.selectTypeAll();
		int totalCount=bookBiz.selectTotalCount(type_id, book_name, book_author, status);
		int totalPage=totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
		modelAndView.addObject("book_name", book_name);
		modelAndView.addObject("book_author", book_author);
		modelAndView.addObject("type_id", type_id);
		modelAndView.addObject("status", status);
		modelAndView.addObject("bookList", bookList);
		modelAndView.addObject("typeList", typeList);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.addObject("totalCount", totalCount);
		modelAndView.addObject("totalPage", totalPage);	
		modelAndView.setViewName("book_manager");
		return modelAndView;
	}
	
	@RequestMapping("/addBookPage")
	public ModelAndView toAddBookPage(){
		
		ModelAndView model=new ModelAndView();
		model.setViewName("addbook");
		return model;
	}
	
	@RequestMapping("/addbook")
	@CheckLoginRequired
	public String addbook(HttpServletRequest request,
			@RequestParam("book_name") String book_name,
			@RequestParam("type_id") int type_id,
			@RequestParam("book_price") double book_price,
			@RequestParam("book_price_old") double book_price_old,
			@RequestParam("book_author") String book_author,
			@RequestParam("book_press") String book_press,
			@RequestParam("book_logo_big") MultipartFile book_logo_big,
			@RequestParam("book_logo_small") MultipartFile book_logo_small,
			@RequestParam("book_description") String book_description,
			@RequestParam("pic_name") MultipartFile[] book_logo_child,
			@RequestParam("store_count") int store_count,
			@RequestParam("is_new") int is_new,
			@RequestParam("is_hot") int is_hot,
			@RequestParam("status") int status
			)throws Exception{
		
		//获取项目录下的upload目录
		String path=request.getServletContext().getRealPath("/upload");
		
		//将大图文件写入upload目录
		String book_logo_big_name = generatorFileName(book_logo_big.getOriginalFilename());
		File file1=new File(path, book_logo_big_name);
		//如果父目录不存，则自动创建
		file1.getParentFile().mkdirs();
		book_logo_big.transferTo(file1);
		System.out.println("大图："+book_logo_big_name);

		//将小图文件写入upload目录
		String book_logo_small_name = generatorFileName(book_logo_small.getOriginalFilename());
		File file2=new File(path, book_logo_small_name);
		book_logo_small.transferTo(file2);
		System.out.println("小图："+book_logo_small_name);
		
		BookInfo bookInfo=new BookInfo();
		bookInfo.setBook_name(book_name);
		bookInfo.setBook_author(book_author);
		bookInfo.setBook_description(book_description);
		bookInfo.setBook_logo_big(book_logo_big_name);
		bookInfo.setBook_logo_small(book_logo_small_name);
		bookInfo.setBook_press(book_press);
		bookInfo.setBook_price(book_price);
		bookInfo.setBook_price_old(book_price_old);
		bookInfo.setIs_hot(is_hot);
		bookInfo.setIs_new(is_new);
		bookInfo.setStatus(status);
		bookInfo.setStore_count(store_count);
		bookInfo.setType_id(type_id);
		//System.out.println(bookInfo);
		//添加图书
		int book_id=bookBiz.addBook(bookInfo);
		
		//将子图文件写入upload目录
		List<String> bookPicList=new ArrayList<String>();
		if (book_logo_child!=null && book_logo_child.length>0) {
			for (MultipartFile pic_name : book_logo_child) {
				if (pic_name != null && !pic_name.getOriginalFilename().isEmpty()) {
					String book_logo_child_name = generatorFileName(pic_name.getOriginalFilename());
					File file3 = new File(path, book_logo_child_name);
					pic_name.transferTo(file3);
					bookPicList.add(book_logo_child_name);
					System.out.println("子图" + book_logo_child_name);
				}
			}
			
			//插入子图表
			bookBiz.insertBookPicList(book_id, bookPicList);
		}
		
		return "redirect:/book/bookManagerPage";
	}
	
	public String generatorFileName(String FileOldName){
		String randNum=Math.random()+"";
		String randNumStr=randNum.substring(randNum.lastIndexOf(".")+1);
		//使用时间戳和随机数生成新文件名称(存入数据库的名称)
		return new Date().getTime()+randNumStr+ FileOldName.substring(FileOldName.lastIndexOf("."));
	}
	
	@RequestMapping("/selectGarbage/{currentPage}")	
	@CheckLoginRequired
	public  ModelAndView selectGarbage(
			@PathVariable(value="currentPage",required=false) Integer currentPage
			)throws Exception{
			
		ModelAndView model=new ModelAndView();
		int current_page=1;
		if (currentPage!=null) {
			current_page=currentPage;
		}
		int pageSize=10;
		int totalGarbageCount=bookBiz.totalGarbageCount();
		List<BookInfo> garbageList=bookBiz.selectGarbage(current_page, pageSize);
		int totalPage=totalGarbageCount%pageSize==0? totalGarbageCount/pageSize : totalGarbageCount/pageSize+1;
		
		model.addObject("totalCount", totalGarbageCount);
		model.addObject("garbageList", garbageList);
		model.addObject("totalPage", totalPage);
		model.setViewName("garbage");
		
		return model;
	}
	
	@RequestMapping("/updateBook/{book_id}")
	@CheckLoginRequired
	public @ResponseBody ModelAndView updateBook(
			@PathVariable(value="book_id") int bookId)throws Exception{
		
		ModelAndView model=new ModelAndView();
		BookInfo bookInfo=bookBiz.selectBookById(bookId);
		List<TypeInfo> parentTypeList=typeBiz.selectTypeAll();
		List<TypeInfo> childTypeList=typeBiz.selectChildTypeAll();
		List<String> bookPicList=bookBiz.selectBookPicList(bookId);
		model.addObject("bookInfo", bookInfo);
		model.addObject("parentTypeList", parentTypeList);
		model.addObject("childTypeList", childTypeList);
		model.addObject("bookPicList", bookPicList);
		model.setViewName("editbook");
		
		return model;
	}
	
	
	@RequestMapping("/deleteBook/{book_id}")
	@CheckLoginRequired
	public @ResponseBody Map<String, Object> deleteBook(
			@PathVariable("book_id") int bookId)throws Exception{
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		bookBiz.deleteBook(bookId);
		resultMap.put("status", 200);
		
		return resultMap;
	}
	
	@RequestMapping("/deleteGarbage")
	@CheckLoginRequired
	public @ResponseBody Map<String, Object> deleteGarbage(
			@RequestParam(value="is_garbage",required=false) Integer is_garbage,
			@RequestParam(value="bookIdStr",required=false) String bookIdStr
			)throws Exception{
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		List<String> bookIdList=Arrays.asList(bookIdStr.split(","));
		bookBiz.deleteGarbage(bookIdList);
		resultMap.put("status", 200);
		
		return resultMap;
	}
	
	@RequestMapping("/returnGarbage")
	@CheckLoginRequired
	public @ResponseBody Map<String, Object> returnGarbage(
			@RequestParam(value="is_garbage",required=false) Integer is_garbage,
			@RequestParam(value="bookIdStr",required=false) String bookIdStr
			)throws Exception{
		
		Map<String, Object> resultMap=new HashMap<String, Object>();		
		List<String> bookIdList=Arrays.asList(bookIdStr.split(","));
		bookBiz.returnGarbage(bookIdList);
		
		resultMap.put("status", 200);
		
		return resultMap;
	}
	
	@RequestMapping("/updateBookStatus")
	@CheckLoginRequired
	public @ResponseBody Map<String, Object> updateBookStatus(			
			@RequestParam(value="statusStr",required=false) String statusStr,
			@RequestParam(value="bookIdStr",required=false) String bookIdStr
			)throws Exception{
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		
		System.out.println("订单号String："+bookIdStr);
		List<String> bookIdList=Arrays.asList(bookIdStr.split(","));
		System.out.println("订单号List集合："+bookIdList);
		
		if ("garbage".equals(statusStr)) {			
			bookBiz.UpateBookIsGarbage(1, bookIdList);
		}else if("status1".equals(statusStr)){
			bookBiz.UpateBookStatus(1, bookIdList);
		}else if("status1".equals(statusStr)){
			bookBiz.UpateBookStatus(1, bookIdList);
		}else if("status0".equals(statusStr)){
			bookBiz.UpateBookStatus(0, bookIdList);
		}else if("is_new1".equals(statusStr)){
			bookBiz.UpateBookIsNew(1, bookIdList);
		}else if("is_new0".equals(statusStr)){
			bookBiz.UpateBookIsNew(0, bookIdList);
		}else if("is_hot0".equals(statusStr)){
			bookBiz.UpateBookIsHot(0, bookIdList);
		}else if("is_hot1".equals(statusStr)){
			bookBiz.UpateBookIsHot(1, bookIdList);
		}
		
		resultMap.put("status", 200);
		return resultMap;
	}
	
	
	
}
