---
title: "mdserve"
url: /mdserve/
---

[mdserve](https://github.com/jfernandez/mdserve) is a fast, lightweight markdown preview server I created for terminal-based workflows.

Read more about it in my [blog post](/mdserve-fast-markdown-preview-terminal-workflows/).

## Key Features

- Zero dependencies: Just a single binary
- Lightning fast: Built in Rust
- Live reload: Auto-refreshes when files change
- Beautiful themes: Built-in Catppuccin support (Latte, Macchiato, Mocha) plus additional themes

## Installation

**macOS:**
```bash
brew install mdserve
```

**Linux:**
```bash
curl -sSfL https://raw.githubusercontent.com/jfernandez/mdserve/main/install.sh | bash
```

**Cargo:**
```bash
cargo install mdserve
```

## Usage

```bash
mdserve README.md
```

The server starts up and provides a local URL to view your rendered markdown. Use the 🎨 button to switch between themes.
