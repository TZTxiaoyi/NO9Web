
--角色表
--序列
CREATE SEQUENCE  list_roletable  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

select * from  roletable;
insert into  roletable values(0,'测试用户',20);
update roletable set rolestate =20
delete from roletable where roleid=6;
create table roletable(
       roleid number primary key,--角色id
       rolename varchar2(20) not null,--角色名称
       rolestate number not null,--角色状态
       constraint cos_roletable_word foreign key(rolestate) references word(key)
);
select a.capitalid, a.accountsid, a.ordid, a.projectsid, r.value, a.capital, a.time from capital a,capitaltype r WHERE a.capitalflow=r.key and a.projectsid= 100052 order by capitalid desc
commit;
drop SEQUENCE list_user_role;
--员工(用户)角色表 （删除）
--序列
CREATE SEQUENCE  list_user_role  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table user_role(
       userid number primary key,--id
       empid number,--员工（用户）id
       constraint cos_user_role_employee foreign key(empid) references employee(empid),
       roleid number,--角色id
       constraint cos_user_role_roletable foreign key(roleid) references roletable(roleid)
);

--权限表
--序列
CREATE SEQUENCE  list_powers  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table powers(
       powersid number primary key,--权限id
       url varchar2(100) not null,--请求路径
       remarks varchar2(10) not null--权限备注（可不要）
);
--角色权限表
--序列
CREATE SEQUENCE  list_role_powers  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table role_powers(
       rpid number primary key,--id
       roleid number,--角色id
       constraint cos_role_powers_roletable foreign key(roleid) references roletable(roleid),
       powersid number,--权限id
       constraint cos_role_powers_powers foreign key(powersid) references powers(powersid)
);
--账号表
--序列
CREATE SEQUENCE  list_accounts  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
commit;
drop table accounts;
create table accounts(
       accountsid number primary key,--id(创建序列)
       accounts varchar2(100) not null,--账号
       CONSTRAINT cos_accounts_only UNIQUE (accounts),
       passwords varchar2(100) not null, --密码
       empid number not null,
       constraint cos_accounts_roletable foreign key(empid) references employee(empid),
       roleid number  not null,--角色
       constraint cos_accounts_roletable foreign key(roleid) references roletable(roleid),

       accountsstate number not null, --账号状态
       constraint cos_accounts_code foreign key(accountsstate) references word(key)

);
update  accounts set        accounts=qwe                 and empid=10030              and roleid=3              and accountsstate=2         WHERE accountsid=10030
delete accounts where accountsid=100088
update accounts set roleid=0 ;
update accounts set accounts=qwe, passwords=123, empid=10030,roleid=3, accountsstate=2      WHERE accountsid=10030
select * from accounts;
insert into accounts values(list_accounts.nextval,'aaa','asadaaa',123,1,4);

--员工(角色)信息表
--序列
CREATE SEQUENCE  list_employee  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

commit;
select * from accounts ,roletable where accountsstate=2 and  accounts.roleid =roletable.roleid and accounts='zxc';
select a.accountsid, a.accounts, a.passwords, a.empid, r.rolename, a.accountsstate from accounts a,roletable r WHERE a.accountsstate=2 and a.roleid=r.roleid ;
insert into employee values(100030,'三门','三门',411111,'男',21,'henan',13444,0.00,4);
insert into employee values(100048,'三哈','三门',411111,'男',21,'henan',13444,0.00,4);
delete  employee where empid=100048;
update employee set
select * from employee;
commit
create table employee(
       empid number primary key,--id(员工编号)
       username varchar2(20)，--用户名
       empname varchar2(20) ,--员工/用户名字（真实）
       idcard varchar2(40),--身份证号
       sex varchar2(5),--性别
       age number,--年龄
       address varchar2(100),--地址
       telephone number, --电话
       balance number(8,2) not null, --账户余额
       empstate number not null,--状态
       constraint cos_employee_word foreign key(empstate) references word(key)
);

-- 收货地址表（未完成）
/*
  addressid 收货表地址id
  name 收货人姓名
  phone 收货人手机号
  Postcodes 邮编
  addressinfo 收货人详细地址
*/
CREATE SEQUENCE  list_address  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select * from address;
create table address(
       addressid number primary key，
       name varchar2(20),
       phone number,
       postcodes number,
       addressinfo varchar2(100)

);

--登录账号关系表(员工和用户共同的账号关系表)
--序列
CREATE SEQUENCE  list_user_table  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table user_table(
       utid number primary key,--id
       empid number,--用户或者员工id
       constraint cos_user_table_employee foreign key(empid) references employee(empid),
       accountsid number,--账号id
       constraint cos_user_table_accounts foreign key(accountsid) references accounts(accountsid)
);
 select * from pro_money
update  pro_money set raise_money = 5000 where money_id=2
commit;
--项目表
--序列
CREATE SEQUENCE list_projects  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select * from projects
update projects set projectsstate=88 where projectsid = 100050
create table projects(
       projectsid number primary key,--id
       empid number,--发起人账号id
       constraint cos_projects_employee foreign key(empid) references employee(empid),

       originatortype number , --发起人类型

       addtime varchar2(50) not null,--添加时间（项目由发起人发起那一刻开始的时间，未进审核流程）
       projectsstate number not null ,--项目状态
       constraint cos_projects_word foreign key(projectsstate) references word(key)

);

--项目类型表
--序列
CREATE SEQUENCE list_protype  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table protype(
       protypeid number primary key,--id
       protypename varchar2(100) not null--项目类型名称
);

--发起人信息表(个人发起)和机构共用一个序列
--序列
CREATE SEQUENCE list_originator  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table originator(
       originatorid number primary key,--id
       projectsid number,--项目id
       constraint cos_originator_projects foreign key(projectsid) references projects(projectsid),
       idcard number not null,--身份证号
       originatorname varchar2(20) not null,--发起人姓名
       address varchar2(100),--地址
       telephone number, --电话
       protypeid number,--项目类型
       constraint cos_originator_protype foreign key(protypeid) references protype(protypeid),
       cardimage1 varchar2(50),--身份证正面图片
       cardimage2 varchar2(50),--身份证反面图片
       poundage number--平台渠道费
);
--发起机构信息表（机构发起）和个人共用一个序列

create table organizations(
       organizationsrid number primary key,--id
       projectsid number,--项目id
       constraint cos_organizations_projects foreign key(projectsid) references projects(projectsid),
       oname varchar2(20) not null,--机构名称
       ocode varchar2(20) not null,--机构代码
       corporation varchar2(10) not null,--法定代表人
       register_address varchar2(100) not null,--机构注册地址
       linkman varchar2(10) not null,--联系人姓名
       linkphone number not null,--联系人手机号
       abbreviation varchar2(10) not null, --机构简称
       business_address varchar2(100) not null,--机构经营地址
       protypeid number,--项目类型
       constraint cos_organizations_protype foreign key(protypeid) references protype(protypeid),
       poundage number--平台渠道费
);
--项目描述表
--序列
CREATE SEQUENCE list_projects_describe  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table projects_describe(
       pdid number primary key,--id
       projectsid number,--项目id
       constraint cos_projects_describe_projects foreign key(projectsid) references projects(projectsid),
       title varchar2(20) not null,--标题
       goal varchar2(200) not null,--筹款目的
       projects_place varchar2(20) not null,--项目地点
       financing number not null,--筹资金额
       financing_day number not null,--筹资天数
       cover varchar2(50) not null --封面
);
--项目详情表
--序列
CREATE SEQUENCE list_projects_indetail --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table projects_indetail(
       indetailid number primary key,--id
       projectsid number,--项目id
       constraint cos_projects_indetail_projects foreign key(projectsid) references projects(projectsid)
);
--项目详情文本表
--序列
CREATE SEQUENCE list_projects_indetail_text --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table projects_indetail_text(
       textid number primary key,--id
       indetailid number,--项目id
       constraint cos_projects_indetail_text foreign key(indetailid) references projects_indetail(indetailid),
       places number, --项目详情中的地址
       title varchar(60),--文本标题
       body varchar(4000) --文本内容
);

--项目详情图片表
--序列
CREATE SEQUENCE list_projects_indetail_photo --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table projects_indetail_photo(
       photo number primary key,
       indetailid number, --项目详情id
       constraint cos_projects_indetail_photo foreign key(indetailid) references projects_indetail(indetailid),
       places number,
       url varchar2(100)

);

--项目回报表
--序列
CREATE SEQUENCE list_pro_return  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select * from pro_return
create table pro_return(
       pro_returnid number primary key,--id
       projectsid number,--项目id
       constraint cos_pro_return_projects foreign key(projectsid) references projects(projectsid),
       return_type number,--回报类型，以来码表
       constraint cos_pro_return_word foreign key(return_type) references word(key),

       offer_money number not null,--回报金额
       return_title varchar2(50) not null,--回报标题
       return_content varchar2(300) not null,--回报内容
       limit_people number not null,--限制人数
       return_time varchar2(20) not null,--回报时间
       image varchar2(50) not null --图片
);

/*审核记录表
recordtable_id  主键id
empid 审批员工id
pro_id 项目id
recordtable_type 审核种类
recordtable_status 审核状态
recordtable_begintime 审核开始时间
recordtable_endtime 审核结束时间
*/
--序列
CREATE SEQUENCE list_recordtable  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table recordtable(
       recordtable_id number primary key,
       empid number,--用户或者员工id
       constraint cos_recordtable_employee foreign key(empid) references employee(empid),
       projectsid number,--项目id
       constraint cos_recordtable_projects foreign key(projectsid) references projects(projectsid),
       recordtable_type number not null,
       constraint cos_recordtable_word foreign key(audit_type) references word(key),
       recordtable_status number not null,
       constraint cos_recordtable_word foreign key(audit_status) references word(key),
       recordtable_begintime varchar2(60) not null,
       recordtable_endtime varchar2(60) not null
);
/*银行账户表
account_id 主键id
user_id 用户id
bank_account 银行账户
bank_name 银行名称

*/
--序列
CREATE SEQUENCE list_account  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table bank_account(
     bank_account_id number primary key,
     empid number,--员工（用户）id
     constraint ets foreign key(empid) references employee(empid),
     bank_account varchar2(60) not null,
     bank_name varchar2(60) not null
);


/*评论表
comment_id 主键id
projectsid  项目id
empid 用户id
content 内容
time 时间
*/
--序列
CREATE SEQUENCE list_commentary  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10

create table commentary(
       commentary_id number primary key,
       projectsid number,--项目id
       constraint cos_commentary_projects foreign key(projectsid) references projects(prid),
       empid number,--员工（用户）id
       constraint cos_commentary_employee foreign key(empid) references employee(empid),
       content varchar2(1000) not null，
       time varchar2(100) not null
);
/*消息表
new_id 主键
sendid 发送用户id
newuser 接受用户
newtype 类型
content 内容
time 时间

*/
--序列
CREATE SEQUENCE list_news  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table news(
       new_id number primary key,
       sendid number,
       constraint cos_news_sendid_employee foreign key(sendid) references employee(empid),

       newuser number,
       constraint cos_news_newuser_employee foreign key(newuser) references employee(empid),

       newtype varchar2(50),
       content varchar2(1000),
       time varchar2(100)
);
/*我的订单表   （参与众筹的订单）
ord_id 主键
user_id 用户id
project_id 项目id
paymoney 支付总金额
fraction 份数
ord_status 订单状态
pro_returnid 回报项id
*/
--序列
CREATE SEQUENCE list_orders  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
MAXVALUE   200000       -- 最大值  200000
MINVALUE   100000      --最小值100000
CYCLE               -- 循环
CACHE 10;
select * from orders
drop table orders
commit;

create table orders(
       ord_id number primary key,
       empid number,--员工（用户）id
       constraint cos_orders_employee foreign key(empid) references employee(empid),
       projectsid number,--项目id
       constraint cos_orders_projects foreign key(projectsid) references projects(projectsid),
       paymoney number(9,2) not null,
       fraction number not null,--份数

       address number not null, --引用地址外键
       constraint cos_orders_address foreign key(address) references address(addressid),
       order_time date not null, --订单时间

       ord_status number not null , -- 订单状态
       constraint cos_orders_word foreign key(ord_status) references word(key),
       pro_returnid number not null, -- 汇报类别
       constraint cos_orders_pro_return foreign key(pro_returnid) references pro_return(pro_returnid),
       address number --地址外键
);


/*项目管理表
admin_id 主键
user_id  用户id
ord_id 订单id
*/
--序列
CREATE SEQUENCE list_pro_admin  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;

create table pro_admin(
       admin_id number primary key,
       empid number,--员工（用户）id
       constraint cos_pro_admin_employee foreign key(empid) references employee(empid),
       ord_id number,
       constraint cos_pro_admin_orders foreign key(ord_id) references orders(ord_id)

);

/*交易记录 （账户余额的交易记录）
traid 主键id
user_id 用户id
time 交易时间
money 金额
details 交易详情(码表)
*/
--序列
CREATE SEQUENCE list_Transaction  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
drop table transaction
select * from  transaction
create table transaction(
       traid number primary key,
       empid number,--员工（用户）id
       constraint cos_transaction_employee foreign key(empid) references employee(empid),
       time date not null,
       money number(9,2) not null,
       details number not null,
       constraint cos_transaction_word foreign key(details) references word(key)

);

 select     money_id,    projectsid,    targe_money,    raise_money     from capital       WHERE  projectsid= 10052                   and targe_money= ?                   and raise_money= ?

/*项目资金表
mon_id 主键id
pro_id 项目id
targe_money 目标金额
raise_money 筹集金额
*/
--序列
CREATE SEQUENCE list_pro_money  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select　* from pro_money
create table pro_money(
       money_id number primary key,
       projectsid number,--项目id
       constraint cos_pro_money_projects foreign key(projectsid) references projects(projectsid),
       targe_money number(9,2) not null,
       raise_money number(9,2) not null
);
commit;
update  pro_money set targe_money = 5000.00 where projectsid=100052
/*项目资金操作表( 删除)
hand_id 主键id
mon_id  项目资金表id  引用项目资金表的mon_id
handle 操作详情(引用码表)
hand_money 金额
time 时间
*/
--序列
CREATE SEQUENCE list_pro_handle  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select * from pro_handle;
drop table pro_handle;
create table pro_handle(
       hand_id number primary key,
       money_id number,
       foreign key (money_id) references pro_money(money_id),
       handle number,
       foreign key (handle) references word(key),

       hand_money number(9,2),
       time date
);

/* 平台资金表
  capitalid主键id
 accountsid 账号id
 ordid 订单id
 projectsid 项目id
 capitalflow 资金动向（什么形式的支出或者收入 引用资金类型表）
 capital 资金（number）
  time时间
*/
--序列

CREATE SEQUENCE list_capital  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select     a.capitalid,    a.accountsid,    a.ordid,    a.projectsid,    r.value,  a.capital , a.time     from capital a,capitaltype r      WHERE a.capitalflow=r.key
drop table capital
select * from capital
insert into capital values(list_capital.nextval,100087,1,1,2,20.00,to_date('2017-9-11 9:23:33','yyyy-MM-dd HH24:MI:SS'));

create table capital(
       capitalid number primary key,
       accountsid number,
       ordid number,
       projectsid number ,
       capitalflow number not null,
       capital number(15,2),
       time date
);
/*平台盈利表
profitid主键id
projectsid项目id
capitalflow资金动向（什么形式的支出或者收入 引用资金类型表）
capital资金（number）
balance剩余资金
time时间

*/
--序列
CREATE SEQUENCE list_profit  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
create table profit(
     profitid number    primary key,
     projectsid number,
     capitalflow number,
     capital number(15,2),
     balance number(15,2),
     time date

);

/*
资金流向类型表
key 键
  value 值（流向种类。什么样的收入或者支出）
	remark 备注（解释说明）
  state 状态（引用码表表示被删除）
  */
CREATE SEQUENCE list_capitaltype  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
update  capitaltype set       state=20        WHERE key=6

    select key, value, remark  from capitaltype  WHERE state=20 ;
commit;
drop table capitaltype
select * from capitaltype
create table capitaltype (
       key number primary key ,
       value varchar(40),
       remark varchar (100),
       state number not null
);

/*项目回报记录表
 back_id 主键id
 sponsor_id 发起人id
support_id 支持人id
back_mode 回报方式(码表)

ord_id 订单id
addressid  收货地址id

order_status 回报状态
logistics 物流信息
deliverytime 发货时间
*/
--序列
CREATE SEQUENCE list_pro_back  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 100001       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;
select * from pro_back;
drop table pro_back;
create table pro_back(
       back_id number primary key,
       sponsor_id number,--员工（用户）id
       constraint  cos_pro_back_sponsor_employee foreign key(sponsor_id) references employee(empid),
       support_id number,
       constraint cos_pro_back_support_employee foreign key(support_id) references employee(empid),
       back_mode number,
       foreign key (back_mode) references word(key),

       ord_id number,
       constraint cos_pro_back_orders foreign key(ord_id) references orders(ord_id),

       addressid number,
       constraint cos_pro_back_address foreign key(addressid) references address(addressid),

       consignee varchar2(30), --收货人
       order_status number,
       logistics varchar2(100),
       deliverytime date
);

/*
码表
key 键
value 值
*/
CREATE SEQUENCE list_word  --序列名
INCREMENT BY 1   -- 每次加几个
START WITH 1       -- 从1开始计数
NOMAXVALUE        -- 不设置最大值
NOCYCLE               -- 一直累加，不循环
CACHE 10;


create table word(
       key number primary key ,
       value varchar(40)
);
commit;
select * from word;
delete from word where key=16;
insert into  word values(list_word.nextval,'已退款','退款完成');
insert into  word values(list_word.nextval,'已回报','项目回报完成');
update word set value='冻结' where key=3
commit;

