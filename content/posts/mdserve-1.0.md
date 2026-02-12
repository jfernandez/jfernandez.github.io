---
title: "mdserve 1.0: Markdown Preview for Coding Agents"
date: 2026-02-07T12:00:00-07:00
description: "mdserve is a markdown preview server for terminal coding agents. It renders plans, docs, and Mermaid diagrams in your browser while the agent keeps working."
categories: ["rust", "ai", "tools"]
url: /mdserve-1.0/
---

When I [introduced mdserve](/mdserve-fast-markdown-preview-terminal-workflows/) last year, I blogged about it as a tool for AI coding agent workflows, but the project itself never said that. The README called it a "fast markdown preview server with live reload and theme support." Generic on purpose. People started using it for things I never intended: replacing MkDocs, hosting documentation.

With [v1.0](https://github.com/jfernandez/mdserve/releases/tag/v1.0.0), I'm dropping the ambiguity. **mdserve is a companion tool for AI coding agents.** That's what it was built for, that's how I use it, and that's the only direction it's going.

## Why Terminal Agents Need a Markdown Renderer

Terminal-based coding agents like [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Codex](https://openai.com/index/codex/), and [OpenCode](https://github.com/opencode-ai/opencode) produce a lot of markdown. Plans, architecture docs, design proposals, comparison tables, Mermaid diagrams. Reading raw markdown in a terminal works for short answers, but it falls apart when the agent generates a multi-section design document with embedded diagrams and tables.

This is the gap mdserve fills. Think of it as GitHub's markdown preview running on localhost, with nice themes and live reload.

You read a nicely rendered document while the agent keeps working. With the new [Claude Code skill](#claude-code-skill), the agent even starts mdserve and opens the browser for you. You never have to break out of your terminal session to open a preview in an IDE or manually run a command. The agent writes, you read.

![mdserve with Catppuccin Macchiato theme](/images/mdserve-catppuccin-macchiato.png)

## What's New in 1.0

The core feature set has been stable since 0.5.1. What makes this 1.0 is clarity of purpose and two new features.

### The `--open` Flag

```bash
mdserve --open plan.md
```

Launches your default browser automatically when the server starts. Agents can now start mdserve, open the browser, and continue working, all without you touching anything.

### Claude Code Skill

mdserve now ships as a [Claude Code plugin](https://github.com/jfernandez/mdserve) with a built-in `/mdserve` skill. Install it once:

```bash
claude plugin add jfernandez/mdserve
```

After that, Claude Code knows when to use mdserve and when not to. Writing a long plan? It starts mdserve in the background with `--open`, and the rendered document appears in your browser as the agent writes it. Short answer that fits in the terminal? It skips the preview entirely.

## The Whiteboarding Companion

I wrote about [whiteboarding with AI](/whiteboarding-with-ai/) a few months ago. Coding agents produce better results when you plan in markdown before writing code. mdserve is the other half of that workflow: the rendering layer between the agent's output and your eyes. This is where I'm focusing the project going forward. Features that push it toward being a documentation platform or a static site generator are out of scope.

## Get Started

Install mdserve:

```bash
# macOS
brew install mdserve

# Linux
curl -sSfL https://raw.githubusercontent.com/jfernandez/mdserve/main/install.sh | bash

# Cargo
cargo install mdserve

# Arch Linux
sudo pacman -S mdserve
```

If you're using Claude Code, add the plugin:

```bash
claude plugin add jfernandez/mdserve
```

Then just use Claude Code as you normally would. When the agent needs to show you something longer than a few lines, it'll handle the rest.

Try it out at [github.com/jfernandez/mdserve](https://github.com/jfernandez/mdserve).

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9; border-radius: 5px; margin-top: 20px;">
  <em><strong>Note:</strong> This blog is kept in source control. If you find any issues with the content, please open an issue
  <a href="https://github.com/jfernandez/jfernandez.github.io/issues" target="_blank">here</a> or submit <a href="https://github.com/jfernandez/jfernandez.github.io/pulls" target="_blank">PR</a>.</em>
</div>
