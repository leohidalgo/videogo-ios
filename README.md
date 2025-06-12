# VideoGO iOS

## :wrench: Requirements

#### homebrew
* [xcodegen](https://github.com/yonaskolb/XcodeGen)
* [swiftlint](https://github.com/realm/SwiftLint)

```shell
brew update
brew install swiftgen swiftlint xcodegen
```

## :construction_worker: Development
```shell
make l10n
make xcodeproj

xed VideoGO-iOS.xcodeproj
```

## :robot: CI/CD (Github Actions)
The tests in Github Actions only run when a `Pull Request` is generated to `main` or `develop`

## :rocket: Make targets
| target | Description
|--|--|
| l10n      | Execute `swiftgen` in the `Packages/Core/Localizable` package, generate the enum `L10n` with all text keys.
| lint      | Execute `swiftlint` at the root of the project, this allows you validate the app and its packages.
| xcodeproj | Generate the `*.xcodeproj` with `XcodeGen` for the app.
