
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/14/2021 21:41:21
-- Generated from EDMX file: C:\Users\Suki\source\repos\FIT5032_Ass\FIT5032_Ass\Models\Ass.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-FIT5032_Ass-20210914085935];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUsersBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_AspNetUsersBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUsersProperty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropertySet] DROP CONSTRAINT [FK_AspNetUsersProperty];
GO
IF OBJECT_ID(N'[dbo].[FK_PropertyBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_PropertyBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_PropertyAgency]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropertySet] DROP CONSTRAINT [FK_PropertyAgency];
GO
IF OBJECT_ID(N'[dbo].[FK_BookingAgency]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_BookingAgency];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[BookingSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookingSet];
GO
IF OBJECT_ID(N'[dbo].[PropertySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PropertySet];
GO
IF OBJECT_ID(N'[dbo].[AgencySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AgencySet];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [startDate] nvarchar(max)  NOT NULL,
    [price] float  NOT NULL,
    [endDate] nvarchar(max)  NOT NULL,
    [comment] nvarchar(max)  NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL,
    [PropertyId] int  NOT NULL,
    [AgencyId] int  NOT NULL
);
GO

-- Creating table 'PropertySet'
CREATE TABLE [dbo].[PropertySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [type] nvarchar(max)  NOT NULL,
    [price] float  NOT NULL,
    [discount] float  NULL,
    [address] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL,
    [AgencyId] int  NOT NULL
);
GO

-- Creating table 'AgencySet'
CREATE TABLE [dbo].[AgencySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [address] nvarchar(max)  NOT NULL,
    [latitude] float  NOT NULL,
    [longitude] float  NOT NULL,
    [year] int  NOT NULL,
    [ranking] int  NULL,
    [description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [PK_PropertySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AgencySet'
ALTER TABLE [dbo].[AgencySet]
ADD CONSTRAINT [PK_AgencySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [AspNetUsersId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_AspNetUsersBooking]
    FOREIGN KEY ([AspNetUsersId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersBooking'
CREATE INDEX [IX_FK_AspNetUsersBooking]
ON [dbo].[BookingSet]
    ([AspNetUsersId]);
GO

-- Creating foreign key on [AspNetUsersId] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [FK_AspNetUsersProperty]
    FOREIGN KEY ([AspNetUsersId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersProperty'
CREATE INDEX [IX_FK_AspNetUsersProperty]
ON [dbo].[PropertySet]
    ([AspNetUsersId]);
GO

-- Creating foreign key on [PropertyId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_PropertyBooking]
    FOREIGN KEY ([PropertyId])
    REFERENCES [dbo].[PropertySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropertyBooking'
CREATE INDEX [IX_FK_PropertyBooking]
ON [dbo].[BookingSet]
    ([PropertyId]);
GO

-- Creating foreign key on [AgencyId] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [FK_PropertyAgency]
    FOREIGN KEY ([AgencyId])
    REFERENCES [dbo].[AgencySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropertyAgency'
CREATE INDEX [IX_FK_PropertyAgency]
ON [dbo].[PropertySet]
    ([AgencyId]);
GO

-- Creating foreign key on [AgencyId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_BookingAgency]
    FOREIGN KEY ([AgencyId])
    REFERENCES [dbo].[AgencySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingAgency'
CREATE INDEX [IX_FK_BookingAgency]
ON [dbo].[BookingSet]
    ([AgencyId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------