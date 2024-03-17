use std::env::{self};

#[derive(serde::Deserialize)]
pub struct Settings {
    pub database: DatabaseSettings,
    pub application_port: u16,
}

#[derive(serde::Deserialize)]
pub struct DatabaseSettings {
    pub username: String,
    pub password: String,
    pub port: u16,
    pub host: String,
    pub database_name: String,
}

impl DatabaseSettings {
    pub fn connection_string(&self) -> String {
        format!(
            "postgres://{}:{}@{}:{}/{}",
            self.username, self.password, self.host, self.port, self.database_name,
        )
    }
}

pub fn get_configuration() -> anyhow::Result<Settings> {
    let app_port_str = env::var("APP_PORT")?;
    let app_port = u16::from_str_radix(&app_port_str, 10)?;

    let db_port_str = env::var("PGPORT")?;
    let db_port = u16::from_str_radix(&db_port_str, 10)?;

    Ok(Settings {
        database: DatabaseSettings {
            username: env::var("POSTGRES_USER")?,
            password: env::var("POSTGRES_PASSWORD")?,
            port: db_port,
            host: env::var("PGHOST")?,
            database_name: env::var("POSTGRES_USER")?,
        },
        application_port: app_port,
    })
}
