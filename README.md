# Thoth

## Installation

Thoth can be installed using Swift Package Manager (SPM). To do this, add the following package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/SyrupMG/Thoth.git", from: "1.0.0")
]
```

Then, add it as a dependency to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["Thoth"]
)
```

If you’re using Xcode to manage your dependencies, simply add the Thoth repository via File > Swift Packages > Add Package Dependency and paste the URL: 

```
https://github.com/SyrupMG/Thoth.git
```

## Author

tm, TMalysheva@ctcmedia.ru

## License

Thoth is available under the MIT license. See the LICENSE file for more info.
