IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'OpenLDAP')
BEGIN
CREATE DATABASE [OpenLDAP] 

ALTER DATABASE [OpenLDAP] SET ANSI_NULL_DEFAULT OFF
ALTER DATABASE [OpenLDAP] SET ANSI_NULLS OFF
ALTER DATABASE [OpenLDAP] SET ANSI_PADDING OFF
ALTER DATABASE [OpenLDAP] SET ANSI_WARNINGS OFF
ALTER DATABASE [OpenLDAP] SET ARITHABORT OFF
ALTER DATABASE [OpenLDAP] SET AUTO_CLOSE OFF
ALTER DATABASE [OpenLDAP] SET AUTO_CREATE_STATISTICS ON
ALTER DATABASE [OpenLDAP] SET AUTO_SHRINK OFF
ALTER DATABASE [OpenLDAP] SET AUTO_UPDATE_STATISTICS ON
ALTER DATABASE [OpenLDAP] SET CURSOR_CLOSE_ON_COMMIT OFF
ALTER DATABASE [OpenLDAP] SET CURSOR_DEFAULT  GLOBAL
ALTER DATABASE [OpenLDAP] SET CONCAT_NULL_YIELDS_NULL OFF
ALTER DATABASE [OpenLDAP] SET NUMERIC_ROUNDABORT OFF
ALTER DATABASE [OpenLDAP] SET QUOTED_IDENTIFIER OFF
ALTER DATABASE [OpenLDAP] SET RECURSIVE_TRIGGERS OFF
ALTER DATABASE [OpenLDAP] SET  DISABLE_BROKER
ALTER DATABASE [OpenLDAP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
ALTER DATABASE [OpenLDAP] SET DATE_CORRELATION_OPTIMIZATION OFF
ALTER DATABASE [OpenLDAP] SET TRUSTWORTHY OFF
ALTER DATABASE [OpenLDAP] SET ALLOW_SNAPSHOT_ISOLATION OFF
ALTER DATABASE [OpenLDAP] SET PARAMETERIZATION SIMPLE
ALTER DATABASE [OpenLDAP] SET READ_COMMITTED_SNAPSHOT OFF
ALTER DATABASE [OpenLDAP] SET  READ_WRITE
ALTER DATABASE [OpenLDAP] SET RECOVERY FULL
ALTER DATABASE [OpenLDAP] SET  MULTI_USER
ALTER DATABASE [OpenLDAP] SET PAGE_VERIFY CHECKSUM
ALTER DATABASE [OpenLDAP] SET DB_CHAINING OFF
END
GO

USE [OpenLDAP]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ldap_oc_mappings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ldap_oc_mappings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[keytbl] [nvarchar](64) NOT NULL,
	[keycol] [nvarchar](64) NOT NULL,
	[create_proc] [nvarchar](255) NULL,
	[delete_proc] [nvarchar](255) NULL,
	[expect_return] [int] NOT NULL,
 CONSTRAINT [pk_ldap_oc_mappings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unq1_ldap_oc_mappings] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[ldap_oc_mappings] ON
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (1, N'inetOrgPerson', N'persons', N'id', N'{call create_person(?)}', N'{call delete_person(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (2, N'document', N'documents', N'id', N'{call create_document(?)}', N'{call delete_document(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (3, N'organization', N'institutes', N'id', N'{call create_org(?)}', N'{call delete_org(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (4, N'groupOfNames', N'groups', N'id', N'{call create_group(?)}', N'{call delete_group(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (5, N'organizationalUnit', N'institutes', N'id', N'{call create_org(?)}', N'{call delete_org(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (6, N'person', N'persons', N'id', N'{call create_person(?)}', N'{call delete_person(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (7, N'organizationalPerson', N'persons', N'id', N'{call create_person(?)}', N'{call delete_person(?)}', 1)
INSERT [dbo].[ldap_oc_mappings] ([id], [name], [keytbl], [keycol], [create_proc], [delete_proc], [expect_return]) VALUES (8, N'groupOfUniqueNames', N'groups', N'id', N'{call create_group(?)}', N'{call delete_group(?)}', 1)
SET IDENTITY_INSERT [dbo].[ldap_oc_mappings] OFF
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[phones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[phones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[pers_id] [int] NOT NULL,
 CONSTRAINT [PK_phones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[persons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[persons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cn] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[surname] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[password] [nvarchar](64) NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[persons] ON
INSERT [dbo].[persons] ([id], [cn], [name], [surname], [password]) VALUES (1, N'manager', N'manager', N'manager', N'secret')
SET IDENTITY_INSERT [dbo].[persons] OFF
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[institutes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[institutes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[l] [nvarchar](255) NULL,
	[postalCode] [nvarchar](255) NULL,
	[st] [nvarchar](255) NULL,
	[street] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_institutes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[documents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[abstract] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[body] [varbinary](4096) NULL,
 CONSTRAINT [PK_documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[documents] ON
INSERT [dbo].[documents] ([id], [abstract], [title], [body]) VALUES (1, N'abstract1', N'book1', NULL)
INSERT [dbo].[documents] ([id], [abstract], [title], [body]) VALUES (2, N'abstract2', N'book2', NULL)
SET IDENTITY_INSERT [dbo].[documents] OFF
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[authors_docs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[authors_docs](
	[pers_id] [int] NOT NULL,
	[doc_id] [int] NOT NULL,
 CONSTRAINT [PK_authors_docs] PRIMARY KEY CLUSTERED 
(
	[pers_id] ASC,
	[doc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT [dbo].[authors_docs] ([pers_id], [doc_id]) VALUES (1, 1)
INSERT [dbo].[authors_docs] ([pers_id], [doc_id]) VALUES (1, 2)
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[members]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[add_phone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[add_phone] @pers_id int, @phone nvarchar(255) AS
INSERT INTO phones (pers_id,phone) VALUES (@pers_id,@phone)
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_phone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_phone] @keyval int,@phone nvarchar(64) AS
DELETE FROM phones WHERE pers_id=@keyval AND phone=@phone;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_person]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_person] @keyval int AS
DELETE FROM phones WHERE pers_id=@keyval;
DELETE FROM authors_docs WHERE pers_id=@keyval;
DELETE FROM persons WHERE id=@keyval;
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_group]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_group] @keyval int AS
DELETE FROM members WHERE group_id=@keyval;
DELETE FROM groups WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_org]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_org] @keyval int AS
DELETE FROM institutes WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_document]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_document] @keyval int AS
DELETE FROM authors_docs WHERE doc_id=@keyval;
DELETE FROM documents WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ldap_entries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ldap_entries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dn] [nvarchar](255) NOT NULL,
	[oc_map_id] [int] NOT NULL,
	[parent] [int] NOT NULL,
	[keyval] [int] NOT NULL,
 CONSTRAINT [pk_ldap_entries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unq1_ldap_entries] UNIQUE NONCLUSTERED 
(
	[oc_map_id] ASC,
	[keyval] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unq2_ldap_entries] UNIQUE NONCLUSTERED 
(
	[dn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[ldap_entries] ON
INSERT [dbo].[ldap_entries] ([id], [dn], [oc_map_id], [parent], [keyval]) VALUES (1, N'dc=maxcrc,dc=com', 3, 0, 1)
INSERT [dbo].[ldap_entries] ([id], [dn], [oc_map_id], [parent], [keyval]) VALUES (2, N'cn=manager,dc=maxcrc,dc=com', 1, 1, 1)
INSERT [dbo].[ldap_entries] ([id], [dn], [oc_map_id], [parent], [keyval]) VALUES (3, N'documentTitle=Book1,dc=maxcrc,dc=com', 2, 1, 1)
SET IDENTITY_INSERT [dbo].[ldap_entries] OFF
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ldap_attr_mappings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ldap_attr_mappings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oc_map_id] [int] NOT NULL,
	[name] [nvarchar](512) NOT NULL,
	[sel_expr] [nvarchar](512) NOT NULL,
	[sel_expr_u] [nvarchar](512) NULL,
	[from_tbls] [nvarchar](512) NOT NULL,
	[join_where] [nvarchar](512) NULL,
	[add_proc] [nvarchar](512) NULL,
	[delete_proc] [nvarchar](512) NULL,
	[param_order] [int] NOT NULL,
	[expect_return] [int] NOT NULL,
 CONSTRAINT [pk_ldap_attr_mappings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[ldap_attr_mappings] ON
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (1, 1, N'cn', N'persons.cn', NULL, N'persons', NULL, N'{call set_person_cn(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (2, 1, N'telephoneNumber', N'phones.phone', NULL, N'persons,phones', N'phones.pers_id=persons.id', N'{call add_phone(?,?)}', N'{call delete_phone(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (3, 1, N'givenName', N'persons.name', NULL, N'persons', NULL, N'{call set_person_name(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (4, 1, N'sn', N'persons.surname', NULL, N'persons', NULL, N'{call set_person_surname(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (5, 1, N'userPassword', N'persons.password', NULL, N'persons', N'persons.password IS NOT NULL', N'{call set_person_password(?,?)}', N'{call del_person_password(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (6, 1, N'seeAlso', N'seeAlso.dn', NULL, N'ldap_entries AS seeAlso,documents,authors_docs,persons', N'seeAlso.keyval=documents.id AND seeAlso.oc_map_id=2 AND authors_docs.doc_id=documents.id AND authors_docs.pers_id=persons.id', NULL, NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (7, 2, N'description', N'documents.abstract', NULL, N'documents', NULL, N'{call set_doc_abstract(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (8, 2, N'documentTitle', N'documents.title', NULL, N'documents', NULL, N'{call set_doc_title(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (9, 2, N'documentAuthor', N'documentAuthor.dn', NULL, N'ldap_entries AS documentAuthor,documents,authors_docs,persons', N'documentAuthor.keyval=persons.id AND documentAuthor.oc_map_id=1 AND authors_docs.doc_id=documents.id AND authors_docs.pers_id=persons.id', N'INSERT INTO authors_docs (pers_id,doc_id) VALUES ((SELECT ldap_entries.keyval FROM ldap_entries WHERE upper(?)=upper(ldap_entries.dn)),?)', N'DELETE FROM authors_docs WHERE authors_docs.pers_id=(SELECT ldap_entries.keyval FROM ldap_entries WHERE upper(?)=upper(ldap_entries.dn)) AND authors_docs.doc_id=?', 3, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (10, 2, N'documentIdentifier', N'''document ''+text(documents.id)', NULL, N'documents', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (11, 3, N'o', N'institutes.name', NULL, N'institutes', NULL, N'{call set_org_name(?,?)}', NULL, 3, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (12, 3, N'dc', N'lower(institutes.name)', NULL, N'institutes,ldap_entries AS dcObject,ldap_entry_objclasses AS auxObjectClass', N'institutes.id=dcObject.keyval AND dcObject.oc_map_id=3 AND dcObject.id=auxObjectClass.entry_id AND auxObjectClass.oc_name=''dcObject''', N'{call set_org_name(?,?)}', NULL, 3, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (13, 4, N'member', N'members.name', NULL, N'groups, members', N'members.group_id=groups.id', N'{call add_group_member(?,?)}', N'{call delete_group_member(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (14, 4, N'cn', N'groups.name', NULL, N'groups', NULL, N'{call set_group_name(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (15, 4, N'description', N'groups.description', NULL, N'groups', NULL, N'{call set_group_description(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (16, 5, N'ou', N'institutes.name', NULL, N'institutes', NULL, N'{call set_org_name(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (17, 5, N'description', N'institutes.description', NULL, N'institutes', NULL, N'{call set_org_description(?,?)}', N'{call delete_org_description(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (18, 5, N'l', N'institutes.l', NULL, N'institutes', NULL, N'{call set_org_l(?,?)}', N'{call delete_org_l(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (19, 5, N'st', N'institutes.st', NULL, N'institutes', NULL, N'{call set_org_st(?,?)}', N'{call delete_org_st(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (20, 5, N'street', N'institutes.street', NULL, N'institutes', NULL, N'{call set_org_street(?,?)}', N'{call delete_org_street(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (21, 5, N'postalCode', N'institutes.postalCode', NULL, N'institutes', NULL, N'{call set_org_postalCode(?,?)}', N'{call delete_org_postalCode(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (22, 1, N'description', N'persons.description', NULL, N'persons', NULL, N'{call set_person_description(?,?)}', N'{call delete_person_description(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (23, 6, N'cn', N'persons.cn', NULL, N'persons', NULL, N'{call set_person_cn(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (24, 6, N'telephoneNumber', N'phones.phone', NULL, N'persons,phones', N'phones.pers_id=persons.id', N'{call add_phone(?,?)}', N'{call delete_phone(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (25, 6, N'givenName', N'persons.name', NULL, N'persons', NULL, N'{call set_person_name(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (26, 6, N'sn', N'persons.surname', NULL, N'persons', NULL, N'{call set_person_surname(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (27, 6, N'userPassword', N'persons.password', NULL, N'persons', N'persons.password IS NOT NULL', N'{call set_person_password(?,?)}', N'{call del_person_password(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (28, 6, N'seeAlso', N'seeAlso.dn', NULL, N'ldap_entries AS seeAlso,documents,authors_docs,persons', N'seeAlso.keyval=documents.id AND seeAlso.oc_map_id=2 AND authors_docs.doc_id=documents.id AND authors_docs.pers_id=persons.id', NULL, NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (29, 6, N'description', N'persons.description', NULL, N'persons', NULL, N'{call set_person_description(?,?)}', N'{call delete_person_description(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (30, 7, N'cn', N'persons.cn', NULL, N'persons', NULL, N'{call set_person_cn(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (31, 7, N'telephoneNumber', N'phones.phone', NULL, N'persons,phones', N'phones.pers_id=persons.id', N'{call add_phone(?,?)}', N'{call delete_phone(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (32, 7, N'givenName', N'persons.name', NULL, N'persons', NULL, N'{call set_person_name(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (33, 7, N'sn', N'persons.surname', NULL, N'persons', NULL, N'{call set_person_surname(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (34, 7, N'userPassword', N'persons.password', NULL, N'persons', N'persons.password IS NOT NULL', N'{call set_person_password(?,?)}', N'{call del_person_password(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (35, 7, N'seeAlso', N'seeAlso.dn', NULL, N'ldap_entries AS seeAlso,documents,authors_docs,persons', N'seeAlso.keyval=documents.id AND seeAlso.oc_map_id=2 AND authors_docs.doc_id=documents.id AND authors_docs.pers_id=persons.id', NULL, NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (36, 7, N'description', N'persons.description', NULL, N'persons', NULL, N'{call set_person_description(?,?)}', N'{call delete_person_description(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (37, 7, N'title', N'persons.title', NULL, N'persons', NULL, N'{call set_person_title(?,?)}', N'{call delete_person_title(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (38, 8, N'uniqueMember', N'members.name', NULL, N'groups, members', N'members.group_id=groups.id', N'{call add_group_member(?,?)}', N'{call delete_group_member(?,?)}', 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (39, 8, N'cn', N'groups.name', NULL, N'groups', NULL, N'{call set_group_name(?,?)}', NULL, 0, 0)
INSERT [dbo].[ldap_attr_mappings] ([id], [oc_map_id], [name], [sel_expr], [sel_expr_u], [from_tbls], [join_where], [add_proc], [delete_proc], [param_order], [expect_return]) VALUES (40, 8, N'description', N'groups.description', NULL, N'groups', NULL, N'{call set_group_description(?,?)}', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[ldap_attr_mappings] OFF
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_person]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[create_person] @@keyval int OUTPUT AS
INSERT INTO persons (name) VALUES ('''');
set @@keyval=(SELECT MAX(id) FROM persons)
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_group]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[create_group] @@keyval int OUTPUT AS
INSERT INTO groups (name) VALUES ('''');
set @@keyval=(SELECT MAX(id) FROM groups)
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_org]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[create_org] @@keyval int OUTPUT AS
INSERT INTO institutes (name) VALUES ('''');
set @@keyval=(SELECT MAX(id) FROM institutes)
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_document]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[create_document] @@keyval int OUTPUT AS
INSERT INTO documents (title) VALUES ('''');
set @@keyval=(SELECT MAX(id) FROM documents)
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_person_surname]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_person_surname] @keyval int, @new_surname nvarchar(255)  AS
UPDATE persons SET surname=@new_surname WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_person_cn]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_person_cn] @keyval int, @cn nvarchar(255)  AS
UPDATE persons SET cn=@cn WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_person_password]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_person_password] @keyval int, @new_password nvarchar(255)  AS
UPDATE persons SET password=@new_password WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[del_person_password]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[del_person_password] @keyval int, @password nvarchar(255)  AS
UPDATE persons SET password = NULL WHERE id=@keyval AND password=@password;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_person_name]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_person_name] @keyval int, @new_name nvarchar(255)  AS
UPDATE persons SET name=@new_name WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_person_description]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_person_description] @keyval int, @description nvarchar(255)  AS
UPDATE persons SET description=@description WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_person_description]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_person_description] @keyval int, @description nvarchar(255)  AS
UPDATE persons SET description=NULL WHERE id=@keyval AND description=@description;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_person_title]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_person_title] @keyval int, @title nvarchar(255)  AS
UPDATE persons SET title=@title WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_person_title]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_person_title] @keyval int, @title nvarchar(255)  AS
UPDATE persons SET title=NULL WHERE id=@keyval AND title=@title;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_org_name]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_org_name] @keyval int, @new_name nvarchar(255)  AS
UPDATE institutes SET name=@new_name WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_org_description]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_org_description] @keyval int, @description nvarchar(255)  AS
UPDATE institutes SET description=@description WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_org_description]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_org_description] @keyval int, @description nvarchar(255)  AS
UPDATE institutes SET description=NULL WHERE id=@keyval AND description=@description;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_org_l]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_org_l] @keyval int, @l nvarchar(255)  AS
UPDATE institutes SET l=@l WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_org_l]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_org_l] @keyval int, @l nvarchar(255)  AS
UPDATE institutes SET l=NULL WHERE id=@keyval AND l=@l;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_org_st]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_org_st] @keyval int, @st nvarchar(255)  AS
UPDATE institutes SET st=@st WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_org_st]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_org_st] @keyval int, @st nvarchar(255)  AS
UPDATE institutes SET st=NULL WHERE id=@keyval AND st=@st;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_org_street]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_org_street] @keyval int, @street nvarchar(255)  AS
UPDATE institutes SET street=@street WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_org_street]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_org_street] @keyval int, @street nvarchar(255)  AS
UPDATE institutes SET street=NULL WHERE id=@keyval AND street=@street;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_org_postalCode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_org_postalCode] @keyval int, @postalCode nvarchar(255)  AS
UPDATE institutes SET postalCode=@postalCode WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_org_postalCode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_org_postalCode] @keyval int, @postalCode nvarchar(255)  AS
UPDATE institutes SET postalCode=NULL WHERE id=@keyval AND postalCode=@postalCode;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_doc_title]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_doc_title] @keyval int, @new_title nvarchar(255)  AS
UPDATE documents SET title=@new_title WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_group_name]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_group_name] @keyval int, @name nvarchar(255)  AS
UPDATE groups SET name=@name WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_group_description]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_group_description] @keyval int, @description nvarchar(255)  AS
UPDATE groups SET description=@description WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[add_group_member]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[add_group_member] @group_id int, @name nvarchar(255) AS
INSERT INTO members (group_id,name) VALUES (@group_id,@name)
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_group_member]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[delete_group_member] @keyval int,@name nvarchar(64) AS
DELETE FROM members WHERE group_id=@keyval AND name=@name;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[set_doc_abstract]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[set_doc_abstract] @keyval int, @new_abstract nvarchar(255)  AS
UPDATE documents SET abstract=@new_abstract WHERE id=@keyval;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ldap_entry_objclasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ldap_entry_objclasses](
	[entry_id] [int] NOT NULL,
	[oc_name] [nvarchar](64) NULL
) ON [PRIMARY]
INSERT [dbo].[ldap_entry_objclasses] ([entry_id], [oc_name]) VALUES (1, N'dcObject')
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ldap_entry_objclasses]') AND name = N'entry_idx')
CREATE NONCLUSTERED INDEX [entry_idx] ON [dbo].[ldap_entry_objclasses] 
(
	[entry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[make_doc_link]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[make_doc_link] @keyval int, @doc_dn nvarchar(255)  AS
DECLARE @doc_id int;
SET @doc_id=(SELECT keyval FROM ldap_entries 
	   WHERE oc_map_id=2 AND dn=@doc_dn);
IF NOT (@doc_id IS NULL)
 INSERT INTO authors_docs (pers_id,doc_id) VALUES (@keyval,@doc_id);
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[make_author_link]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[make_author_link] @keyval int, @author_dn nvarchar(255)  AS
DECLARE @per_id int;
SET @per_id=(SELECT keyval FROM ldap_entries 
	   WHERE oc_map_id=1 AND dn=@author_dn);
IF NOT (@per_id IS NULL)
 INSERT INTO authors_docs (doc_id,pers_id) VALUES (@keyval,@per_id);
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ldap_referrals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ldap_referrals](
	[entry_id] [int] NOT NULL,
	[url] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ldap_referrals]') AND name = N'entry_idx')
CREATE NONCLUSTERED INDEX [entry_idx] ON [dbo].[ldap_referrals] 
(
	[entry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[del_doc_link]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[del_doc_link] @keyval int, @doc_dn nvarchar(255)  AS
DECLARE @doc_id int;
SET @doc_id=(SELECT keyval FROM ldap_entries 
	   WHERE oc_map_id=2 AND dn=@doc_dn);
IF NOT (@doc_id IS NULL)
DELETE FROM authors_docs WHERE pers_id=@keyval AND doc_id=@doc_id;
' 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[del_author_link]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[del_author_link] @keyval int, @author_dn nvarchar(255)  AS
DECLARE @per_id int;
SET @per_id=(SELECT keyval FROM ldap_entries 
	   WHERE oc_map_id=1 AND dn=@author_dn);
IF NOT (@per_id IS NULL)
 DELETE FROM authors_docs WHERE doc_id=@keyval AND pers_id=@per_id;
' 
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ldap_entr__oc_ma__0425A276]') AND parent_object_id = OBJECT_ID(N'[dbo].[ldap_entries]'))
ALTER TABLE [dbo].[ldap_entries]  WITH CHECK ADD FOREIGN KEY([oc_map_id])
REFERENCES [dbo].[ldap_oc_mappings] ([id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ldap_attr__oc_ma__014935CB]') AND parent_object_id = OBJECT_ID(N'[dbo].[ldap_attr_mappings]'))
ALTER TABLE [dbo].[ldap_attr_mappings]  WITH CHECK ADD FOREIGN KEY([oc_map_id])
REFERENCES [dbo].[ldap_oc_mappings] ([id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ldap_entr__entry__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[ldap_entry_objclasses]'))
ALTER TABLE [dbo].[ldap_entry_objclasses]  WITH CHECK ADD FOREIGN KEY([entry_id])
REFERENCES [dbo].[ldap_entries] ([id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ldap_refe__entry__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[ldap_referrals]'))
ALTER TABLE [dbo].[ldap_referrals]  WITH CHECK ADD FOREIGN KEY([entry_id])
REFERENCES [dbo].[ldap_entries] ([id])
GO
UPDATE ldap_oc_mappings SET expect_return = 1
GO