package pers.deng.DatangTelecom.web.util;

import java.util.List;

public class PageBean<T> {
	private List<T> data;//用于保存查询数据
	private T data1;
	private int recordCount;//记录总数
	private int pageNo;//页码
	private int pageSize;//页大小
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public List<T> getData() {
		return data;
	}


	public void setData(List<T> data) {
		this.data = data;
	}


	public T getData1() {
		return data1;
	}


	public void setData1(T data1) {
		this.data1 = data1;
	}


	public int getRecordCount() {
		return recordCount;
	}


	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}


	public int getPageNo() {
		return pageNo;
	}


	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	//记录总数加每页大小-1/每页大小得出页码
	public int getTotalCount(){
		return (recordCount+pageSize-1)/pageSize;
	}
	
	//首页不管什么情况都是1
	public int getHomePage(){
		return 1;
	}
	
	public int getTrailerPage(){
		if(recordCount==0){//没记录的情况下就是第一页
			return 1;
		}
		//正常情况下就是最后一页
		return this.getTotalCount();
	}
	
	//获取前一页
		public int getPreviousPage(){
			if(this.pageNo==1){
				return this.pageNo;//第一页就是首页了，所以返回当前页
			}
			return this.pageNo-1;
		}
		
		//获取后一页
		public int getNextPage(){
			if(this.pageNo==this.getTotalCount()){//当前页面等于最后一页就无法再去往下一页了
				return this.pageNo;
			}
			return this.pageNo+1;
		}
	
}
