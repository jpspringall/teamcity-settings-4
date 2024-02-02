CREATE TABLE [dbo].[country] (
    [country_id]  SMALLINT     IDENTITY (1, 1) NOT NULL,
    [country]     VARCHAR (50) NOT NULL,
    [last_update] DATETIME     CONSTRAINT [DF_country_last_update] DEFAULT (getdate()) NULL,
    PRIMARY KEY NONCLUSTERED ([country_id] ASC)
);

