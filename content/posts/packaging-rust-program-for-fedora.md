---
title: "Packaging a Rust Program for Fedora"
date: 2024-08-25T00:49:31-06:00
description: "A step-by-step guide to packaging a Rust binary for Fedora, from rust2rpm and mock builds to finding a sponsor and publishing your package."
categories: ["fedora", "rust"]
url: /packaging-rust-program-for-fedora
---
Packaging a Rust program for Fedora may seem daunting initially, but it's more straightforward than expected, thanks to excellent documentation, Rust-specific tooling, and a helpful community. Over the past two months, I packaged [bpftop](/bpftop/), a process monitor for eBPF programs. While there were some specific considerations with Rust, the process was manageable. In this post, I'll share the steps I took, the insights I gained, and how to streamline the experience.

### Why Package for Fedora?

Fedora is the upstream for Red Hat Enterprise Linux (RHEL), meaning any software packaged for Fedora has a direct path into the enterprise space. By packaging for Fedora, you're not only contributing to one of the most cutting-edge Linux distributions but also laying the groundwork for broader adoption across many industries that rely on RHEL.

### Becoming a Fedora Packager: Upfront Expectations

Before diving into the packaging process, it's essential to understand that to publish a package in Fedora, you must first become an official Fedora packager, which is not guaranteed. A good starting point is to follow the [Fedora guide](https://docs.fedoraproject.org/en-US/package-maintainers/Joining_the_Package_Maintainers/) on joining the package maintainers, which outlines the basic steps you must take. Review this guide to familiarize yourself with the official process.

Before seeking sponsorship, you should submit your package for review. This submission will be a reference point when approaching potential sponsors to become an official packager. We will come back to this later in this post.

### Preparing Your Fedora Packaging Environment

When packaging for Fedora, having a dedicated environment is crucial for accessing the necessary tools and dependencies. If Fedora isn't your daily driver, consider setting it up on a separate laptop, virtual machine, or container. Arch Linux is my daily driver (btw), so I used a second laptop to immerse myself in Fedora and become more familiar with it. The ThinkPad T480, available for under [$200 on eBay](https://www.ebay.com/sch/i.html?_from=R40&_nkw=thinkpad+t480&_sacat=0), is a popular choice in the Linux community and makes an excellent secondary machine. Be warned—you might find yourself joining the [cult of ThinkPad enthusiasts](https://www.reddit.com/r/thinkpad/) and wanting to collect more!

Set up your Fedora environment, then install all the packager tools listed in [this tutorial](https://docs.fedoraproject.org/en-US/package-maintainers/Installing_Packager_Tools/). Additionally, make sure to install [rust2rpm](https://packages.fedoraproject.org/pkgs/rust2rpm/rust2rpm/) and [rpmdevtools](https://packages.fedoraproject.org/pkgs/rpmdevtools/rpmdevtools/).

### Packaging Rust

When packaging Rust for Fedora, all crate dependencies must be packaged separately as RPM packages. While this might seem intimidating, the [Rust Special Interest Group](https://fedoraproject.org/wiki/SIGs/Rust) (SIG) has put significant effort into streamlining this process.

Most, if not all, of your project's dependencies may already be available as packages. In my case, only two dependencies were missing ([tui-input](https://bugzilla.redhat.com/show_bug.cgi?id=2282282) and [tracing-journald](https://bugzilla.redhat.com/show_bug.cgi?id=2282804)), and I became the packager for them to unblock bpftop. Before diving into packaging, it may be worth asking the Rust SIG if someone is already considering or working on packaging the Rust app or crate you're targeting. You may find collaborators who can help you along the way. [Fabio Valentini](https://x.com/decathorpe?lang=en) kindly contacted me and guided me through the process. I hope this blog post will help others in the same way Fabio helped me.

### Getting Started

Now, it's time to get started. First, run `rust2rpm .` from the root of your Rust project. This command will generate a spec file that works out of the box and leverages several Rust-specific macros. Open the spec file, and update the URL and Source fields to point to your project's repository. For example, in bpftop, these are:

```
URL: https://github.com/Netflix/%{name}
Source: https://github.com/Netflix/%{name}/archive/refs/tags/v%{version}.tar.gz
```

If you are not packaging a crate, make one additional change, replace:

```
%autosetup -n %{crate}-%{version}
```

with:

```
%autosetup -n %{name}-%{version}
```

Next, use spectool, provided by rpmdevtools, to download the sources to your working directory:

```
spectool -g <myrustapp>.spec
```

Finally, use fedpkg to attempt to build the package locally in a clean chroot, simulating the environment used by Fedora CI. Run this command from your repository root:

```
fedpkg --release f40 mockbuild
```

If everything goes smoothly, you'll complete the build successfully, and then you'll need to fill out the remaining placeholders in the spec file. However, you'll encounter errors if Fedora doesn't have specific crate dependencies packaged yet or if their versions are outdated:

```
Problem 1: nothing provides requested (crate(libbpf-cargo/default) >= 0.23.3 with crate(libbpf-cargo/default) < 0.24.0~)
```

Search for the crate in [Red Hat's Bugzilla](https://bugzilla.redhat.com/). If the crate packaging is already in progress, you should find a ticket for the new submission. Rust SIG automation also creates tickets when a packaged crate needs updating. Bugzilla is a reliable source of truth regarding the status of the missing dependency. You can use these tickets to communicate with the maintainers and get a status update.

If the crate still needs to be packaged, follow the steps outlined in this blog to package it yourself. Communicate your intent in the Rust SIG mailing list or chat channels in case someone is already working on it.

For a detailed guide on the entire process, refer to the [Fedora Rust Packaging Guidelines](https://docs.fedoraproject.org/en-US/packaging-guidelines/Rust/), which covers everything you need to know.

### Submitting Your Package

You wont get your first submission perfect on the first attempt, and reviewers will likely provide feedback. However, you should do your best to address any issues the linting tools surfaces. To do this, run:

```
fedpkg --release f40 lint
```

Work through all the errors that are identified. Once you've addressed them, run:

```
fedpkg --release f40 mockbuild
```

Again, to ensure everything is in order. If successful, the output will be a .src.rpm file in the `results_<myrustapp>` directory.

The final step before submission is to test your package in Fedora's build infrastructure. You can do this by running:

```
fedpkg --release f40 scratch-build --srpm results_<myrustapp>/<version>/<myrustapp>-<version>-1.fc40.src.rpm
```

Make sure it builds successfully there as well. The output will provide a link to the web interface where you can monitor the status of the build job. This job will also host a copy of the .src.rpm file and .spec file, which you'll need to provide in your submission.

Now that you're ready to submit your package for review follow the steps outlined [here](https://docs.fedoraproject.org/en-US/package-maintainers/New_Package_Process_for_New_Contributors/#create_your_review_request). Be sure to mention in your submission that you're seeking sponsorship. Otherwise, the reviewers may assume you're already a packager.

For reference, here are the submissions for [tui-input](https://bugzilla.redhat.com/show_bug.cgi?id=2282282), [tracing-journald](https://bugzilla.redhat.com/show_bug.cgi?id=2282804), and [bpftop](https://bugzilla.redhat.com/show_bug.cgi?id=2281565). You'll also find the spec files linked there if you'd like to use them as references.

### Finding a Sponsor

Now, you need to find someone willing to sponsor you. Sponsorship isn't given lightly; the sponsor is expected to guide you through the entire packaging process. I suggest introducing yourself to the Fedora devel mailing list. You can use my [introduction post](https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/DQ5RPAZQD5CMB46UKP2WDCYJTYQXG5B2/) as an example. In it, I referenced my submissions to show that I was serious about contributing. I recommend submitting your package before introducing yourself and asking for sponsorship.

I was fortunate to find a sponsor within a couple of weeks. They emailed me and offered to sponsor me. I won't mention their name to respect their privacy, as they likely want to avoid being overwhelmed with sponsorship requests.

### Publishing Your Package

During the package review process, expect some back-and-forth until your submission is approved. Once approved, you can proceed with the sponsorship once you secure it. Let's assume you've been granted the packager role. From here, follow [these instructions](https://docs.fedoraproject.org/en-US/package-maintainers/New_Package_Process_for_New_Contributors/#add_package_to_source_code_management_scm_system_and_set_owner). For branches, I chose Rawhide, 40, and 39. After publishing your package, it will be seven days before it's officially enabled in the respective branches. Congratulations—you're now a Fedora package maintainer!

### Closing Thoughts

I found the Fedora packaging process more streamlined than I initially assumed. The documentation is comprehensive, but you need to hop around to gather a concise list of steps, which is why I created this blog post. Additionally, Fedora offers several services that provide a full suite of packaging tools, but it can be tricky to remember which ones to use. For the benefit of the reader, here is a summary of the key Fedora services:

- [Pagure](https://pagure.io/): Fedora uses a Git-based source control system to manage source code and track issues. It's where you will create and manage your packaging repositories.

- [Koji](https://koji.fedoraproject.org/koji/): Fedora's build system is responsible for building packages from the source. It ensures that your packages meet Fedora's guidelines and are ready for distribution.

- [Bodhi](https://bodhi.fedoraproject.org/): A tool for managing package updates. Once your package is built and tested, Bodhi helps move it from testing to stable repositories.

- [Fedora Accounts](https://accounts.fedoraproject.org/): The central system where you manage your Fedora account, which you'll use to access Fedora's various services for packagers.

- [Fedora Hyperkitty](https://lists.fedoraproject.org/archives/): The mailing list service where you can communicate with the Fedora community.

These services, when used together, make the Fedora packaging process much more approachable. I hope this guide makes your experience smoother and easier to navigate!

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9; border-radius: 5px; margin-top: 20px;">
  <em><strong>Note:</strong> This blog is kept in source control. If you find any issues with the content, please open an issue
  <a href="https://github.com/jfernandez/jfernandez.github.io/issues" target="_blank">here</a> or submit <a href="https://github.com/jfernandez/jfernandez.github.io/pulls" target="_blank">PR</a>.</em>

</div>
