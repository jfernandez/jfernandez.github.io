---
layout: post
title:  "Whiteboarding with AI"
date:   2025-10-04 21:00:00 -0600
categories: ai workflow productivity
permalink: /whiteboarding-with-ai/
---

Coding agents often produce better results when you don't ask them to write code immediately. If you jump straight to execution without thinking through the design, the code quality suffers. I've found it better to whiteboard the problem first. It's like pairing with a senior engineer. You enter a room, map out the problem space, explore solutions, and sketch architectural diagrams. Instead of a whiteboard, it's Markdown. And instead of losing the work when you erase it, the session persists as a design document.

I've started optimizing my entire software development workflow around this whiteboarding-first approach. The real power of AI coding agents is using them to think through problems, explore solutions, and document decisions before writing code.

## Better LLM-Generated Code Through Planning

The most challenging aspect of software development is understanding the problem space and making informed architectural decisions. Writing code is straightforward once you know what to build. When you plan in markdown with a smarter model like Claude Opus, you're doing the hard part. Then hand that plan to a more affordable model, such as Sonnet, for execution. AI handles the typing, you review and refine. The result is better code than asking one model to design and implement simultaneously. The plan becomes your spec and documentation, costs less overall, and produces fewer bugs.

## Visual Thinking with Mermaid

One of the most powerful aspects of this workflow is the use of [Mermaid](https://mermaid.js.org/) diagrams. Before AI, I rarely created diagrams because of the effort involved. I didn't want to spend time deciding box sizes or fidgeting with visual formatting details. Now it takes seconds. Ask Claude to create a system architecture diagram, sequence diagram, or entity relationship diagram. For example, this Mermaid code:

```mermaid
graph LR
    A[Planning Doc] --> B[AI Assistant]
    B --> C[Mermaid Diagram]
    C --> D[Live Preview]
    D --> E[Iterate]
    E --> B
```

Renders as:

![Whiteboarding workflow diagram](/assets/images/whiteboarding-workflow-diagram.png)

For visual processors who need diagrams to understand complex systems, this is transformative. Instead of sketching on a whiteboard and losing the work, you get structured diagrams that live alongside your documentation. The diagrams update in seconds as you refine ideas with AI.

## Learning Documentation Tailored to You

This workflow has changed how I learn new codebases. Rather than reading through documents or READMEs, I pull down the project and ask Claude to generate a Markdown document after analyzing the codebase. For complex topics that are easier to visualize than read, I request Mermaid diagrams that illustrate architecture, data flows, or component relationships.

Then I iterate on that doc with Claude. Ask questions, request clarifications, and add more diagrams. I keep refining until I've understood enough of the architecture I was curious about. The result is documentation specifically crafted for how I learn best, rather than generic documents written for everyone.

## Optimizing the Workflow

I built [mdserve](/mdserve-fast-markdown-preview-terminal-workflows/) to optimize this workflow. A fast markdown preview server built in Rust with Mermaid support, beautiful themes, and live reload.

This is how I build software now:

```
┌─────────────────────┬─────────────────────┐
│                     │                     │
│                     │                     │
│      Neovim         │     mdserve         │
│                     │   (live preview)    │
│                     │                     │
├─────────────────────┼─────────────────────┤
│                     │                     │
│   Claude Code       │     Terminal        │
└─────────────────────┴─────────────────────┘
```

I use Neovim for quick edits. When I need to change something directly, it needs to be faster than telling AI what to do. Vim motions make that possible, and AI helped me work through the learning curve. Most of my time is spent in the markdown planning doc with AI, watching the design take shape in mdserve's live preview.

Whiteboarding with AI has fundamentally changed my workflow. I spend less time typing code and more time thinking through problems, design, and architecture.

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9; border-radius: 5px; margin-top: 20px;">
  <em><strong>Note:</strong> This blog is kept in source control. If you find any issues with the content, please open an issue
  <a href="https://github.com/jfernandez/jfernandez.github.io/issues" target="_blank">here</a> or submit <a href="https://github.com/jfernandez/jfernandez.github.io/pulls" target="_blank">PR</a>.</em>
</div>
