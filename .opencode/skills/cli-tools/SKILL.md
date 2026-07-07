---
name: cli-tools
description: Use when building command-line interface tools. Covers Rust (clap) and Python (click/typer) patterns, argument parsing, colored output, and packaging. Trigger keywords: CLI, command-line, terminal, clap, click, typer, Rust CLI, Python CLI
---

# CLI Tool Development

## Language Choice
- **Rust**: Best for performance, distribution (single binary), and safety
- **Python**: Best for rapid development, scripts, and data processing

## Rust CLI (clap)
```rust
use clap::Parser;

#[derive(Parser)]
#[command(name = "my-tool", version = "1.0", about = "Does awesome things")]
struct Cli {
    /// Path to the input file
    #[arg(short, long)]
    input: String,

    /// Enable verbose output
    #[arg(short, long, default_value_t = false)]
    verbose: bool,
}

fn main() {
    let cli = Cli::parse();
    println!("Processing: {}", cli.input);
}
```

## Python CLI (click)
```python
import click

@click.command()
@click.option("--input", "-i", required=True, help="Path to input file")
@click.option("--verbose", "-v", is_flag=True, help="Enable verbose output")
def main(input: str, verbose: bool):
    """Does awesome things."""
    click.echo(f"Processing: {input}")

if __name__ == "__main__":
    main()
```

## Python CLI (typer — modern)
```python
import typer
from rich.console import Console

app = typer.Typer()
console = Console()

@app.command()
def process(input: str = typer.Option(..., "--input", "-i", help="Input file")):
    """Process a file."""
    console.print(f"[green]Processing: {input}[/green]")

@app.command()
def list():
    """List items."""
    console.print("[blue]Items:[/blue]")

if __name__ == "__main__":
    app()
```

## Best Practices
- `--help` should be comprehensive and clear
- Short flags (`-v`) for common options, long flags (`--verbose`) for everything
- Progress bars for long operations
- Colored output for readability
- Exit codes: 0 for success, non-zero for errors
- Read from stdin, write to stdout (Unix philosophy)
- Config file support (YAML/TOML in `~/.config/`)

## Packaging
```bash
# Rust: single binary
cargo build --release
# Binary at target/release/my-tool

# Python: pip-installable
pip install build
python -m build
# Distributes as wheel + source
```
