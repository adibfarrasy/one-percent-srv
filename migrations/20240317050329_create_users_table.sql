CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   name TEXT,
   email TEXT NOT NULL UNIQUE,
   phone TEXT NOT NULL UNIQUE,
   password TEXT,
   payment JSONB,
   config JSONB,
   active_points NUMERIC(10,2) DEFAULT 0,
   lost_points NUMERIC(10,2) DEFAULT 0,
   created_at timestamptz NOT NULL DEFAULT NOW(),
   last_active_at timestamptz,
   deactivated_at timestamptz,
   deleted_at timestamptz
);
