[Utiliser Nom](https://github.com/Geal/nom)


Admettons un fichier pour suivre ses tâches

Le but étant de parser un fichier markdown contenant des tâches sous cette forme

~~~txt
à acheter

- [ ] Lait
- [ ] Farine

Blog

- [ ] Faire un article sur Rust
- [ ] Refaire un Article sur Rust @deadline=2018-12-31

~~~

## Création du projet

### Ouverture du fichier

On initialise un nouveau projet avec **Cargo**

~~~bash
$ cargo new taskdown
~~~

et à la racine du projet nous créons notre fichier à parser: _sample.taskdown_.

Pour lire le fichier on utilise [`std::fs::File::read_to_string`](https://doc.rust-lang.org/std/io/trait.Read.html#method.read_to_string)

~~~rust
// src/main.rs
use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;

fn main() {
    // open file
    let file = File::open("sample.taskdown").unwrap();
    let buffer = BufReader::new(file);

    // read line by line
    for line in buffer.lines() {
        println!("{?}", line.unwrap());
    }
}
~~~

Et on rajoute notre dépendance dans le fichier _Cargo.toml_

~~~toml
[dependencies]
nom = "4.0.0"
~~~


Et on crée notre premi


---


~~~rust
// src/main.rs
use std::fs::File;
use std::io::prelude::*;
use std::io::BufReader;

#[macro_use]
extern crate nom;



#[derive(Debug)]
struct Task {
    name: String,
    complete: bool,
}

named!(get_uncomplete_task<&str,&str>,
    tag_s!("- [ ] ")
);

named!(get_complete_task<&str,&str>,
    tag_s!("- [x] ")
);

fn main() {
    // open file
    let file = File::open("sample.taskdown").unwrap();
    let buffer = BufReader::new(file);

    let mut tasks : Vec<Task> = Vec::new();

    // read line by line
    for line in buffer.lines() {
        let line_str = line.unwrap();


        // is incompleted task?
        match get_uncomplete_task(&line_str) {
            Ok(result) => {
                tasks.push(Task{name: result.0.to_string(), complete: false});
            },
            Err(_) => {}
        };

        match get_complete_task(&line_str) {
            Ok(result) => {
                tasks.push(Task{name: result.0.to_string(), complete: true});
            },
            Err(_) => {}
        };
    }

    println!("{:?}", tasks);
}
~~~



## Lient utilises

- https://www.infoq.com/fr/presentations/mix-it-geoffroy-couprie-des-parsers-surs-avec-rust-et-nom