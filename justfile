set dotenv-load

sqlx-create:
  @echo "Database URL: $DATABASE_URL"
  sqlx database create

sqlx-migrate:
  @echo "Database URL: $DATABASE_URL"
  sqlx migrate run

compose-up:
  docker compose up -d

compose-down:
  docker compose down

run:
  cargo run
