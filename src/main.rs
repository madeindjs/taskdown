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

		// is complete task
    	match get_complete_task(&line_str) {
    		Ok(result) => {
    			tasks.push(Task{name: result.0.to_string(), complete: true});
    		},
    		Err(_) => {}
    	};
    }

	println!("{:?}", tasks);
}