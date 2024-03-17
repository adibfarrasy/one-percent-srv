CREATE TABLE IF NOT EXISTS user_transactions (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   user_id UUID NOT NULL,
   amount NUMERIC(10,2) NOT NULL,
   description TEXT,
   user_snapshot JSONB NOT NULL,
   config_snapshot JSONB NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),

   FOREIGN KEY (user_id) REFERENCES users(id)
);
