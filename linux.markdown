---
layout: page
title: Linux kernel
permalink: /linux-kernel/
---

I started contributing to the Linux kernel in 2024. My primary focus is in the 
eBPF subsystem. I have submitted to the following patches:

* [bpf: Improve program stats run-time calculation](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ce09cbdd988887662546a1175bcfdfc6c8fdd150)
    * Released in v6.10
* [drm/amd/display: Fix division by zero in setup_dsc_config](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=130afc8a886183a94cf6eab7d24f300014ff87ba)
    * Released in v6.10
* [bpf: add bpf_task_get_cgroup kfunc](https://lore.kernel.org/all/20240319050302.1085006-1-josef@netflix.com/)
    * Rejected
* [kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES](https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=e6b65ee10588a552d04d488ebeac24bba20747a8)
    * Release expected 6.12
* [kbuild: add debug package to pacman PKGBUILD](https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=8b185a2ef825645a04355f6dda16234c376e5a26)
    * Release expected 6.12