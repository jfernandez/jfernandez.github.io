---
title: "Noisy Neighbor Detection with eBPF"
date: 2024-09-11T00:49:31-06:00
description: "How we continuously monitor the Linux scheduler at Netflix using eBPF to detect CPU resource contention and noisy neighbor issues with minimal overhead."
categories: ["ebpf", "scheduler"]
url: /noisy-neighbor-detection-with-ebpf
---
I recently co-authored a post on the [Netflix Tech Blog](https://netflixtechblog.com/noisy-neighbor-detection-with-ebpf-64b1f4b3bbdd) where we detailed how we're continuously monitoring the Linux scheduler using eBPF to enhance system observability. By instrumenting the scheduler, we gain real-time insights into CPU resource contention and noisy neighbor issues, all with minimal overhead. This method allows for deeper visibility into Linux performance, improving stability across our multi-tenant infrastructure. For more on how we implemented this, check out the full post [here](https://netflixtechblog.com/noisy-neighbor-detection-with-ebpf-64b1f4b3bbdd)!

