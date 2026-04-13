---
title: "A New Home for bpftop"
date: 2026-04-13T09:00:00-06:00
description: "bpftop has moved from Netflix's GitHub to my personal account. Here's why, and what it means for the project."
categories: ["ebpf", "open-source"]
tags: ["bpftop", "ebpf", "linux", "rust"]
url: /a-new-home-for-bpftop/
---

I created [bpftop](https://netflixtechblog.com/announcing-bpftop-streamlining-ebpf-performance-optimization-6a727c1ae2e5) at Netflix in early 2024 as a command-line tool for monitoring eBPF programs in real time. It was released under the Apache 2.0 license on the Netflix GitHub org, and it quickly gained adoption in the eBPF and Linux communities, getting coverage from [LWN.net](https://lwn.net/Articles/963767/), [InfoQ](https://www.infoq.com/news/2024/03/netflix-launches-bpftop/), and [The New Stack](https://thenewstack.io/netflix-releases-bpftop-an-ebpf-based-application-monitor/). It's now packaged in 19 Linux distributions including Ubuntu, Fedora, Debian, Arch Linux, and NixOS.

I recently left Netflix to join Anthropic, and as part of that transition, I worked with Netflix's legal team to transfer ownership of the repository to my personal GitHub account. I'm deeply grateful to Netflix for supporting the transfer.

The repo now lives at **[github.com/jfernandez/bpftop](https://github.com/jfernandez/bpftop)**, and [v0.8.0](https://github.com/jfernandez/bpftop/releases/tag/v0.8.0) is the first release under its new home.

## What changes

- The GitHub URL. Because the transfer used GitHub's native transfer feature, all existing links to `github.com/Netflix/bpftop`, including release download URLs, will automatically redirect to the new location. All issues, PRs, stars, and commit history carried over as well.
- [Copyright notices](https://github.com/jfernandez/bpftop/commit/52b2b576599d4d656b451c28a3ff295ee4c07059) now reflect the transition: Netflix retains credit for the original work, and future contributions fall under my name and the project's contributors.

## What doesn't change

- The Apache 2.0 license.
- The project's direction and scope.
- Me as the maintainer.

## For package maintainers

If you maintain a bpftop package in a distro, I apologize if this transfer causes any breakage in your build process. [v0.8.0](https://github.com/jfernandez/bpftop/releases/tag/v0.8.0) is a good time to update your source URLs to point to the new repo. I'll be reaching out to downstream packagers to help with the transition. I'm the Fedora package maintainer myself and will be updating it there directly.

## What's next

One area I'm excited about is making bpftop easier to integrate with AI agents. Today it's a human-facing TUI, but eBPF observability data is exactly the kind of structured, real-time system information that agents need to reason about infrastructure. Expect to see more on that soon.

If you run into any issues, please open an issue on the [new repo](https://github.com/jfernandez/bpftop) and I'll help sort it out.

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9; border-radius: 5px; margin-top: 20px;">
  <em><strong>Note:</strong> This blog is kept in source control. If you find any issues with the content, please open an issue
  <a href="https://github.com/jfernandez/jfernandez.github.io/issues" target="_blank">here</a> or submit <a href="https://github.com/jfernandez/jfernandez.github.io/pulls" target="_blank">PR</a>.</em>
</div>
