--drop table d_role;
--drop sequence seq_d_role;
--drop trigger trigger_seq_d_role;

create table d_role--角色表
(
 role_id   number primary key,--角色编号，主键序列
 role_name varchar2(20) not null,--角色名称
  role_desc varchar2(30) not null--角色描述
);


create sequence seq_d_role;--创建序列

create or replace trigger trigger_seq_d_role
before insert on d_role
for each row
begin
select seq_d_role.nextval into :new.role_id from dual;
end trigger_seq_d_role;
/



create table d_employee--员工
(
  employee_id   number primary key,    --员工编号，主键序列
  employee_name varchar2(20) not null,  --用户名称，
  password      varchar2(10) not null,    --密码，
  real_name     varchar2(20) not null,    --真实姓名，
  sex           varchar2(4) not null,    --性别
  birthday      date,        --出生年月
  duty          varchar2(30) not null,    --职位信息
  enrolldate    date not null,      --入职时间
  education     varchar2(30) not null,    --学历信息
  major         varchar2(30) not null,		--专业信息
  experience    varchar2(30) not null,		--行业经验
  role_id       number references d_role(role_id),	--外键，所属角色，引用角色编号
  parent_id     number	references  d_employee(employee_id)--外键，主管，引用员工编号
);

create sequence seq_d_employee;--创建序列

create or replace trigger trigger_seq_d_employee
before insert on d_employee
for each row
begin
select seq_d_employee.nextval into :new.employee_id from dual;
end trigger_seq_d_employee;
/


create table d_task--任务
(
  task_id         number primary key,		--任务编号，主键序列
  task_name       varchar2(50),		--任务名称
  begin_date      date,			--开始时间
  end_date        date,			--结束时间
  real_begin_date date,			--实际开始时间
  real_end_date   date,			--实际结束时间
  status          varchar2(10),		--任务状态
  implementor_id  number references d_employee(employee_id),	--外键，实施人编号，引用员工编号
  assigner_id     number references d_employee(employee_id),		--外键，分配人编号，引用员工编号
  task_desc       varchar2(100)		--任务描述
);


create sequence seq_d_task;--创建序列

create or replace trigger trigger_seq_d_task
before insert on d_task
for each row
begin
select seq_d_task.nextval into :new.task_id from dual;
end trigger_seq_d_task;
/


create table d_plan--计划
(
  plan_id       number primary key,		--计划编号，主键序列
  plan_name     varchar2(50),	--计划名称
  status        varchar2(10),		--计划状态
  is_feedback   varchar2(5),	--是否反馈
  begin_date    date,			--开始时间
  end_date      date,			--结束时间
  task_id       number references d_task(task_id),	--外键，所属任务，引用任务编号
  feedback_info varchar2(100),	--反馈信息
  plan_desc     varchar2(100)		--计划描述
);


create sequence seq_d_plan;--创建序列

create or replace trigger trigger_seq_d_plan
before insert on d_plan
for each row
begin
select seq_d_plan.nextval into :new.plan_id from dual;
end trigger_seq_d_plan;
/

