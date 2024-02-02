CREATE TABLE [dbo].[category] (
    [category_id] TINYINT      IDENTITY (1, 1) NOT NULL,
    [name]        VARCHAR (25) NOT NULL,
    [last_update] DATETIME     CONSTRAINT [DF_category_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([category_id] ASC)
);

