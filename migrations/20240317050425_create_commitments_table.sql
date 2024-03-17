CREATE TABLE IF NOT EXISTS commitments (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   habit_id UUID NOT NULL,
   amount NUMERIC(10,2) NOT NULL,
   status TEXT NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),

   FOREIGN KEY (habit_id) REFERENCES habits(id)
);
