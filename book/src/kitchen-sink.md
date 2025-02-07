# Kitchen Sink

## All combined

```python,icon=%rust,fp=path/to/file.py
import this
```

## Code Blocks in Block Quotes

> Hello World.
>
> This is a block quote.
>
> ```rust,fp=path/to/file.rs
> println!("Hello World");
> ```

## Automatic language detection

```toml
[[player]]
name = "john"
score = 3
```

## Enforce no icon

```ruby,icon=
puts "hey"
```

```ruby,icon=,fp=main.rb
puts "ho"
```

## External icon

Make sure you have an internet connection.

```text,icon=@https://pypi.org/static/images/logo-small.8998e9d1.svg,fp=requirements.txt
numpy==1.26.2
```

## Hiding lines

```html,filepath=index.html,hidelines=$,icon=%html5
$<!DOCTYPE html>
$<html>
  $<body>
    <h1>Hello World</h1>
    <p>Click on the eye icon on the right side of the code block</p>
    $
  </body>
  $
</html>
```

## Multiple classes

```ruby,icon=.fa.fa-github
puts "hi"
```
