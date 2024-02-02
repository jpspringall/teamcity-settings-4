CREATE TABLE [dbo].[customer] (
    [customer_id] INT          IDENTITY (1, 1) NOT NULL,
    [store_id]    INT          NOT NULL,
    [first_name]  VARCHAR (45) NOT NULL,
    [last_name]   VARCHAR (45) NOT NULL,
    [email]       VARCHAR (50) DEFAULT (NULL) NULL,
    [address_id]  INT          NOT NULL,
    [active]      CHAR (1)     DEFAULT ('Y') NOT NULL,
    [create_date] DATETIME     CONSTRAINT [DF_customer_create_date] DEFAULT (getdate()) NOT NULL,
    [last_update] DATETIME     CONSTRAINT [DF_customer_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([customer_id] ASC),
    CONSTRAINT [fk_customer_address] FOREIGN KEY ([address_id]) REFERENCES [dbo].[address] ([address_id]) ON UPDATE CASCADE,
    CONSTRAINT [fk_customer_store] FOREIGN KEY ([store_id]) REFERENCES [dbo].[store] ([store_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_store_id]
    ON [dbo].[customer]([store_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_address_id]
    ON [dbo].[customer]([address_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_last_name]
    ON [dbo].[customer]([last_name] ASC);

