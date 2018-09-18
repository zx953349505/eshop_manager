package eshop_manager.entity;

import java.io.Serializable;

public class TypeInfo implements Serializable{
	
	private static final long serialVersionUID = -1391788386206736057L;
	
	private int type_id;
	private String type_name;
	private int parent_id;
	@Override
	public String toString() {
		return "TypeInfo [type_id=" + type_id + ", type_name=" + type_name
				+ ", parent_id=" + parent_id + "]";
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public TypeInfo(){}
	
	public TypeInfo(int type_id, String type_name) {
		super();
		this.type_id = type_id;
		this.type_name = type_name;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
}
