CREATE TABLE [dbo].[inventory] (
    [inventory_id] INT      IDENTITY (1, 1) NOT NULL,
    [film_id]      INT      NOT NULL,
    [store_id]     INT      NOT NULL,
    [last_update]  DATETIME CONSTRAINT [DF_inventory_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([inventory_id] ASC),
    CONSTRAINT [fk_inventory_film] FOREIGN KEY ([film_id]) REFERENCES [dbo].[film] ([film_id]) ON UPDATE CASCADE,
    CONSTRAINT [fk_inventory_store] FOREIGN KEY ([store_id]) REFERENCES [dbo].[store] ([store_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_film_id]
    ON [dbo].[inventory]([film_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_film_id_store_id]
    ON [dbo].[inventory]([store_id] ASC, [film_id] ASC);

