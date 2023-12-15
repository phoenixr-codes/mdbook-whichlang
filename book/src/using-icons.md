# Using Icons

## Devicon

This book uses [Devicon](https://devicon.dev/) so you can see exactly how it's done in
[the repository](https://github.com/phoenixr-codes/mdbook-whichlang).

1. Download [the stylesheet](https://github.com/devicons/devicon/blob/master/devicon.min.css)
   and put it in **the root** of your book.
2. Download [the fonts](https://github.com/devicons/devicon/tree/master/fonts) and put them in
   the `theme/fonts/` directory of your book.
3. Add the CSS file to the `additional-css` field of your `book.toml`.


## FontAwesome 4

At the moment, mdBook relies on [Font Awesome 4](https://fontawesome.com/v4/icons/) which means
you don't need to install anything.

````markdown
```html,icon=.fa.fa-html5
<h1>Hello, World</h1>
```
````
