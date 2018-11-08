/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018-11-05 18:04:42                          */
/*==============================================================*/


drop table if exists affiche;

drop table if exists inv_bor;

drop table if exists invests;

drop table if exists system_message;

drop table if exists t_borrowing_money;

drop table if exists t_interest_rate;

drop table if exists t_prize;

drop table if exists t_repay_money;

drop table if exists t_repay_type;

drop table if exists t_third_platform;

drop table if exists t_user_state;

drop table if exists third_account;

drop table if exists user;

/*==============================================================*/
/* Table: affiche                                               */
/*==============================================================*/
create table affiche
(
   affiche_id           varchar(32) not null,
   affiche_title        varchar(32) not null,
   release_time         timestamp,
   create_time          timestamp,
   affiche_body         text,
   affiche_type         tinyint(1),
   affiche_hits         int(11),
   primary key (affiche_id)
)
type = InnoDB;

alter table affiche comment '公告表';

/*==============================================================*/
/* Table: inv_bor                                               */
/*==============================================================*/
create table inv_bor
(
   user_id              varchar(32) comment '投资人id',
   invest_id            varchar(32) comment '投资信息id',
   investor_money       double(11,2) comment '投资金额'
)
type = InnoDB;

alter table inv_bor comment '投标关系表';

/*==============================================================*/
/* Table: invests                                               */
/*==============================================================*/
create table invests
(
   invest_id            varchar(32) not null comment '投资信息id',
   invest_project       varchar(50) comment '投资项目',
   interest_rate_id     double(4,2) comment '利率',
   invest_deadline      int(2) comment '借款期限',
   repayment_mode       varchar(50) comment '还款方式',
   invest_time          datetime comment '投资时间',
   user_id              varchar(32) comment '借款人id',
   primary key (invest_id)
)
type = InnoDB;

alter table invests comment '投资表';

/*==============================================================*/
/* Table: system_message                                        */
/*==============================================================*/
create table system_message
(
   sm_id                varchar(32) not null,
   user_id              varchar(32),
   sm_title             varchar(32),
   release_time         timestamp,
   affiche_body         text,
   primary key (sm_id)
)
type = InnoDB;

alter table system_message comment '系统信息表';

/*==============================================================*/
/* Table: t_borrowing_money                                     */
/*==============================================================*/
create table t_borrowing_money
(
   borrowing_id         varchar(32) not null comment '主键',
   user_id              varchar(32) comment '用户id',
   borrowing_amount     varchar(32) comment '借款金额',
   loan_term            varchar(32) comment '进款期限',
   create_time          date comment '借款时间',
   guarantee            varchar(32) comment '抵押物',
   interest_rate_id     varchar(32) comment '利率',
   woker_indo           text comment '借款人工作情况',
   property_info        text comment '资产介绍',
   use_info             text comment '资金用途',
   primary key (borrowing_id)
)
type = InnoDB;

alter table t_borrowing_money comment '借款表';

/*==============================================================*/
/* Table: t_interest_rate                                       */
/*==============================================================*/
create table t_interest_rate
(
   interest_rate_id     varchar(32) not null,
   interrest_rate       double(4.2),
   primary key (interest_rate_id)
)
type = InnoDB;

alter table t_interest_rate comment '利率表';

/*==============================================================*/
/* Table: t_prize                                               */
/*==============================================================*/
create table t_prize
(
   prize_id             varchar(32) not null comment '红包id,主键',
   prize_name           varchar(20) comment '红包名称',
   prize_content        varchar(50) comment '红包简介',
   prize_last_time      varchar(15) comment '红包截止日期',
   prize_state          tinyint(1) comment '0未使用，1已使用,2已过期',
   user_id              varchar(11) comment '用户id，关联用户',
   primary key (prize_id)
)
type = InnoDB;

alter table t_prize comment '红包表
';

/*==============================================================*/
/* Table: t_repay_money                                         */
/*==============================================================*/
create table t_repay_money
(
   repay_id             varchar(32) not null comment '主键',
   user_id              varchar(32) comment '还款人id',
   repay_amount         varchar(32) comment '还款金额',
   repay_type_id        varchar(32) comment '还款方式表外键',
   repay_state          varchar(32) comment '还款状态  0 代表未还款 1代表还款中  2代表已还清 3表示逾期',
   repay_time           date comment '还款日期',
   balance              varchar(32) comment '剩余金额',
   primary key (repay_id)
)
type = InnoDB;

alter table t_repay_money comment '还款表';

/*==============================================================*/
/* Table: t_repay_type                                          */
/*==============================================================*/
create table t_repay_type
(
   repay_id             varchar(32) not null comment '主键
            ',
   repay_name           varchar(32) comment '还款方式
            ',
   primary key (repay_id)
)
type = InnoDB;

alter table t_repay_type comment '还款方式';

/*==============================================================*/
/* Table: t_third_platform                                      */
/*==============================================================*/
create table t_third_platform
(
   third_id             varchar(32) not null,
   user_type_id         varchar(32) comment '0 表示借款  1 表示还款',
   create_time          date comment '还款时间',
   repay_amount         varchar(32) comment '还款金额
            ',
   primary key (third_id)
)
type = InnoDB;

alter table t_third_platform comment '借还表';

/*==============================================================*/
/* Table: t_user_state                                          */
/*==============================================================*/
create table t_user_state
(
   user_state_id        varchar(32) not null comment '主键',
   user_state           varchar(32) comment '0 表示借款人 1 表示还款人',
   primary key (user_state_id)
)
type = InnoDB;

alter table t_user_state comment '用户状态表';

/*==============================================================*/
/* Table: third_account                                         */
/*==============================================================*/
create table third_account
(
   id                   varchar(32) not null comment '第三方账户主键',
   user_id              varchar(32) comment '用户id',
   real_name            varchar(20) comment '真实姓名',
   ID_number            varchar(32) comment '身份证',
   total_account        double(11,2),
   interest_principal   double(11,2),
   accumulated_income   double(11,2),
   primary key (id)
)
type = InnoDB;

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              varchar(32) not null,
   user_name            varchar(20),
   password             varchar(20),
   phone_number         varchar(11),
   referrer             varchar(20) comment '推荐人',
   primary key (user_id)
)
type = InnoDB;

alter table user comment '用户表';

