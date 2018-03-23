# Console

Simple Console screen for iOS App.

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 10.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Console into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target '<Your Target Name>' do
  use_frameworks!

  # Add this line
  pod 'Console', :git => 'https://github.com/watanabetoshinori/Console.git', :branch => 'master'

end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Console into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "watanabetoshinori/Console"
```

Run `carthage update` to build the framework and drag the built `Console.framework` into your Xcode project.

## Usage

In your ViewController:

```swift
Console.log("Logging message")
```

You can see the sample code from the [Example](https://github.com/watanabetoshinori/Console/tree/master/Example) directory.

## License

Console is released under the MIT license. [See LICENSE](https://github.com/watanabetoshinori/Console/blob/master/LICENSE) for details.
