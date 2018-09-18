package eshop_manager.entity;

import java.io.Serializable;

public class AddressInfo implements Serializable{

	private static final long serialVersionUID = 2589433879820630851L;
	
	private String id;
	private String name;
	
	public AddressInfo() {}
	public AddressInfo(String id, String name) {
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
