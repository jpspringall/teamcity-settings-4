CREATE TABLE [dbo].[film_category] (
    [film_id]     INT      NOT NULL,
    [category_id] TINYINT  NOT NULL,
    [last_update] DATETIME CONSTRAINT [DF_film_category_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([film_id] ASC, [category_id] ASC),
    CONSTRAINT [fk_film_category_category] FOREIGN KEY ([category_id]) REFERENCES [dbo].[category] ([category_id]) ON UPDATE CASCADE,
    CONSTRAINT [fk_film_category_film] FOREIGN KEY ([film_id]) REFERENCES [dbo].[film] ([film_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_film_category_film]
    ON [dbo].[film_category]([film_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_film_category_category]
    ON [dbo].[film_category]([category_id] ASC);

