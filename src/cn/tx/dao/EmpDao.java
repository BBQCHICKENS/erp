package cn.tx.dao;

import cn.tx.model.Emp;
import cn.tx.query.EmpQuery;

import java.util.List;
import java.util.Set;

public interface EmpDao extends BaseDao<Emp, EmpQuery> {
	
	
	public Emp getEmpByUname(String username);
	
	public Emp getEmpByUnameAndPWord(String username, String password);

	/*通过部门id获取员工信息*/
	public List<Emp> getEmpByDept(Integer DeptId);

}
