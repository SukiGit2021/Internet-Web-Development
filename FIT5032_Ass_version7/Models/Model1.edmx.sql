
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/08/2021 17:54:04
-- Generated from EDMX file: C:\Users\Suki\source\repos\FIT5032_Ass_version7\FIT5032_Ass_version7\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-FIT5032_Ass_version7-20211008051137];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AspNetUsersProperty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropertySet] DROP CONSTRAINT [FK_AspNetUsersProperty];
GO
IF OBJECT_ID(N'[dbo].[FK_BookingProperty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_BookingProperty];
GO
IF OBJECT_ID(N'[dbo].[FK_PropertySizeProperty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropertySet] DROP CONSTRAINT [FK_PropertySizeProperty];
GO
IF OBJECT_ID(N'[dbo].[FK_AgencyProperty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropertySet] DROP CONSTRAINT [FK_AgencyProperty];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUsersBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_AspNetUsersBooking];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[PropertySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PropertySet];
GO
IF OBJECT_ID(N'[dbo].[BookingSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookingSet];
GO
IF OBJECT_ID(N'[dbo].[PropertySizeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PropertySizeSet];
GO
IF OBJECT_ID(N'[dbo].[AgencySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AgencySet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

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

-- Creating table 'PropertySet'
CREATE TABLE [dbo].[PropertySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [type] nvarchar(max)  NOT NULL,
    [price] float  NOT NULL,
    [discount] float  NULL,
    [address] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL,
    [PropertySizeId] int  NOT NULL,
    [AgencyId] int  NOT NULL
);
GO

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [startDate] nvarchar(max)  NOT NULL,
    [price] float  NOT NULL,
    [endDate] nvarchar(max)  NOT NULL,
    [comment] nvarchar(max)  NULL,
    [rating] int  NULL,
    [OrderHide] nvarchar(max)  NOT NULL,
    [OrderStatus] nvarchar(max)  NOT NULL,
    [OrderDate] nvarchar(max)  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL,
    [Property_Id] int  NOT NULL
);
GO

-- Creating table 'PropertySizeSet'
CREATE TABLE [dbo].[PropertySizeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PropertyType] nvarchar(max)  NOT NULL,
    [PropertyDescription] nvarchar(max)  NULL
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
    [description] nvarchar(max)  NULL,
    [rating] int  NULL,
    [rating_mean] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [PK_PropertySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PropertySizeSet'
ALTER TABLE [dbo].[PropertySizeSet]
ADD CONSTRAINT [PK_PropertySizeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AgencySet'
ALTER TABLE [dbo].[AgencySet]
ADD CONSTRAINT [PK_AgencySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [Property_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_BookingProperty]
    FOREIGN KEY ([Property_Id])
    REFERENCES [dbo].[PropertySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingProperty'
CREATE INDEX [IX_FK_BookingProperty]
ON [dbo].[BookingSet]
    ([Property_Id]);
GO

-- Creating foreign key on [PropertySizeId] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [FK_PropertySizeProperty]
    FOREIGN KEY ([PropertySizeId])
    REFERENCES [dbo].[PropertySizeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropertySizeProperty'
CREATE INDEX [IX_FK_PropertySizeProperty]
ON [dbo].[PropertySet]
    ([PropertySizeId]);
GO

-- Creating foreign key on [AgencyId] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [FK_AgencyProperty]
    FOREIGN KEY ([AgencyId])
    REFERENCES [dbo].[AgencySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AgencyProperty'
CREATE INDEX [IX_FK_AgencyProperty]
ON [dbo].[PropertySet]
    ([AgencyId]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------