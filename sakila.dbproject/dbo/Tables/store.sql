CREATE TABLE [dbo].[store] (
    [store_id]         INT      IDENTITY (1, 1) NOT NULL,
    [manager_staff_id] TINYINT  NOT NULL,
    [address_id]       INT      NOT NULL,
    [last_update]      DATETIME CONSTRAINT [DF_store_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([store_id] ASC),
    CONSTRAINT [fk_store_address] FOREIGN KEY ([address_id]) REFERENCES [dbo].[address] ([address_id]),
    CONSTRAINT [fk_store_staff] FOREIGN KEY ([manager_staff_id]) REFERENCES [dbo].[staff] ([staff_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_fk_address_id]
    ON [dbo].[store]([manager_staff_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_store_address]
    ON [dbo].[store]([address_id] ASC);

