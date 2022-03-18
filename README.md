# StringUtils

Until the release of Swift 5.5 there is still a lack of intuitive APIs for native ```String```. To simply access n-th character of a string, developers have to write the code like ``` string[string.index(string.startIndex, offsetBy: n)] ``` which is less readable and maintainable. Also, the performance of multiple string interpolations using ``` String.Index ``` is a little bit confused, as it seems to convert to [Character] and use subscript to access an element could always have performance benefits. Thus, this package aims to provide intuitive APIs for type ```String``` which get rids of ``` String.Index ``` and uses ``` Int ``` and ``` Range<Int> ``` to manipulate a string, such as: 

```
let string = " hello world "
string[1]                 \\ "h"
string[1..<3]             \\ "he"
string.insert("h", at: 1) \\ " hhello world "
string.remove(at: 0)      \\ " "
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
