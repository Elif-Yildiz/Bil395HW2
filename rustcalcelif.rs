use std::io;

fn main() {
    loop {
        println!("Enter expression (e.g., 5 + 3) or 'exit' to quit:");
        
        let mut input = String::new();
        io::stdin().read_line(&mut input).expect("Failed to read line");
        let input = input.trim();
        
        if input.eq_ignore_ascii_case("exit") {
            break;
        }
        
        let tokens: Vec<&str> = input.split_whitespace().collect();
        
        if tokens.len() != 3 {
            println!("\nInvalid input. Please enter in format: number operator number\n");
            continue;
        }
        
        let first: f64 = match tokens[0].parse() {
            Ok(num) => num,
            Err(_) => {
                println!("\nInvalid number: {}\n", tokens[0]);
                continue;
            }
        };
        
        let oper = tokens[1];
        
        let other: f64 = match tokens[2].parse() {
            Ok(num) => num,
            Err(_) => {
                println!("\nInvalid number: {}\n", tokens[2]);
                continue;
            }
        };
        
        let result = match oper {
            "+" => Some(first + other),
            "-" => Some(first - other),
            "*" => Some(first * other),
            "/" => {
                if other == 0.0 {
                    println!("\nCannot divide by 0\n");
                    None
                } else {
                    Some(first / other)
                }
            },
            _ => {
                println!("\nInvalid operator: {}\n", oper);
                None
            }
        };
        
        if let Some(res) = result {
            println!("\nResult: {} {} {} = {}\n", first, oper, other, res);
        }
    }
}
