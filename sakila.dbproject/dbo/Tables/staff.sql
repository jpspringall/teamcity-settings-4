CREATE TABLE [dbo].[staff] (
    [staff_id]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [first_name]  VARCHAR (45) NOT NULL,
    [last_name]   VARCHAR (45) NOT NULL,
    [address_id]  INT          NOT NULL,
    [picture]     IMAGE        DEFAULT (NULL) NULL,
    [email]       VARCHAR (50) DEFAULT (NULL) NULL,
    [store_id]    INT          NOT NULL,
    [active]      BIT          DEFAULT ((1)) NOT NULL,
    [username]    VARCHAR (16) NOT NULL,
    [password]    VARCHAR (40) DEFAULT (NULL) NULL,
    [last_update] DATETIME     CONSTRAINT [DF_staff_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([staff_id] ASC),
    CONSTRAINT [fk_staff_address] FOREIGN KEY ([address_id]) REFERENCES [dbo].[address] ([address_id]) ON UPDATE CASCADE,
    CONSTRAINT [fk_staff_store] FOREIGN KEY ([store_id]) REFERENCES [dbo].[store] ([store_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_store_id]
    ON [dbo].[staff]([store_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_address_id]
    ON [dbo].[staff]([address_id] ASC);

