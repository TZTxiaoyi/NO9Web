
--角色表
--select * from  roletable;
--insert into  roletable values(0,'测试用户',20);
--update roletable set rolestate =20
--delete from roletable where roleid=6;
CREATE TABLE roletable(
       roleid INT(11) PRIMARY KEY NOT NULL COMMENT '角色id' AUTO_INCREMENT,
       rolename VARCHAR(20) NOT NULL COMMENT '角色名称',
       rolestate INT NOT NULL COMMENT '角色状态'
);
--select a.capitalid, a.accountsid, a.ordid, a.projectsid, r.value, a.capital, a.time from capital a,capitaltype r WHERE a.capitalflow=r.key and a.projectsid= 100052 order by capitalid desc
--commit;
--drop SEQUENCE list_user_role;
--员工(用户)角色表 （删除）

create table user_role(
       userid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '角色id',
       empid int(11) COMMENT '员工（用户）id',
       roleid int(11) COMMENT '角色id'
);

--权限表

create table powers(
       powersid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '权限id',
       url varchar(100) not null COMMENT '请求路径' ,
       remarks varchar(10) not null COMMENT '权限备注（可不要）'
);
--角色权限表

create table role_powers(
       rpid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
       roleid int(11) COMMENT '角色id',
       powersid int(11) COMMENT '权限id'
);
--账号表
--序列
--drop table accounts;
create table accounts(
       accountsid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '账号表id',
       accounts varchar(100) not null COMMENT '账号',
       passwords varchar(100) not null COMMENT '密码',
       empid int(11) not null COMMENT '员工（用户）id',
       roleid int(11)  not null COMMENT '角色',
       accountsstate int(11) not null COMMENT '账号状态'
);
--update  accounts set        accounts=qwe                 and empid=10030              and roleid=3              and accountsstate=2         WHERE accountsid=10030
--delete accounts where accountsid=100088
--update accounts set roleid=0 ;
--update accounts set accounts=qwe, passwords=123, empid=10030,roleid=3, accountsstate=2      WHERE accountsid=10030
--select * from accounts;
--insert into accounts values(list_accounts.nextval,'aaa','asadaaa',123,1,4);

--员工(角色)信息表

--select * from accounts ,roletable where accountsstate=2 and  accounts.roleid =roletable.roleid and accounts='zxc';
--select a.accountsid, a.accounts, a.passwords, a.empid, r.rolename, a.accountsstate from accounts a,roletable r WHERE a.accountsstate=2 and a.roleid=r.roleid ;
--insert into employee values(100030,'三门','三门',411111,'男',21,'henan',13444,0.00,4);
--insert into employee values(100048,'三哈','三门',411111,'男',21,'henan',13444,0.00,4);
--delete  employee where empid=100048;
--update employee set
--select * from employee;
--commit
CREATE TABLE employee(
       empid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '员工编号id',
       username VARCHAR(20)  COMMENT '用户名',
       empname VARCHAR(20)  COMMENT '员工/用户名字（真实）',
       idcard VARCHAR(40) COMMENT '身份证号',
       sex VARCHAR(5) COMMENT '性别',
       age INT COMMENT '年龄',
       address VARCHAR(100) COMMENT '地址',
       telephone INT COMMENT '电话',
        balance DECIMAL(8,2) NOT NULL COMMENT '账户余额',
       empstate INT(11) NOT NULL COMMENT '状态'
);

-- 收货地址表（未完成）
/*
  addressid 收货表地址id
  name 收货人姓名
  phone 收货人手机号
  Postcodes 邮编
  addressinfo 收货人详细地址
*/

--select * from address;
create table address(
       addressid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '收货表地址id',
       name varchar(20) COMMENT '收货人姓名',
       phone varchar(18) COMMENT '收货人手机号',
       postcodes VARCHAR(20) COMMENT '邮编',
       addressinfo varchar(100) COMMENT '收货人详细地址'
);

--登录账号关系表(员工和用户共同的账号关系表)
--序列

create table user_table(
       utid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '登录账号关系表id',
       empid int(11) COMMENT '用户或者员工id',
       accountsid int(11) COMMENT '账号id'
);
-- select * from pro_money
--update  pro_money set raise_money = 5000 where money_id=2
--commit;
--项目表
--select * from projects
--update projects set projectsstate=88 where projectsid = 100050
create table projects(
       projectsid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目表id',
       empid int(11) COMMENT '发起人账号id',
       originatortype int COMMENT '发起人类型',
       addtime varchar(50) not null COMMENT '添加时间（项目由发起人发起那一刻开始的时间，未进审核流程）',
       projectsstate int not null COMMENT '项目状态'
);

create table protype(
       protypeid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目类型表id',
       protypename varchar(100) not null COMMENT '项目类型名称'
);

--发起人信息表(个人发起)和机构共用一个序列

create table originator(
       originatorid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '发起人信息表id',
       projectsid number COMMENT '项目id',
       idcard number not null COMMENT '身份证号',
       originatorname varchar(20) not null COMMENT '发起人姓名',
       address varchar(100) COMMENT '地址',
       telephone varchar(18) COMMENT '电话',
       protypeid int COMMENT '项目类型',
       cardimage1 varchar(50) COMMENT '身份证正面图片',
       cardimage2 varchar(50) COMMENT '身份证反面图片',
       poundage int COMMENT '平台渠道费'
);
--发起机构信息表（机构发起）和个人共用一个序列

CREATE TABLE originator(
       originatorid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '发起人信息表id',
       projectsid INT(11) COMMENT '项目id',
       idcard VARCHAR(50) NOT NULL COMMENT '身份证号',
       originatorname VARCHAR(20) NOT NULL COMMENT '发起人姓名',
       address VARCHAR(100) COMMENT '地址',
       telephone VARCHAR(18) COMMENT '电话',
       protypeid INT COMMENT '项目类型',
       cardimage1 VARCHAR(50) COMMENT '身份证正面图片',
       cardimage2 VARCHAR(50) COMMENT '身份证反面图片',
       poundage INT COMMENT '平台渠道费'
);
--项目描述表

create table projects_describe(
       pdid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目描述表id',
       projectsid int(11) COMMENT '项目id',
       title varchar(20) not null COMMENT '标题',
       goal varchar(200) not null COMMENT '筹款目的',
       projects_place varchar(20) not null COMMENT '项目地点',
       financing decimal(9,2)  not null COMMENT '筹资金额',
       financing_day int not null COMMENT '筹资天数',
       cover varchar(50) not null COMMENT '封面'
);
--项目详情表

create table projects_indetail(
       indetailid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目详情表id',
       projectsid int(11) COMMENT '项目id'
);
--项目详情文本表

create table projects_indetail_text(
       textid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '账号表id',
       indetailid int(11) COMMENT '项目id',
       places int(11) COMMENT '项目详情中的地址',
       title varchar(60) COMMENT '文本标题',
       body varchar(4000) COMMENT '文本内容'
);

--项目详情图片表

CREATE TABLE projects_indetail_photo(
       photo INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目详情图片表id',
       indetailid INT(11) COMMENT '项目详情id',
       places INT(11) COMMENT '位置',
       url VARCHAR(100) COMMENT '路径'
);


--项目回报表

--select * from pro_return
create table pro_return(
       pro_returnid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目回报表id',
       projectsid int(11) COMMENT '项目id',
       return_type int(11) COMMENT '回报类型，以来码表',
       offer_money int(11) not null COMMENT '回报金额',
       return_title varchar(50) not null COMMENT '回报标题',
       return_content varchar(300) not null COMMENT '回报内容',
       limit_people int(11) not null COMMENT '限制人数',
       return_time varchar(20) not null COMMENT '回报时间',
       image varchar(50) not null COMMENT '图片'
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


create table recordtable(
       recordtable_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '审核记录表id',
       empid int(11) COMMENT '用户或者员工id',
       projectsid int(11) COMMENT '项目id',
       recordtable_type int(11) not null COMMENT '审核种类',
       recordtable_status int(11) not null COMMENT '审核状态',
       recordtable_begintime varchar(60) not null COMMENT '审核开始时间',
       recordtable_endtime varchar(60) not null COMMENT '审核结束时间'
);
/*银行账户表
account_id 主键id
user_id 用户id
bank_account 银行账户
bank_name 银行名称

*/


create table bank_account(
     bank_account_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '银行账户表id',
     empid int(11) COMMENT '员工（用户）id',
     bank_account varchar(60) not null COMMENT '银行账户',
     bank_name varchar(60) not null COMMENT '银行名称'
);


/*评论表
comment_id 主键id
projectsid  项目id
empid 用户id
content 内容
time 时间
*/

create table commentary(
       commentary_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '账号表id',
       projectsid int(11) COMMENT '项目id',
       empid int(11) COMMENT '员工（用户）id',
       content varchar(1000) not null COMMENT '内容',
       time varchar(100) not null COMMENT '时间'
);
/*消息表
new_id 主键
sendid 发送用户id
newuser 接受用户
newtype 类型
content 内容
time 时间

*/

create table news(
       new_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '消息表id',
       sendid int(11) COMMENT '发送用户id',
       newuser int(11) COMMENT '接受用户id',
       newtype varchar(50) COMMENT '类型',
       content varchar(1000) COMMENT '内容',
       time varchar(100) COMMENT '时间'
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
--select * from orders
--drop table orders
--commit;

create table orders(
       ord_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '订单表id',
       empid int(11) COMMENT '员工（用户）id',
       projectsid int(11) COMMENT '项目id',
       paymoney decimal(9,2) not null COMMENT '码表值',
       fraction int(11) not null COMMENT '份数',
       address int(11) not null COMMENT '引用地址外键',
       order_time date not null COMMENT '订单时间',
       ord_status int(11) not null  COMMENT '订单状态',
       pro_returnid int(11) not null COMMENT '汇报类别id'
);


/*项目管理表
admin_id 主键
user_id  用户id
ord_id 订单id
*/

create table pro_admin(
       admin_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目管理表id',
       empid number COMMENT '员工（用户）id',
       ord_id number COMMENT '订单id'
);

/*交易记录 （账户余额的交易记录）
traid 主键id
user_id 用户id
time 交易时间
money 金额
details 交易详情(码表)
*/
--drop table transaction
--select * from  transaction
create table transaction(
       traid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '交易记录表id',
       empid int(11) COMMENT '员工（用户）id',
       time date not null COMMENT '交易时间',
       money decimal(9,2) not null COMMENT '金额',
       details int(11) not null COMMENT '交易详情(码表)'
);

 --select     money_id,    projectsid,    targe_money,    raise_money     from capital       WHERE  projectsid= 10052                   and targe_money= ?                   and raise_money= ?

/*项目资金表
mon_id 主键id
pro_id 项目id
targe_money 目标金额
raise_money 筹集金额
*/
--select　* from pro_money
create table pro_money(
       money_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目资金表id',
       projectsid int(11) COMMENT '项目id',
       targe_money decimal(9,2) not null COMMENT '目标金额',
       raise_money decimal(9,2) not null COMMENT '筹集金额'
);
--commit;
--update  pro_money set targe_money = 5000.00 where projectsid=100052
/*项目资金操作表( 删除)
hand_id 主键id
mon_id  项目资金表id  引用项目资金表的mon_id
handle 操作详情(引用码表)
hand_money 金额
time 时间
*/
--select * from pro_handle;
--drop table pro_handle;
create table pro_handle(
       hand_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目资金操作表id',
       money_id int(11) COMMENT '项目资金表id  引用项目资金表的mon_id',
       handle int(11) COMMENT '操作详情(引用码表)',
       hand_money decimal(9,2) COMMENT '金额',
       time date COMMENT '时间'
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
--select     a.capitalid,    a.accountsid,    a.ordid,    a.projectsid,    r.value,  a.capital , a.time     from capital a,capitaltype r      WHERE a.capitalflow=r.key
--drop table capital
--select * from capital
--insert into capital values(list_capital.nextval,100087,1,1,2,20.00,to_date('2017-9-11 9:23:33','yyyy-MM-dd HH24:MI:SS'));

create table capital(
       capitalid int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '平台资金表id',
       accountsid int(11) COMMENT '账号id',
       ordid int(11) COMMENT '订单id',
       projectsid int(11)  COMMENT '项目id',
       capitalflow int(11) not null COMMENT '资金动向（什么形式的支出或者收入 引用资金类型表）',
       capital decimal(15,2) COMMENT '资金（number）',
       time date COMMENT '时间'
);
/*平台盈利表
profitid主键id
projectsid项目id
capitalflow资金动向（什么形式的支出或者收入 引用资金类型表）
capital资金（number）
balance剩余资金
time时间

*/
CREATE TABLE profit(
     profitid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '平台盈利表id',
     projectsid INT COMMENT '项目id',
     capitalflow INT(11) COMMENT '资金动向（什么形式的支出或者收入 引用资金类型表）',
     capital DECIMAL(15,2) COMMENT '资金',
     balance DECIMAL(15,2) COMMENT '剩余资金',
     TIME DATE COMMENT '时间'
);

/*
资金流向类型表
key 键
  value 值（流向种类。什么样的收入或者支出）
	remark 备注（解释说明）
  state 状态（引用码表表示被删除）
  */
--update  capitaltype set       state=20        WHERE key=6

--    select key, value, remark  from capitaltype  WHERE state=20 ;
--commit;
--drop table capitaltype
--select * from capitaltype
create table capitaltype (
       `key` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '资金流向类型表id',
       `value` varchar(40) COMMENT '值（流向种类。什么样的收入或者支出）',
       remark varchar (100) COMMENT '备注（解释说明）',
       state int(11) not null COMMENT '状态（引用码表表示被删除）'
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
--select * from pro_back;
--drop table pro_back;
create table pro_back(
       back_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '项目回报记录表id',
       sponsor_id int(11) COMMENT '发起人id',
       support_id int(11) COMMENT '支持人id',
       back_mode int(11) COMMENT '回报方式(码表)',
       ord_id int(11) COMMENT '订单id',
       addressid int(11) COMMENT '收货地址id',
       consignee varchar(30) COMMENT '收货人',
       order_status int(11) COMMENT '回报状态',
       logistics varchar(100) COMMENT '物流信息',
       deliverytime date COMMENT '发货时间'
);

/*
码表
key 键
value 值
*/

CREATE TABLE word(
       `key` INT(11) PRIMARY KEY NOT NULL COMMENT '码表id' AUTO_INCREMENT,
       `value` VARCHAR(40)NOT NULL COMMENT '码表值'
);
--commit;
--select * from word;
--delete from word where key=16;
--insert into  word values(list_word.nextval,'已退款','退款完成');
--insert into  word values(list_word.nextval,'已回报','项目回报完成');
--update word set value='冻结' where key=3
--commit;

