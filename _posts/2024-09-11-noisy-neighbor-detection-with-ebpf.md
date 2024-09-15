---
layout: post
title:  "Noisy Neighbor Detection with eBPF"
date:   2024-09-11 00:49:31 -0600
categories: ebpf scheduler
permalink: /noisy-neighbor-detection-with-ebpf
---
I recently co-authored a post on the [Netflix Tech Blog](https://netflixtechblog.com/noisy-neighbor-detection-with-ebpf-64b1f4b3bbdd) where we detailed how we’re continuously monitoring the Linux scheduler using eBPF to enhance system observability. By instrumenting the scheduler, we gain real-time insights into CPU resource contention and noisy neighbor issues, all with minimal overhead. This method allows for deeper visibility into Linux performance, improving stability across our multi-tenant infrastructure. For more on how we implemented this, check out the full post [here](https://netflixtechblog.com/noisy-neighbor-detection-with-ebpf-64b1f4b3bbdd)!


<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9; border-radius: 5px; margin-top: 20px;">
  <em><strong>Note:</strong> This blog is kept in source control. If you find any issues with the content, please open an issue 
  <a href="https://github.com/jfernandez/jfernandez.github.io/issues" target="_blank">here</a> or submit <a href="https://github.com/jfernandez/jfernandez.github.io/pulls" target="_blank">PR</a>.</em>

</div>

