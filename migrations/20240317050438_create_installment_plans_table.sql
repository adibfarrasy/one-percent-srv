CREATE TABLE IF NOT EXISTS installment_plans (
   id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   commitment_id UUID NOT NULL,
   nth_payment INT NOT NULL,
   amount NUMERIC(10,2) NOT NULL,
   created_at timestamptz NOT NULL DEFAULT NOW(),
   deleted_at timestamptz,

   FOREIGN KEY (commitment_id) REFERENCES commitments(id)
);
