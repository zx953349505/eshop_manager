package eshop_manager.entity;

import java.io.Serializable;

public class IpInfo implements Serializable{
	
	private static final long serialVersionUID = 8478722817240396749L;
	
	private String ip_address;
	private int count;
	private String time;
	
	
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
