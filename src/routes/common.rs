use serde::Serialize;

#[derive(Serialize)]
pub struct Response<T> {
    pub data: T,
    pub errors: Vec<Error>,
}

#[derive(Serialize)]
pub struct Error {
    pub message: String,
    pub target: String,
}
