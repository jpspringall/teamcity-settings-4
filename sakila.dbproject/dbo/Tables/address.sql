CREATE TABLE [dbo].[address] (
    [address_id]  INT          IDENTITY (1, 1) NOT NULL,
    [address]     VARCHAR (50) NOT NULL,
    [address2]    VARCHAR (50) DEFAULT (NULL) NULL,
    [district]    VARCHAR (20) NOT NULL,
    [city_id]     INT          NOT NULL,
    [postal_code] VARCHAR (10) DEFAULT (NULL) NULL,
    [phone]       VARCHAR (20) NOT NULL,
    [last_update] DATETIME     CONSTRAINT [DF_address_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([address_id] ASC),
    CONSTRAINT [fk_address_city] FOREIGN KEY ([city_id]) REFERENCES [dbo].[city] ([city_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_city_id]
    ON [dbo].[address]([city_id] ASC);

