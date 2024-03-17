CREATE TABLE IF NOT EXISTS commitment_installments (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   commitment_id UUID NOT NULL,
   habit_log_id UUID NOT NULL,
   plan_id UUID NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),
   deleted_at timestamptz,

   FOREIGN KEY (commitment_id) REFERENCES commitments(id),
   FOREIGN KEY (habit_log_id) REFERENCES habit_logs(id),
   FOREIGN KEY (plan_id) REFERENCES installment_plans(id)
);
