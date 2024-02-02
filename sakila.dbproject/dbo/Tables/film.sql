CREATE TABLE [dbo].[film] (
    [film_id]              INT            IDENTITY (1, 1) NOT NULL,
    [title]                VARCHAR (255)  NOT NULL,
    [description]          TEXT           DEFAULT (NULL) NULL,
    [release_year]         VARCHAR (4)    NULL,
    [language_id]          TINYINT        NOT NULL,
    [original_language_id] TINYINT        DEFAULT (NULL) NULL,
    [rental_duration]      TINYINT        DEFAULT ((3)) NOT NULL,
    [rental_rate]          DECIMAL (4, 2) DEFAULT ((4.99)) NOT NULL,
    [length]               SMALLINT       DEFAULT (NULL) NULL,
    [replacement_cost]     DECIMAL (5, 2) DEFAULT ((19.99)) NOT NULL,
    [rating]               VARCHAR (10)   DEFAULT ('G') NULL,
    [special_features]     VARCHAR (255)  DEFAULT (NULL) NULL,
    [last_update]          DATETIME       CONSTRAINT [DF_film_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([film_id] ASC),
    CONSTRAINT [CHECK_special_features] CHECK ([special_features] IS NULL OR [special_features] like '%Trailers%' OR [special_features] like '%Commentaries%' OR [special_features] like '%Deleted Scenes%' OR [special_features] like '%Behind the Scenes%'),
    CONSTRAINT [CHECK_special_rating] CHECK ([rating]='NC-17' OR [rating]='R' OR [rating]='PG-13' OR [rating]='PG' OR [rating]='G'),
    CONSTRAINT [fk_film_language] FOREIGN KEY ([language_id]) REFERENCES [dbo].[language] ([language_id]),
    CONSTRAINT [fk_film_language_original] FOREIGN KEY ([original_language_id]) REFERENCES [dbo].[language] ([language_id])
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_language_id]
    ON [dbo].[film]([language_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_original_language_id]
    ON [dbo].[film]([original_language_id] ASC);

