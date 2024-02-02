CREATE TABLE [dbo].[city] (
    [city_id]     INT          IDENTITY (1, 1) NOT NULL,
    [city]        VARCHAR (50) NOT NULL,
    [country_id]  SMALLINT     NOT NULL,
    [last_update] DATETIME     CONSTRAINT [DF_city_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([city_id] ASC),
    CONSTRAINT [fk_city_country] FOREIGN KEY ([country_id]) REFERENCES [dbo].[country] ([country_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_country_id]
    ON [dbo].[city]([country_id] ASC);

