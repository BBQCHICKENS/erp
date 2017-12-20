package cn.tx.service;

import cn.tx.model.Role;
import cn.tx.query.RoleQuery;

public interface RoleService extends BaseService<Role, RoleQuery> {
    public  Role  getRoleByRoleName(String roleName);
    public void updateGrantPerm(Integer roleId,String permIds);
}
