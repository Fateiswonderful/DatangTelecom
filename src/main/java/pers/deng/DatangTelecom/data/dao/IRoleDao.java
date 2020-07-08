package pers.deng.DatangTelecom.data.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import pers.deng.DatangTelecom.data.bean.Role;


public interface IRoleDao {
	/**
	 * ��ѯ����Ȩ��
	 * @return
	 */
	public List<Role> queryAllRole();
	
	
	/**
	 * ����id��ѯȨ��
	 * @return
	 */
	public Role queryRoleByID(int id);
}
