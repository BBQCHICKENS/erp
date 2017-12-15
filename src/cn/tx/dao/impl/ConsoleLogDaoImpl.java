package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.ConsoleLogDao;
import cn.tx.model.ConsoleLog;
import cn.tx.query.ConsoleLogQuery;

public class ConsoleLogDaoImpl extends BaseDaoImpl<ConsoleLog, ConsoleLogQuery> implements ConsoleLogDao {

	@Override
	public String createHql(ConsoleLogQuery query) {
		String hql = "from ConsoleLog t where 1=1 ";
		hql=hql+createHqlCondition(query);
		return hql;
	}

	@Override
	public String createHqlCount(ConsoleLogQuery q) {
		String hql = "select count(logId) from ConsoleLog t where 1=1 ";
		hql=hql+createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(ConsoleLogQuery q) {
		String hql = "";
		if(StringUtils.isNotBlank(q.getTableName())){
			hql = hql + " and t.tableName like :tableName";
		}
		if(StringUtils.isNotBlank(q.getOptType())){
			hql = hql + " and t.optType like :optType";
		}
		if(q.getEntityId()!=null){
			hql = hql + " and t.entityId = :entityId";
		}
		return hql;
	}
	

}
