
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/16/2013 13:40:41
-- Generated from EDMX file: C:\Users\JESUS\documents\visual studio 2010\Projects\Facturacion\CapaDatos\ModeloDominio.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [fact];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EmpresaCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas_Cliente] DROP CONSTRAINT [FK_EmpresaCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_Cliente_inherits_Persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personas_Cliente] DROP CONSTRAINT [FK_Cliente_inherits_Persona];
GO
IF OBJECT_ID(N'[dbo].[FK_Sucursal_inherits_Empresa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empresas_Sucursal] DROP CONSTRAINT [FK_Sucursal_inherits_Empresa];
GO
IF OBJECT_ID(N'[dbo].[FK_Proveedor_inherits_Empresa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empresas_Proveedor] DROP CONSTRAINT [FK_Proveedor_inherits_Empresa];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Empresas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empresas];
GO
IF OBJECT_ID(N'[dbo].[Personas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personas];
GO
IF OBJECT_ID(N'[dbo].[Personas_Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personas_Cliente];
GO
IF OBJECT_ID(N'[dbo].[Empresas_Sucursal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empresas_Sucursal];
GO
IF OBJECT_ID(N'[dbo].[Empresas_Proveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empresas_Proveedor];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Empresas'
CREATE TABLE [dbo].[Empresas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [celular] int  NULL,
    [ciudad] nvarchar(max)  NOT NULL,
    [direccion] nvarchar(max)  NULL,
    [email] nvarchar(max)  NULL,
    [telefono] int  NULL,
    [rut] bigint  NULL,
    [razonsocial] nvarchar(max)  NULL,
    [observacion] nvarchar(max)  NULL,
    [nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Personas'
CREATE TABLE [dbo].[Personas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [apellido] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [fechanacimiento] datetime  NOT NULL,
    [sexo] bit  NOT NULL,
    [ciudad] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Personas_Cliente'
CREATE TABLE [dbo].[Personas_Cliente] (
    [id] int  NOT NULL,
    [Empresa_id] int  NULL
);
GO

-- Creating table 'Empresas_Sucursal'
CREATE TABLE [dbo].[Empresas_Sucursal] (
    [paginaweb] nvarchar(max)  NOT NULL,
    [logo] tinyint  NOT NULL,
    [id] int  NOT NULL
);
GO

-- Creating table 'Empresas_Proveedor'
CREATE TABLE [dbo].[Empresas_Proveedor] (
    [id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Empresas'
ALTER TABLE [dbo].[Empresas]
ADD CONSTRAINT [PK_Empresas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [PK_Personas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Personas_Cliente'
ALTER TABLE [dbo].[Personas_Cliente]
ADD CONSTRAINT [PK_Personas_Cliente]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Empresas_Sucursal'
ALTER TABLE [dbo].[Empresas_Sucursal]
ADD CONSTRAINT [PK_Empresas_Sucursal]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Empresas_Proveedor'
ALTER TABLE [dbo].[Empresas_Proveedor]
ADD CONSTRAINT [PK_Empresas_Proveedor]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Empresa_id] in table 'Personas_Cliente'
ALTER TABLE [dbo].[Personas_Cliente]
ADD CONSTRAINT [FK_EmpresaCliente]
    FOREIGN KEY ([Empresa_id])
    REFERENCES [dbo].[Empresas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpresaCliente'
CREATE INDEX [IX_FK_EmpresaCliente]
ON [dbo].[Personas_Cliente]
    ([Empresa_id]);
GO

-- Creating foreign key on [id] in table 'Personas_Cliente'
ALTER TABLE [dbo].[Personas_Cliente]
ADD CONSTRAINT [FK_Cliente_inherits_Persona]
    FOREIGN KEY ([id])
    REFERENCES [dbo].[Personas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [id] in table 'Empresas_Sucursal'
ALTER TABLE [dbo].[Empresas_Sucursal]
ADD CONSTRAINT [FK_Sucursal_inherits_Empresa]
    FOREIGN KEY ([id])
    REFERENCES [dbo].[Empresas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [id] in table 'Empresas_Proveedor'
ALTER TABLE [dbo].[Empresas_Proveedor]
ADD CONSTRAINT [FK_Proveedor_inherits_Empresa]
    FOREIGN KEY ([id])
    REFERENCES [dbo].[Empresas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------