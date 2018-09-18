package eshop_manager.entity;

import java.io.Serializable;

public class BookInfo implements Serializable{
	
	private static final long serialVersionUID = 3406930835962600439L;
	
	private int book_id;
	private String book_name;
	private String book_logo_small;
	private String book_logo_big;
	private double book_price;
	private double book_price_old;
	private String book_author;
	private String book_description;
	private String book_press;
	private int store_count;
	private int type_id;
	private String book_date;
	private int status;
	private int is_new;
	private int is_hot;
	private int is_garbage;
	private int num;//购物车数量
	private TypeInfo typeInfo;
	
	public BookInfo(){}
	
	
	public BookInfo(int book_id, String book_name, String book_logo_small,
			String book_logo_big, double book_price, double book_price_old,
			String book_author, String book_description, String book_press,
			int store_count, int type_id, String book_date, int status,
			int is_new, int is_hot, int is_garbage, int num) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_logo_small = book_logo_small;
		this.book_logo_big = book_logo_big;
		this.book_price = book_price;
		this.book_price_old = book_price_old;
		this.book_author = book_author;
		this.book_description = book_description;
		this.book_press = book_press;
		this.store_count = store_count;
		this.type_id = type_id;
		this.book_date = book_date;
		this.status = status;
		this.is_new = is_new;
		this.is_hot = is_hot;
		this.is_garbage = is_garbage;
		this.num = num;
	}


	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_logo_small() {
		return book_logo_small;
	}
	public void setBook_logo_small(String book_logo_small) {
		this.book_logo_small = book_logo_small;
	}
	public String getBook_logo_big() {
		return book_logo_big;
	}
	public void setBook_logo_big(String book_logo_big) {
		this.book_logo_big = book_logo_big;
	}
	public double getBook_price() {
		return book_price;
	}
	public void setBook_price(double book_price) {
		this.book_price = book_price;
	}
	public double getBook_price_old() {
		return book_price_old;
	}
	public void setBook_price_old(double book_price_old) {
		this.book_price_old = book_price_old;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_description() {
		return book_description;
	}
	public void setBook_description(String book_description) {
		this.book_description = book_description;
	}
	public String getBook_press() {
		return book_press;
	}
	public void setBook_press(String book_press) {
		this.book_press = book_press;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIs_new() {
		return is_new;
	}
	public void setIs_new(int is_new) {
		this.is_new = is_new;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public int getIs_garbage() {
		return is_garbage;
	}
	public void setIs_garbage(int is_garbage) {
		this.is_garbage = is_garbage;
	}

	public int getStore_count() {
		return store_count;
	}

	public void setStore_count(int store_count) {
		this.store_count = store_count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}


	public TypeInfo getTypeInfo() {
		return typeInfo;
	}


	public void setTypeInfo(TypeInfo typeInfo) {
		this.typeInfo = typeInfo;
	}
	
}
