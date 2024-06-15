use std::env;
use std::fs::File;
use std::io::Write;

fn main() {
    let version = env::var("CARGO_PKG_VERSION").unwrap();
    let out_dir = env::var("OUT_DIR").unwrap();
    let dest_path = std::path::Path::new(&out_dir).join("version.rs");
    let mut f = File::create(&dest_path).unwrap();
    write!(f, "pub const VERSION: &str = \"{}\";", version).unwrap();
}
