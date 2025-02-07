# whichlang - Powerful Code Blocks for mdBook

![Dark Theme Preview](./preview-dark.png)
![Light Theme Preview](./preview-light.png)

<!-- ANCHOR: description -->

- 🎨 Optimized for every theme.
- 🔥 Zero-Setup installation: Download the standalone files from the
  repository's releases section or download them via command-line.
- 🔧 Highly configurable.

## Installation

In the directory of your book, install _whichlang_ with the following command.

```console,lang=Console,icon=%gnubash
wget https://github.com/phoenixr-codes/mdbook-whichlang/releases/latest/download/whichlang.js &&
wget https://github.com/phoenixr-codes/mdbook-whichlang/releases/latest/download/whichlang.css
```

Don't forget to add these files in your `book.toml`:

```toml,fp=book.toml
# ...

[output.html]
additional-css = ["path/to/whichlang.css"]
additional-js = ["path/to/whichlang.js"]
```

## Uninstallation

Simply remove the `whichlang.js` and `whichlang.css` files and remove the
references to them in the `book.toml` configuration file.

## Usage

_whichlang_ works out of the box. It detects the language defined on each code
block and customizes them appropiately. You can furthermore configure them
individually:

- override the name of the language
- override the icon of the language
- set a file path shown in the code block

<!-- ANCHOR_END: description -->

You can see examples and more precise explanations in the
[documentation](https://phoenixr-codes.github.io/mdbook-whichlang).

## Building

> [!TIP]
> Building `whichlang` yourself allows you to change configurations by editing
> `config.ts`.

```console
deno run --allow-all bundle.ts
```

## Contributing

See [Contributing](./CONTRIBUTING.md).
