use std::net::TcpListener;

use actix_web::{dev::Server, web, App, HttpServer};

pub fn run(listener: TcpListener) -> Result<Server, std::io::Error> {
    let server = HttpServer::new(|| {
        App::new()
            .route("/health_check", web::get().to(crate::routes::health_check))
            .route("/quotes/random", web::get().to(crate::routes::random_quote))
    })
    .listen(listener)?
    .run();

    Ok(server)
}
