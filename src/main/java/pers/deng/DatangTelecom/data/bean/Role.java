package pers.deng.DatangTelecom.data.bean;

public class Role {
	private int role_Id;//角色编号，主键序列
	private String role_Name;//角色名称
	private String role_Desc;//角色描述
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Role(int role_Id, String role_Name, String role_Desc) {
		super();
		this.role_Id = role_Id;
		this.role_Name = role_Name;
		this.role_Desc = role_Desc;
	}
	public int getRole_Id() {
		return role_Id;
	}
	public void setRole_Id(int role_Id) {
		this.role_Id = role_Id;
	}
	public String getRole_Name() {
		return role_Name;
	}
	public void setRole_Name(String role_Name) {
		this.role_Name = role_Name;
	}
	public String getRole_Desc() {
		return role_Desc;
	}
	public void setRole_Desc(String role_Desc) {
		this.role_Desc = role_Desc;
	}
	@Override
	public String toString() {
		return "Role [role_Id=" + role_Id + ", role_Name=" + role_Name
				+ ", role_Desc=" + role_Desc + "]";
	}
	
	
	
	
	
}
