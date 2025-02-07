# Examples

```c
#include <stdio.h>

int main(void) {
	printf("Hello World\n");
}
```

```c++
#include <iostream>

int main()
{
   std::cout << "Hello World" << std::endl;
}
```

```javascript
console.log("Hello World");
```

```typescript
console.log("Hello World");
```

```rescript
Console.log("Hello World")
```

```css
h1 {
  color: blue;
}
```

```vim
set syntax=ruby
```

```lua,fp=init.lua
print("Hello World")
```

```python
print("Hello World")
```

```nim
echo "Hello World"
```

```zig,fp=hello.zig
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
}
```

```odin
package main

import "core:fmt"

main :: proc() {
	fmt.println("Hellope!")
}
```

```wat,fp=hello.wat,icon=%webassembly
(module
    (import "wasi_unstable" "fd_write"
        (func $fd_write (param i32 i32 i32 i32) (result i32))
    )

    (memory 1)
    (export "memory" (memory 0))

    (data (i32.const 0) "\08\00\00\00\0c\00\00\00Hello World\n")

    (func $main (export "_start")
        i32.const 1
        i32.const 0
        i32.const 1
        i32.const 20
        call $fd_write
        drop
    )
)
```
