CREATE TABLE IF NOT EXISTS habit_logs (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   habit_id UUID NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),
   deleted_at timestamptz,

   FOREIGN KEY (habit_id) REFERENCES habits(id)
);
