package eshop_manager.entity;

import java.io.Serializable;

public class RoleInfo implements Serializable{
 
	private static final long serialVersionUID = -2644646303402634459L;
	private int role_id;
	private String role_name;
	
	
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
}
