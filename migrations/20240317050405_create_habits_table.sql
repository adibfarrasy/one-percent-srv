CREATE TABLE IF NOT EXISTS habits (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   user_id UUID NOT NULL,
   name TEXT NOT NULL,
   icon TEXT,
   sort_num INT NOT NULL,
   frequency TEXT NOT NULL,
   description TEXT,
   config_snapshot JSONB NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),
   archived_at timestamptz,
   deleted_at timestamptz,

   FOREIGN KEY (user_id) REFERENCES users(id)
);
