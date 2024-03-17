use std::net::TcpListener;

use one_percent_srv::{configuration::get_configuration, startup::run};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let conf = get_configuration().expect("Failed to read configuration.");
    let address = format!("127.0.0.1:{}", conf.application_port);
    let listener = TcpListener::bind(address)?;
    run(listener)?.await
}
