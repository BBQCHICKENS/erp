package cn.tx.controller;

import java.util.List;

import cn.tx.model.ConsoleLog;
import cn.tx.query.ConsoleLogQuery;
import cn.tx.service.ConsoleLogService;
import cn.tx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class ConsoleLogAction extends BaseAction {
	
	
	private ConsoleLogQuery query = new ConsoleLogQuery();
	
	public ConsoleLogQuery getQuery() {
		return query;
	}

	public void setQuery(ConsoleLogQuery query) {
		this.query = query;
	}

	private ConsoleLogService consoleLogService;
	
	
	
	
	
	public ConsoleLogService getConsoleLogService() {
		return consoleLogService;
	}

	public void setConsoleLogService(ConsoleLogService consoleLogService) {
		this.consoleLogService = consoleLogService;
	}


	public String consoleLog_log() throws  Exception{
		
		ActionContext context = ActionContext.getContext();
		Integer pageNo = query.getPageNo();
		if(pageNo == null ){
			query.setPageNo(1);
		}
//		String  note =new String(query.getNote().getBytes("ISO-8859-1"),"UTF-8");
//		query.setNote(note);
		String  optType =new String(query.getOptType().getBytes("ISO-8859-1"),"UTF-8");
//		query.setNote(note);
		query.setOptType(optType);
		exclude.add("orderChecker");
		Page page = consoleLogService.queryObjByCondition(query, exclude);
		context.put("page", page);
		return SUCCESS;
	}
	
	public String consoleLog_input(){
		return SUCCESS;
	}
	
	
}
