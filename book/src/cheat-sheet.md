# Cheat Sheet

Remember that you can combine all features shown below.

- [`lang=rust`](#override-the-language-name)
- [`nolang`](#disable-language-detection)
- [`icon=.className` / `icon=@path/to/icon.svg`](#override-the-language-icon)
- [`filepath=path/to/file.md`](#set-the-file-path)


## Override the language name

````markdown
```python,lang=mojo
def greet():
    print("Hello World")
```
````

becomes

```python,lang=Mojo
def greet():
    print("Hello World")
```

It's always a good idea to manually specify the language with the `lang` key because `highlightjs`
might assign the entire family of the language. For example if you use `toml` as the language,
_whichlang_ might use `INI` as the language.


### Disable language detection

Because _whichlang_ always infers the language by the code block's class name which may even be
set when you didn't specify a language, you can disable language detection by using `nolang`:

````markdown
```toml,nolang
[player]
name = "John"
```
````

becomes

```toml,nolang
[player]
name = "John"
```

## Override the language icon

````markdown
```python,icon=.devicon-python-plain
def greet():
    print("Hello World")
```
````

becomes

```python,icon=.devicon-python-plain
def greet():
    print("Hello World")
```

You can read more in [this chapter](./using-icons.md).


### Classes

You can set multiple classes to create an icon out of it. This mechanic is used by many tools
such as FontAwesome. Each class must be prefixed by a period and must not be separated by spaces.


### URL or Path

`icon=@url/to/icon.svg`


## Set the file path

````markdown
```python,filepath=path/to/file.py
def greet():
    print("Hello World")
```
````

becomes

```python,filepath=path/to/file.py
def greet():
    print("Hello World")
```
