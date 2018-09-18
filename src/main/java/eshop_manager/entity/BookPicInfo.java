package eshop_manager.entity;

import java.io.Serializable;

public class BookPicInfo implements Serializable{

	private static final long serialVersionUID = 5446391384258361405L;
	
	private int pic_id;
	private int book_id;
	private String pic_name;
	
	public BookPicInfo() {}
	public BookPicInfo(int pic_id, int book_id, String pic_name) {
		super();
		this.pic_id = pic_id;
		this.book_id = book_id;
		this.pic_name = pic_name;
	}
	public int getPic_id() {
		return pic_id;
	}
	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	
	
	
}
