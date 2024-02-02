CREATE TABLE [dbo].[film_actor] (
    [actor_id]    INT      NOT NULL,
    [film_id]     INT      NOT NULL,
    [last_update] DATETIME CONSTRAINT [DF_film_actor_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([actor_id] ASC, [film_id] ASC),
    CONSTRAINT [fk_film_actor_actor] FOREIGN KEY ([actor_id]) REFERENCES [dbo].[actor] ([actor_id]) ON UPDATE CASCADE,
    CONSTRAINT [fk_film_actor_film] FOREIGN KEY ([film_id]) REFERENCES [dbo].[film] ([film_id]) ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [idx_fk_film_actor_film]
    ON [dbo].[film_actor]([film_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_fk_film_actor_actor]
    ON [dbo].[film_actor]([actor_id] ASC);

