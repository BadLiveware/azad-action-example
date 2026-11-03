# Azad action example

This repository runs a goal of [Azad](https://github.com/BadLiveware/azad) in GitHub Actions with the Azad action.
The workflow has no Rust toolchain and builds nothing: the action installs a release of Azad.

- `tasks.star` defines the goal `ci`: two tasks that run in an Alpine image.
- `.github/workflows/ci.yml` runs `//:ci` with `BadLiveware/azad@<release>`, so the action runs that same release of Azad.

To run the goal on your own machine, get `azad` from a [release](https://github.com/BadLiveware/azad/releases), and run `azad run ci`.
