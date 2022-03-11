# StringUtils

Until now in the release of Swift 5.5 there are still less of intuitive APIs for native Swift String type,
developers have to write the code like ``` string[string.index(string.startIndex, offsetBy: n)] ``` to access the n-th character in a string,
which is less readable and maintainable. Also, the performance of handling ``` String.Index ``` for interpolation is a little bit confused, 
as it seems to convert to [Character] and use subscript to access elements can always have performance benefits. 
This package wraps some common string usages, such as: 

```
let string = " hello world "
string[1]                 \\ "h"
string[1..<3]             \\ "he"
string.trim()             \\ "hello world"
string.rtrim()            \\ " hello world"
string.ltrim()            \\ "hello world "
string.split(" ")         \\ ["hello", "world"]
string.contains("world")  \\ 7
string.base64Encoded()    \\ IGhlbGxvIFdvcmxkIA==
string.urlEncoded()       \\ %20hello%20world%20
string.md5()              \\ c9708cb9a6b8d820eda83547a218f384

let email = "username@gmail.com"
let pattern = "([A-Z0-9a-z._%+-]+)@([A-Za-z0-9.-]+\\.[A-Za-z]{2,64})"
email.matches(withPattern: emailPattern) \\ [["username@gmail.com", "username", "gmail.com"]]
```

## Swift Package Manager
Using swift package manager for intergration by adding following description in Package.swift file: 
```
.package(url: "https://github.com/WengYuehTing/StringUtils.git", .upToNextMajor(from: "1.0.0")),
```
