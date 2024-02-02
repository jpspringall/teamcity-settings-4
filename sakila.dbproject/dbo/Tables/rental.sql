CREATE TABLE [dbo].[rental] (
    [rental_id]    INT      IDENTITY (1, 1) NOT NULL,
    [rental_date]  DATETIME NOT NULL,
    [inventory_id] INT      NOT NULL,
    [customer_id]  INT      NOT NULL,
    [return_date]  DATETIME DEFAULT (NULL) NULL,
    [staff_id]     TINYINT  NOT NULL,
    [last_update]  DATETIME CONSTRAINT [DF_rental_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([rental_id] ASC),
    CONSTRAINT [fk_rental_customer] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customer] ([customer_id]),
    CONSTRAINT [fk_rental_inventory] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_rental_staff] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[staff] ([staff_id])
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_inventory_id]
    ON [dbo].[rental]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_customer_id]
    ON [dbo].[rental]([customer_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_staff_id]
    ON [dbo].[rental]([staff_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_uq]
    ON [dbo].[rental]([rental_date] ASC, [inventory_id] ASC, [customer_id] ASC);

