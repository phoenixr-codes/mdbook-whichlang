# Cheat Sheet

## Disable banner completely

````markdown
```python,banner=no,icon=rust
def greet():
    print("Hello World")
```
````

becomes

```python,banner=no,icon=%rust
def greet():
    print("Hello World")
```

## Override/set the icon

````markdown
```python
def greet():
    print("Hello World")
```
````

becomes

```python
def greet():
    print("Hello World")
```

````markdown
```python,icon=%rust
def greet():
    print("Hello World")
```
````

becomes

```python,icon=%rust
def greet():
    print("Hello World")
```

````markdown
```python,icon=
def greet():
    print("Hello World")
```
````

becomes

```python,icon=
def greet():
    print("Hello World")
```

## Set the file path

````markdown
```python,fp=path/to/file.py
def greet():
    print("Hello World")
```
````

becomes

```python,fp=path/to/file.py
def greet():
    print("Hello World")
```
