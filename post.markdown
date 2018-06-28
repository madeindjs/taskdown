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

fn main() {
    let mut file = File::open("sample.taskdown").unwrap();
    let mut content = String::new();
    file.read_to_string(&mut content).unwrap();
    println!("{:?}", content);
    // => "à acheter\n\n- [ ] Lait\n- [ ] Farine\n\n ...
}
~~~


Et on rajoute notre dépendance dans le fichier _Cargo.toml_

~~~toml
[dependencies]
nom = "4.0.0"
~~~

