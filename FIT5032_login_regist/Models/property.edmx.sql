
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/11/2021 22:06:46
-- Generated from EDMX file: C:\Users\Suki\source\repos\FIT5032_login_regist\FIT5032_login_regist\Models\property.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Property];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserRolesSet'
CREATE TABLE [dbo].[UserRolesSet] (
    [UserId] nvarchar(max)  NOT NULL,
    [RoleId] nvarchar(max)  NOT NULL,
    [Admin_Id] int  NOT NULL,
    [Customer_Id] int  NOT NULL
);
GO

-- Creating table 'PropertySet'
CREATE TABLE [dbo].[PropertySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PropertyName] nvarchar(max)  NOT NULL,
    [PropertyStatus] nvarchar(max)  NOT NULL,
    [PropertyPrice] float  NOT NULL
);
GO

-- Creating table 'Property_descSet'
CREATE TABLE [dbo].[Property_descSet] (
    [Property1] nvarchar(max)  NOT NULL,
    [property_detail] nvarchar(max)  NOT NULL,
    [property_state] nvarchar(max)  NOT NULL,
    [property_city] nvarchar(max)  NOT NULL,
    [property_street] nvarchar(max)  NOT NULL,
    [property_type] nvarchar(max)  NOT NULL,
    [Property_Id] int  NOT NULL
);
GO

-- Creating table 'CustomerSet'
CREATE TABLE [dbo].[CustomerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AdminSet'
CREATE TABLE [dbo].[AdminSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [property_id] nvarchar(max)  NOT NULL,
    [customer_id] nvarchar(max)  NOT NULL,
    [booking_date] datetime  NOT NULL,
    [CustomerId] int  NOT NULL,
    [Property_Id] int  NOT NULL
);
GO

-- Creating table 'commentSet'
CREATE TABLE [dbo].[commentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [content] nvarchar(max)  NOT NULL,
    [property_id] nvarchar(max)  NOT NULL,
    [customer_id] nvarchar(max)  NOT NULL,
    [CustomerId] int  NULL,
    [Property_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [RoleId], [UserId] in table 'UserRolesSet'
ALTER TABLE [dbo].[UserRolesSet]
ADD CONSTRAINT [PK_UserRolesSet]
    PRIMARY KEY CLUSTERED ([RoleId], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'PropertySet'
ALTER TABLE [dbo].[PropertySet]
ADD CONSTRAINT [PK_PropertySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Property1] in table 'Property_descSet'
ALTER TABLE [dbo].[Property_descSet]
ADD CONSTRAINT [PK_Property_descSet]
    PRIMARY KEY CLUSTERED ([Property1] ASC);
GO

-- Creating primary key on [Id] in table 'CustomerSet'
ALTER TABLE [dbo].[CustomerSet]
ADD CONSTRAINT [PK_CustomerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AdminSet'
ALTER TABLE [dbo].[AdminSet]
ADD CONSTRAINT [PK_AdminSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'commentSet'
ALTER TABLE [dbo].[commentSet]
ADD CONSTRAINT [PK_commentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Property_Id] in table 'Property_descSet'
ALTER TABLE [dbo].[Property_descSet]
ADD CONSTRAINT [FK_PropertyProperty_desc]
    FOREIGN KEY ([Property_Id])
    REFERENCES [dbo].[PropertySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropertyProperty_desc'
CREATE INDEX [IX_FK_PropertyProperty_desc]
ON [dbo].[Property_descSet]
    ([Property_Id]);
GO

-- Creating foreign key on [Admin_Id] in table 'UserRolesSet'
ALTER TABLE [dbo].[UserRolesSet]
ADD CONSTRAINT [FK_UserRolesAdmin]
    FOREIGN KEY ([Admin_Id])
    REFERENCES [dbo].[AdminSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRolesAdmin'
CREATE INDEX [IX_FK_UserRolesAdmin]
ON [dbo].[UserRolesSet]
    ([Admin_Id]);
GO

-- Creating foreign key on [Customer_Id] in table 'UserRolesSet'
ALTER TABLE [dbo].[UserRolesSet]
ADD CONSTRAINT [FK_UserRolesCustomer]
    FOREIGN KEY ([Customer_Id])
    REFERENCES [dbo].[CustomerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRolesCustomer'
CREATE INDEX [IX_FK_UserRolesCustomer]
ON [dbo].[UserRolesSet]
    ([Customer_Id]);
GO

-- Creating foreign key on [CustomerId] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_CustomerBooking]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[CustomerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerBooking'
CREATE INDEX [IX_FK_CustomerBooking]
ON [dbo].[BookingSet]
    ([CustomerId]);
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

-- Creating foreign key on [Property_Id] in table 'commentSet'
ALTER TABLE [dbo].[commentSet]
ADD CONSTRAINT [FK_commentProperty]
    FOREIGN KEY ([Property_Id])
    REFERENCES [dbo].[PropertySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_commentProperty'
CREATE INDEX [IX_FK_commentProperty]
ON [dbo].[commentSet]
    ([Property_Id]);
GO

-- Creating foreign key on [CustomerId] in table 'commentSet'
ALTER TABLE [dbo].[commentSet]
ADD CONSTRAINT [FK_Customercomment]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[CustomerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Customercomment'
CREATE INDEX [IX_FK_Customercomment]
ON [dbo].[commentSet]
    ([CustomerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------