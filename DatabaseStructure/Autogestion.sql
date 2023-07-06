/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.202
 Source Server Type    : SQL Server
 Source Server Version : 14001000 (14.00.1000)
 Source Host           : 192.168.0.202:1433
 Source Catalog        : AutogestionTiendas
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000 (14.00.1000)
 File Encoding         : 65001

 Date: 06/07/2023 13:36:47
*/


-- ----------------------------
-- Table structure for StatusLocal
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusLocal]') AND type IN ('U'))
	DROP TABLE [dbo].[StatusLocal]
GO

CREATE TABLE [dbo].[StatusLocal] (
  [status_local_id] int  IDENTITY(1,1) NOT NULL,
  [status_local_description] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status_local_audit_id] int  NOT NULL,
  [status_local_audit_date] datetime  NOT NULL,
  [status_local_audit_deleted] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[StatusLocal] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for StatusTask
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTask]') AND type IN ('U'))
	DROP TABLE [dbo].[StatusTask]
GO

CREATE TABLE [dbo].[StatusTask] (
  [status_task_id] int  IDENTITY(1,1) NOT NULL,
  [status_task_description] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status_task_audit_id] int  NOT NULL,
  [status_task_audit_date] datetime  NOT NULL,
  [status_task_audit_deleted] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[StatusTask] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Store
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type IN ('U'))
	DROP TABLE [dbo].[Store]
GO

CREATE TABLE [dbo].[Store] (
  [store_id] int  IDENTITY(1,1) NOT NULL,
  [store_code] int  NOT NULL,
  [store_audit_id] int  NOT NULL,
  [store_audit_date] datetime  NOT NULL,
  [store_audit_deleted] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[Store] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for StoreEmployee
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreEmployee]') AND type IN ('U'))
	DROP TABLE [dbo].[StoreEmployee]
GO

CREATE TABLE [dbo].[StoreEmployee] (
  [stremp_id] int  IDENTITY(1,1) NOT NULL,
  [stremp_alias] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [stremp_store_id] int  NOT NULL,
  [stremp_audit_id] int  NOT NULL,
  [stremp_audit_date] datetime  NOT NULL,
  [stremp_audit_deleted] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[StoreEmployee] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Task
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Task]') AND type IN ('U'))
	DROP TABLE [dbo].[Task]
GO

CREATE TABLE [dbo].[Task] (
  [task_id] int  IDENTITY(1,1) NOT NULL,
  [task_store_id] int  NOT NULL,
  [task_stremp_id] int  NOT NULL,
  [task_status_id] int  NOT NULL,
  [task_token] nvarchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [task_date] datetime  NOT NULL,
  [task_description] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [task_moderator_message] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [task_status_local] int  NOT NULL,
  [task_status_local_message] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [task_audit_id] int  NOT NULL,
  [task_audit_date] datetime  NOT NULL,
  [task_audit_deleted] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[Task] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type IN ('U'))
	DROP TABLE [dbo].[User]
GO

CREATE TABLE [dbo].[User] (
  [user_id] int  IDENTITY(1,1) NOT NULL,
  [user_alias] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [user_audit_id] int  NOT NULL,
  [user_audit_date] datetime  NOT NULL,
  [user_audit_deleted] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[User] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Auto increment value for StatusLocal
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[StatusLocal]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table StatusLocal
-- ----------------------------
ALTER TABLE [dbo].[StatusLocal] ADD CONSTRAINT [PK_StatusLocal] PRIMARY KEY CLUSTERED ([status_local_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for StatusTask
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[StatusTask]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table StatusTask
-- ----------------------------
ALTER TABLE [dbo].[StatusTask] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([status_task_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Store
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Store]', RESEED, 93)
GO


-- ----------------------------
-- Primary Key structure for table Store
-- ----------------------------
ALTER TABLE [dbo].[Store] ADD CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED ([store_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for StoreEmployee
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[StoreEmployee]', RESEED, 172)
GO


-- ----------------------------
-- Primary Key structure for table StoreEmployee
-- ----------------------------
ALTER TABLE [dbo].[StoreEmployee] ADD CONSTRAINT [PK_StoreEmployee] PRIMARY KEY CLUSTERED ([stremp_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Task
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Task]', RESEED, 13174)
GO


-- ----------------------------
-- Primary Key structure for table Task
-- ----------------------------
ALTER TABLE [dbo].[Task] ADD CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED ([task_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for User
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[User]', RESEED, 33)
GO


-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([user_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table StatusLocal
-- ----------------------------
ALTER TABLE [dbo].[StatusLocal] ADD CONSTRAINT [FK_StatusLocal_User] FOREIGN KEY ([status_local_audit_id]) REFERENCES [dbo].[User] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table StatusTask
-- ----------------------------
ALTER TABLE [dbo].[StatusTask] ADD CONSTRAINT [FK_Status_User] FOREIGN KEY ([status_task_audit_id]) REFERENCES [dbo].[User] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Store
-- ----------------------------
ALTER TABLE [dbo].[Store] ADD CONSTRAINT [FK_Store_User] FOREIGN KEY ([store_audit_id]) REFERENCES [dbo].[User] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table StoreEmployee
-- ----------------------------
ALTER TABLE [dbo].[StoreEmployee] ADD CONSTRAINT [FK_StoreEmployee_Store] FOREIGN KEY ([stremp_store_id]) REFERENCES [dbo].[Store] ([store_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[StoreEmployee] ADD CONSTRAINT [FK_StoreEmployee_User] FOREIGN KEY ([stremp_audit_id]) REFERENCES [dbo].[User] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Task
-- ----------------------------
ALTER TABLE [dbo].[Task] ADD CONSTRAINT [FK_Task_Status] FOREIGN KEY ([task_status_id]) REFERENCES [dbo].[StatusTask] ([status_task_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Task] ADD CONSTRAINT [FK_Task_StatusLocal] FOREIGN KEY ([task_status_local]) REFERENCES [dbo].[StatusLocal] ([status_local_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Task] ADD CONSTRAINT [FK_Task_Store] FOREIGN KEY ([task_store_id]) REFERENCES [dbo].[Store] ([store_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Task] ADD CONSTRAINT [FK_Task_StoreEmployee] FOREIGN KEY ([task_stremp_id]) REFERENCES [dbo].[StoreEmployee] ([stremp_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Task] ADD CONSTRAINT [FK_Task_User] FOREIGN KEY ([task_audit_id]) REFERENCES [dbo].[User] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

