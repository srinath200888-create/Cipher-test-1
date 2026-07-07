---
description: Scaffold a Rust (clap) or Python (click/typer) CLI tool with argument parsing, colored output, and packaging.
agent: builder
---

You are scaffolding a new CLI tool.

## Requirements
- Tool name: $ARGUMENTS
- If `--rust` flag: Rust with clap + anyhow + serde
- Default / `--python`: Python with typer + rich

## Steps (Rust)

1. `cargo init $NAME`
2. Add dependencies to Cargo.toml: `clap = { version = "4", features = ["derive"] }`, `anyhow`, `serde`, `serde_json`
3. Create clap CLI struct with arguments and flags
4. Add subcommand structure
5. Implement basic `--help` with examples
6. Add `--version` output
7. Set up logging with `env_logger`
8. Verify: `cargo build --release`

## Steps (Python)

1. Set up project: `pyproject.toml` with typer + rich
2. Create CLI with typer
3. Add subcommands
4. Add colored output with rich
5. Add error handling with proper exit codes
6. Verify: `pip install -e . && $NAME --help`

## Project Structure (Rust)
```
my-tool/
├── Cargo.toml
├── src/
│   ├── main.rs        # CLI entry + clap definition
│   ├── commands/      # Subcommand implementations
│   └── utils/         # Shared utilities
└── tests/
```

## Project Structure (Python)
```
my-tool/
├── pyproject.toml
├── src/
│   ├── __init__.py
│   ├── __main__.py
│   ├── cli.py         # CLI definition with typer
│   └── commands/      # Subcommand implementations
└── tests/
```
