# Build a CLI Tool

Use this prompt when you want to build a CLI tool.

## Prompt

Build a CLI tool for [describe what it does].

### Requirements
- **Language**: Rust with clap (preferred) or Python with typer
- **Output**: Colored, well-formatted (rich for Python)
- **Distribution**: Single binary (Rust) or pip package (Python)

### Process
1. Define the CLI interface (commands, subcommands, flags, arguments)
2. Scaffold the project
3. Implement argument parsing
4. Implement core logic
5. Add colored output and progress bars
6. Handle errors with proper exit codes
7. Add shell completion support
8. Write tests
9. Build for distribution

### Example Structure (Rust)
```
src/
├── main.rs
├── cli.rs         # clap definitions
├── commands/      # subcommand implementations
└── utils/         # shared utilities
```

### Example Structure (Python)
```
src/
├── __main__.py
├── cli.py         # typer definitions
├── commands/      # subcommand implementations
└── utils/         # shared utilities
```

### Deliverables
- Working CLI tool with `--help`
- Colored output
- Proper error handling
- Test suite
- Build/package config
