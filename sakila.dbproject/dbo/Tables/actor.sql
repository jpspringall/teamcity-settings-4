CREATE TABLE [dbo].[actor] (
    [actor_id]    INT          IDENTITY (1, 1) NOT NULL,
    [first_name]  VARCHAR (45) NOT NULL,
    [last_name]   VARCHAR (45) NOT NULL,
    [last_update] DATETIME     CONSTRAINT [DF_actor_last_update] DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([actor_id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_actor_last_name]
    ON [dbo].[actor]([last_name] ASC);

