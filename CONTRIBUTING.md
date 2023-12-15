# Contributing Guide

## Requirements

- [mdBook](https://rust-lang.github.io/mdBook/index.html)
- [Dart](https://dart.dev/)
- [Bash](https://www.gnu.org/software/bash/)


## Build the Book

In order to build the book, you first need to compile the Dart code and symlink the files to the
correct location.

```console
./build.sh
mdbook serve book
```

