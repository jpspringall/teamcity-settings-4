CREATE TABLE [dbo].[film_text] (
    [film_id]     SMALLINT      NOT NULL,
    [title]       VARCHAR (255) NOT NULL,
    [description] TEXT          NULL,
    PRIMARY KEY NONCLUSTERED ([film_id] ASC)
);

