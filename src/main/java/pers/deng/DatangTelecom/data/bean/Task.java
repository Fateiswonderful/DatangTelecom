package pers.deng.DatangTelecom.data.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Task {
	private int task_Id;		//任务编号，主键序列
	private String task_Name;		//任务名称
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date begin_Date;			//开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_Date;			//结束时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date real_Begin_Date;			//实际开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date real_End_Date;			//实际结束时间
	private String status;		//任务状态
	private int implementor_Id;	//外键，实施人编号，引用员工编号
	private int assigner_Id;		//外键，分配人编号，引用员工编号
	private String task_Desc;		//任务描述
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Task(int task_Id, String task_Name, Date begin_Date, Date end_Date,
			Date real_Begin_Date, Date real_End_Date, String status,
			int implementor_Id, int assigner_Id, String task_Desc) {
		super();
		this.task_Id = task_Id;
		this.task_Name = task_Name;
		this.begin_Date = begin_Date;
		this.end_Date = end_Date;
		this.real_Begin_Date = real_Begin_Date;
		this.real_End_Date = real_End_Date;
		this.status = status;
		this.implementor_Id = implementor_Id;
		this.assigner_Id = assigner_Id;
		this.task_Desc = task_Desc;
	}
	public int getTask_Id() {
		return task_Id;
	}
	public void setTask_Id(int task_Id) {
		this.task_Id = task_Id;
	}
	public String getTask_Name() {
		return task_Name;
	}
	public void setTask_Name(String task_Name) {
		this.task_Name = task_Name;
	}
	public Date getBegin_Date() {
		return begin_Date;
	}
	public void setBegin_Date(Date begin_Date) {
		this.begin_Date = begin_Date;
	}
	public Date getEnd_Date() {
		return end_Date;
	}
	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}
	public Date getReal_Begin_Date() {
		return real_Begin_Date;
	}
	public void setReal_Begin_Date(Date real_Begin_Date) {
		this.real_Begin_Date = real_Begin_Date;
	}
	public Date getReal_End_Date() {
		return real_End_Date;
	}
	public void setReal_End_Date(Date real_End_Date) {
		this.real_End_Date = real_End_Date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getImplementor_Id() {
		return implementor_Id;
	}
	public void setImplementor_Id(int implementor_Id) {
		this.implementor_Id = implementor_Id;
	}
	public int getAssigner_Id() {
		return assigner_Id;
	}
	public void setAssigner_Id(int assigner_Id) {
		this.assigner_Id = assigner_Id;
	}
	public String getTask_Desc() {
		return task_Desc;
	}
	public void setTask_Desc(String task_Desc) {
		this.task_Desc = task_Desc;
	}
	@Override
	public String toString() {
		return "Task [task_Id=" + task_Id + ", task_Name=" + task_Name
				+ ", begin_Date=" + begin_Date + ", end_Date=" + end_Date
				+ ", real_Begin_Date=" + real_Begin_Date + ", real_End_Date="
				+ real_End_Date + ", status=" + status + ", implementor_Id="
				+ implementor_Id + ", assigner_Id=" + assigner_Id
				+ ", task_Desc=" + task_Desc + "]";
	}
	
	
	
	
}
