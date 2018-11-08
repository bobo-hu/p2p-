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

alter table affiche comment '�����';

/*==============================================================*/
/* Table: inv_bor                                               */
/*==============================================================*/
create table inv_bor
(
   user_id              varchar(32) comment 'Ͷ����id',
   invest_id            varchar(32) comment 'Ͷ����Ϣid',
   investor_money       double(11,2) comment 'Ͷ�ʽ��'
)
type = InnoDB;

alter table inv_bor comment 'Ͷ���ϵ��';

/*==============================================================*/
/* Table: invests                                               */
/*==============================================================*/
create table invests
(
   invest_id            varchar(32) not null comment 'Ͷ����Ϣid',
   invest_project       varchar(50) comment 'Ͷ����Ŀ',
   interest_rate_id     double(4,2) comment '����',
   invest_deadline      int(2) comment '�������',
   repayment_mode       varchar(50) comment '���ʽ',
   invest_time          datetime comment 'Ͷ��ʱ��',
   user_id              varchar(32) comment '�����id',
   primary key (invest_id)
)
type = InnoDB;

alter table invests comment 'Ͷ�ʱ�';

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

alter table system_message comment 'ϵͳ��Ϣ��';

/*==============================================================*/
/* Table: t_borrowing_money                                     */
/*==============================================================*/
create table t_borrowing_money
(
   borrowing_id         varchar(32) not null comment '����',
   user_id              varchar(32) comment '�û�id',
   borrowing_amount     varchar(32) comment '�����',
   loan_term            varchar(32) comment '��������',
   create_time          date comment '���ʱ��',
   guarantee            varchar(32) comment '��Ѻ��',
   interest_rate_id     varchar(32) comment '����',
   woker_indo           text comment '����˹������',
   property_info        text comment '�ʲ�����',
   use_info             text comment '�ʽ���;',
   primary key (borrowing_id)
)
type = InnoDB;

alter table t_borrowing_money comment '����';

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

alter table t_interest_rate comment '���ʱ�';

/*==============================================================*/
/* Table: t_prize                                               */
/*==============================================================*/
create table t_prize
(
   prize_id             varchar(32) not null comment '���id,����',
   prize_name           varchar(20) comment '�������',
   prize_content        varchar(50) comment '������',
   prize_last_time      varchar(15) comment '�����ֹ����',
   prize_state          tinyint(1) comment '0δʹ�ã�1��ʹ��,2�ѹ���',
   user_id              varchar(11) comment '�û�id�������û�',
   primary key (prize_id)
)
type = InnoDB;

alter table t_prize comment '�����
';

/*==============================================================*/
/* Table: t_repay_money                                         */
/*==============================================================*/
create table t_repay_money
(
   repay_id             varchar(32) not null comment '����',
   user_id              varchar(32) comment '������id',
   repay_amount         varchar(32) comment '������',
   repay_type_id        varchar(32) comment '���ʽ�����',
   repay_state          varchar(32) comment '����״̬  0 ����δ���� 1��������  2�����ѻ��� 3��ʾ����',
   repay_time           date comment '��������',
   balance              varchar(32) comment 'ʣ����',
   primary key (repay_id)
)
type = InnoDB;

alter table t_repay_money comment '�����';

/*==============================================================*/
/* Table: t_repay_type                                          */
/*==============================================================*/
create table t_repay_type
(
   repay_id             varchar(32) not null comment '����
            ',
   repay_name           varchar(32) comment '���ʽ
            ',
   primary key (repay_id)
)
type = InnoDB;

alter table t_repay_type comment '���ʽ';

/*==============================================================*/
/* Table: t_third_platform                                      */
/*==============================================================*/
create table t_third_platform
(
   third_id             varchar(32) not null,
   user_type_id         varchar(32) comment '0 ��ʾ���  1 ��ʾ����',
   create_time          date comment '����ʱ��',
   repay_amount         varchar(32) comment '������
            ',
   primary key (third_id)
)
type = InnoDB;

alter table t_third_platform comment '�軹��';

/*==============================================================*/
/* Table: t_user_state                                          */
/*==============================================================*/
create table t_user_state
(
   user_state_id        varchar(32) not null comment '����',
   user_state           varchar(32) comment '0 ��ʾ����� 1 ��ʾ������',
   primary key (user_state_id)
)
type = InnoDB;

alter table t_user_state comment '�û�״̬��';

/*==============================================================*/
/* Table: third_account                                         */
/*==============================================================*/
create table third_account
(
   id                   varchar(32) not null comment '�������˻�����',
   user_id              varchar(32) comment '�û�id',
   real_name            varchar(20) comment '��ʵ����',
   ID_number            varchar(32) comment '���֤',
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
   referrer             varchar(20) comment '�Ƽ���',
   primary key (user_id)
)
type = InnoDB;

alter table user comment '�û���';

