# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal website and blog for Jose Fernandez, built with Hugo. Custom theme (no /themes/ directory), Catppuccin Macchiato dark color scheme, deployed to GitHub Pages at jrfernandez.com.

## Development

```bash
hugo serve -D              # Dev server with drafts at localhost:1313
hugo --gc --minify         # Production build to ./public
```

Hugo version: 0.155.2 extended edition. No other build tools, no npm, no SCSS.

## Architecture

- `hugo.toml` — site config, menu items (weighted), Goldmark with unsafe HTML enabled
- `layouts/_default/baseof.html` — base template with GTM tracking and back-to-top button
- `layouts/_default/home.html` — homepage with hero tagline and post list
- `layouts/_default/single.html` — post/page template with h-entry microformat and Schema.org BlogPosting markup
- `layouts/partials/header.html` — header with CSS-only hamburger menu (checkbox hack, 600px breakpoint)
- `static/css/style.css` — all styles in one file, CSS custom properties (--ctp-*) for the color palette
- `content/posts/` — blog posts; root-level .md files are standalone pages (about, bpftop, mdserve, linux-kernel)

## Content conventions

Front matter uses YAML with `title`, `date` (ISO 8601 with timezone), optional `url` override, and `categories` array. Posts go in `content/posts/`. Standalone pages go in `content/` root.

## Deployment

GitHub Actions workflow (`.github/workflows/hugo.yml`) builds on push to main and deploys to GitHub Pages. The build uses `--baseURL "https://jrfernandez.com/"`.
