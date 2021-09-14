
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/14/2021 22:18:39
-- Generated from EDMX file: C:\Users\Suki\source\repos\FIT5032_Ass_2\FIT5032_Ass_2\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-FIT5032_Ass_2-20210914100605];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
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

-- Creating table 'AgencySet'
CREATE TABLE [dbo].[AgencySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [address] nvarchar(max)  NOT NULL,
    [latitude] float  NOT NULL,
    [longitude] float  NOT NULL,
    [year] int  NOT NULL,
    [ranking] int  NULL,
    [description] nvarchar(max)  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL
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
    [AgencyId] int  NOT NULL,
    [AgencyId1] int  NOT NULL
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
    [AgencyId] int  NOT NULL,
    [AspNetUsersId1] nvarchar(128)  NOT NULL,
    [PropertyId1] int  NOT NULL
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

-- Creating primary key on [Id] in table 'AgencySet'
ALTER TABLE [dbo].[AgencySet]
ADD CONSTRAINT [PK_AgencySet]
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

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AspNetUsersId] in table 'AgencySet'
ALTER TABLE [dbo].[AgencySet]
ADD CONSTRAINT [FK_AspNetUsersAgency]
    FOREIGN KEY ([AspNetUsersId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersAgency'
CREATE INDEX [IX_FK_AspNetUsersAgency]
ON [dbo].[AgencySet]
    ([AspNetUsersId]);
GO

-- Creating foreign key on [AspNetUsersId1] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_AspNetUsersBooking]
    FOREIGN KEY ([AspNetUsersId1])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUsersBooking'
CREATE INDEX [IX_FK_AspNetUsersBooking]
ON [dbo].[BookingSet]
    ([AspNetUsersId1]);
GO

-- Creating foreign key on [PropertyId1] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_BookingProperty]
    FOREIGN KEY ([PropertyId1])
    REFERENCES [dbo].[PropertySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingProperty'
CREATE INDEX [IX_FK_BookingProperty]
ON [dbo].[BookingSet]
    ([PropertyId1]);
GO

-- Creating foreign key on [AgencyId1] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [FK_PropertyAgency]
    FOREIGN KEY ([AgencyId1])
    REFERENCES [dbo].[AgencySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropertyAgency'
CREATE INDEX [IX_FK_PropertyAgency]
ON [dbo].[PropertySet]
    ([AgencyId1]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------