package eshop_manager.entity;

import java.io.Serializable;

public class OrderDetailInfo implements Serializable{
	
	private static final long serialVersionUID = 3724019599302738647L;
	
	private String order_id;
	private int book_id;
	private int num;
	private BookInfo bookInfo;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public BookInfo getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(BookInfo bookInfo) {
		this.bookInfo = bookInfo;
	}
	@Override
	public String toString() {
		return "OrderDetailInfo [order_id=" + order_id + ", book_id=" + book_id
				+ ", num=" + num + ", bookInfo=" + bookInfo + "]";
	}
	
	
	
	
	
}
