package pers.deng.DatangTelecom.data.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import pers.deng.DatangTelecom.data.bean.Role;


public interface IRoleDao {
	/**
	 * 查询所有权限
	 * @return
	 */
	public List<Role> queryAllRole();
	
	
	/**
	 * 根据id查询权限
	 * @return
	 */
	public Role queryRoleByID(int id);
}
