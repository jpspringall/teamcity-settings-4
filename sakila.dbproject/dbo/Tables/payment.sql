CREATE TABLE [dbo].[payment] (
    [payment_id]   INT            IDENTITY (1, 1) NOT NULL,
    [customer_id]  INT            NOT NULL,
    [staff_id]     TINYINT        NOT NULL,
    [rental_id]    INT            DEFAULT (NULL) NULL,
    [amount]       DECIMAL (5, 2) NOT NULL,
    [payment_date] DATETIME       NOT NULL,
    [last_update]  DATETIME       CONSTRAINT [DF_payment_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([payment_id] ASC),
    CONSTRAINT [fk_payment_customer] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customer] ([customer_id]),
    CONSTRAINT [fk_payment_rental] FOREIGN KEY ([rental_id]) REFERENCES [dbo].[rental] ([rental_id]) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT [fk_payment_staff] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[staff] ([staff_id])
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_staff_id]
    ON [dbo].[payment]([staff_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_customer_id]
    ON [dbo].[payment]([customer_id] ASC);

