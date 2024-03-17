use actix_web::{web, Responder};
use rand::prelude::*;
use serde::Serialize;

#[derive(Serialize)]
struct Quote {
    quote: String,
    by: String,
}

pub async fn random_quote() -> impl Responder {
    let (quote, by) = get_random_quote();

    web::Json(crate::routes::Response {
        data: Quote { quote, by },
        errors: vec![],
    })
}

const RAND_QUOTES: [(&str, &str); 1] = [("Lorem ipsum", "Adib")];

fn get_random_quote() -> (String, String) {
    let mut rng = rand::thread_rng();
    let index = rng.gen_range(0 as usize..RAND_QUOTES.len());
    return (
        RAND_QUOTES[index].0.to_string(),
        RAND_QUOTES[index].1.to_string(),
    );
}
