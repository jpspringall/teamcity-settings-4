CREATE TABLE [dbo].[language] (
    [language_id] TINYINT   IDENTITY (1, 1) NOT NULL,
    [name]        CHAR (20) NOT NULL,
    [last_update] DATETIME  CONSTRAINT [DF_language_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([language_id] ASC)
);

