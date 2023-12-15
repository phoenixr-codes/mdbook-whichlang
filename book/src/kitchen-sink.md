# Kitchen Sink

Note, that [Devicon](https://devicon.dev/) is used in this book which allows the usage of
`.devicon-*` icons.


## All combined

```python,lang=Python,icon=.devicon-python-plain,filepath=path/to/file.py
import this
```

## Code Blocks in Block Quotes

> Hello World.
>
> This is a block quote.
>
> ```rust,lang=Rust,icon=.devicon-rust-plain,filepath=path/to/file.rs
> println!("Hello World");
> ```


## Automatic language detection

```toml
[[player]]
name = "john"
score = 3
```


## Enforce no language

```ruby,nolang
puts "hey"
```

```ruby,nolang,icon=.devicon-ruby-plain
puts "ho"
```

```ruby,nolang,filepath=main.rb
puts "let's go"
```


## External icon

Make sure you have an internet connection.

```text,nolang,icon=@https://pypi.org/static/images/logo-small.2a411bc6.svg,filepath=requirements.txt
numpy==1.26.2
```


## Hiding lines

```html,filepath=index.html,hidelines=$,icon=.devicon-html5-plain
$<!DOCTYPE html>
$<html>
$<body>
  <h1>Hello World</h1>
  <p>Click on the eye icon on the right side of the code block</p>
$</body>
$</html>
```


## Multiple classes

```ruby,icon=.fa.fa-github
puts "hi"
```
