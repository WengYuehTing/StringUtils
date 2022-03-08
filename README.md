# StringUtils

Until now with the release of Swift 5.5 there are still less of intuitive APIs for native Swift String type,
developers have to write the code like ``` string[string.index(string.startIndex, offsetBy: n)] ``` to access the n-th character in a string,
which is less readable and nature. Also, the performance is a little bit confused and cumbersome while handling with ``` String.Index ```, 
as it seems to convert to [Character] and use subscript to retrieve element can always lead to performance benefits. 
This package wraps some common string usages in one line, such as: 

```
let string = " hello world "
string[1]                 \\ "h"
string[1..<3]             \\ "he"
string.trim()             \\ "hello world"
string.rtrim()            \\ " hello world"
string.split(" ")         \\ ["hello", "world"]
string.contains("world")  \\ 7
string.base64Encoded()    \\ IGhlbGxvIFdvcmxkIA==

let email = "username@gmail.com"
let pattern = "([A-Z0-9a-z._%+-]+)@([A-Za-z0-9.-]+\\.[A-Za-z]{2,64})"
email.matches(withPattern: emailPattern) \\ [["username@gmail.com", "username", "gmail.com"]]
```

This package will keep adding features.

## Swift Package Manager
Using swift package manager for intergration by adding following description in Package.swift file: 
```
.package(url: "https://github.com/WengYuehTing/StringUtils.git", .upToNextMajor(from: "1.0.0")),
```
