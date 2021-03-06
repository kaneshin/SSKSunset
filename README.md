# SSKSunset

SSKSunset is kind of Markdown parser for OSX. (Not supported iOS)

The framework uses [redcarpet](https://github.com/vmg/redcarpet) instead of [sundown](https://github.com/vmg/sundown) sources to parse markdown text.


## Installation

### Carthage

1. Add the following to your *Cartfile*: `github "kaneshin/SSKSunset" ~> 0.1`
2. Run `carthage update`
3. Add SSKSunset as an embedded framework.


## Usage

Import `#import <SSKSunset/SSKSunset.h>` in your header file.

### Objective-C

```objc
SSKSunsetParser *parser = [[SSKSunsetParser alloc] initWithText:@"# Hello world"];
NSLog(@"%@", [parser toHTML]); // => <h1>Hello world</h1>
```

### Swift

```swift
let parser = SSKSunsetParser(text: "# Hello world")
println(parser.toHTML())  // => <h1>Hello world</h1>
```

## License:

[The MIT License (MIT)](http://kaneshin.mit-license.org/)

## Author:

Shintaro Kaneko <kaneshin0120@gmail.com>

