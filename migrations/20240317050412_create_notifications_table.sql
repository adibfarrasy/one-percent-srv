CREATE TABLE IF NOT EXISTS notifications (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   user_id UUID NOT NULL,
   title TEXT NOT NULL,
   body TEXT NOT NULL,
   cta TEXT,
   metadata JSONB NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),
   sent_at timestamptz,
   viewed_at timestamptz,
   deleted_at timestamptz,

   FOREIGN KEY (user_id) REFERENCES users(id)
);
