#[macro_use]
extern crate helix;

ruby! {
    class KonuezuRust {
        def hello() -> String {
            "Hello from konuezu_rust!".to_string()
        }
    }
}
