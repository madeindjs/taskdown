// src/main.rs
use std::fs::File;
use std::io::prelude::*;

fn main() {
    let mut file = File::open("sample.taskdown").unwrap();
    let mut content = String::new();
    file.read_to_string(&mut content).unwrap();
    println!("{:?}", content);
    // => "à acheter\n\n- [ ] Lait\n- [ ] Farine\n\n ...
}