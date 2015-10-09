# LOTC - the Lord of the Containers

![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)
[![Build Status](https://travis-ci.org/tmaczukin/lotc.svg)](https://travis-ci.org/tmaczukin/lotc)

Tool for Docker containers management. It was conceived as a more powerful and elastic replacement for docker-compose.

**== This tool is under heavy development and its API should be treat as unstable. ==**

**It was also not designed to manage docker containers on clusters of docker hosts.**

## Why?

I needed a tool similar to docker-compose, but with abilities to:

* define and reuse of container templates,
* define tasks to run on container stacks,
* define parameters to use by containers builders and group those parameters into stages,
* define deploys
* keep history of deployed configurations.

I also wanted to use a DSL instead of YAML file for configuration.

## Bugs, feedback

If you want to report a bug, please create [a GitHub issue](https://github.com/tmaczukin/lotc/issues/new).

If you need help, please create a issue or contact me (but I prefer issues). You can find my e-mail
[on my website](http://maczukin.pl/) or [tweet me](https://twitter.com/TomaszMaczukin).

## Contribution

If You want to contribute to the project, please feel free to fork it, create your feature/bug/hotfix branch and create
a new pull request. I am using ["git-flow"](http://nvie.com/posts/a-successful-git-branching-model/)-like workflow to
work with this repository:

1. There are two long-living branches: development and master. Master is always a "production" version. Development
   should always be in the "production ready" state.

2. There will be no release branches.

3. All production versions are tagged and merged from master into development.

If you want to add new feature, please create "feature/..." branch from development. If you want to fix a
non-critical bug, please create "bug/..." branch from development. If you want to fix a "must-be-fixed-immediatly" bug,
please create "hotfix/..." branch from master.

LOTC is versioned using [Semantic Versioning specification](http://semver.org/). Please follow the specification
when contributing - especially when creating a hotfixes (which always should be an a.b.X changes - so the backward
compatibility must be preserved).

If you want to help but you don't know what to do - look at [issues list](https://github.com/tmaczukin/lotc/issues).

## License

This is free sofware licensed under MIT license. See LICENSE file.
