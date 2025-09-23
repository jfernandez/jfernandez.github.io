---
layout: post
title:  "Introducing mdserve: Fast Markdown Preview for Terminal Workflows"
date:   2024-09-22 21:00:00 -0600
categories: rust markdown tools
permalink: /mdserve-fast-markdown-preview-terminal-workflows/
---

As coding LLM agents get better, I find myself using IDEs less and less. These days, my workflow is mostly [Claude Code](https://claude.ai/code) and Neovim. I don't think I need a full IDE anymore for most work.

But there was one thing I missed from IDEs: built-in markdown preview. AI-assisted coding involves a lot of markdown work, and instant visual feedback is valuable.

## The Problem

Most markdown preview tools are designed as IDE plugins or require dependencies like Node.js. I wanted something that is just a binary - no installation, no dependencies, no complex setup. Just a single executable that works anywhere and I can run from a terminal.

## Enter mdserve

I built [mdserve](https://github.com/jfernandez/mdserve) - a fast, lightweight markdown preview server for terminal-based workflows.

![mdserve terminal output](/assets/images/mdserve-terminal-output.png)

### Key Features

- Zero dependencies: Just a single binary
- Lightning fast: Built in Rust (probably the most performant markdown preview server on the planet, though no performance comparisons yet!)
- Live reload: Auto-refreshes when files change
- Beautiful themes: Built-in Catppuccin support (Latte, Macchiato, Mocha) plus additional themes for pleasant reading

### Perfect for AI Coding Workflows

With AI assistants becoming more common, we spend more time with documentation and markdown files. Whether you're writing project docs, creating prompts for AI assistants, maintaining README files, or working on blog posts, mdserve provides instant visual feedback without disrupting your terminal workflow.

## Installation

**macOS:**
```bash
brew tap jfernandez/mdserve
brew install mdserve
```

**Linux:**
```bash
curl -sSfL https://raw.githubusercontent.com/jfernandez/mdserve/main/install.sh | bash
```

## Usage

Basic usage:

```bash
mdserve README.md
```

The server starts up and provides a local URL to view your rendered markdown. Use the 🎨 button to switch between themes, including the beautiful Catppuccin variants that match your terminal aesthetic.

![mdserve theme picker](/assets/images/mdserve-theme-picker.png)

## The Future of Development Tools

We're moving toward more modular, specialized development workflows. Instead of monolithic IDEs, we'll use focused tools that excel at specific tasks and integrate with AI assistants.

mdserve represents this philosophy: a tool that does one thing well and fits naturally into modern workflows where the terminal is your primary interface and AI assistants handle heavy lifting.

Try it out at [github.com/jfernandez/mdserve](https://github.com/jfernandez/mdserve).

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9; border-radius: 5px; margin-top: 20px;">
  <em><strong>Note:</strong> This blog is kept in source control. If you find any issues with the content, please open an issue
  <a href="https://github.com/jfernandez/jfernandez.github.io/issues" target="_blank">here</a> or submit <a href="https://github.com/jfernandez/jfernandez.github.io/pulls" target="_blank">PR</a>.</em>
</div>