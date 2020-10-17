# PropertySearch


Displays List of Properties from PropertyFinder API

## System Requirements
- Xcode 11 and above
- iOS Version 13.0 and above

## Implementaion

- Application has all the mandatory and optional tasks points implemented.
- Application follows MVVM design architecture at the UI level.
- Model stores data, ViewModel holds model and responsible for API call and business logic, ViewController is reponsible for UI updates.
- Application loads data from the server on every fresh launch.
- Users can sort the properties list by navigating to Sort screen and selecting any of the sort options.
- Users will be able to infinitely scroll the list and lazy loading is used.
- Application also supports darkmode and will automatically switch to darkmode if device is in darkmode.
- Swift language is used and made use of Swift features like class, struct, enum, optionals, closures, protocols

## Installation

- To run the project, Open 'PropertySearch.xcodeproj' via Xcode and run.
- To run it on a device, select Team and generate certificate and provisioning automatically by checking 'Automatically manage signing' in General tab of target setting.
- To run it on a simulator, Select any of the simulators in front of selected scheme and run.

## Build

To build using xcodebuild without code signing
```
xcodebuild clean build -project "PropertySearch.xcodeproj" -scheme "PropertySearch" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
```

## Tests

To run tests using xcodebuild.
```
xcodebuild -project "PropertySearch.xcodeproj" -scheme "PropertySearch" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 8 Plus,OS=13.0' test
```

## Check code coverage

- Application has 93% code coverage.
- To check code coverage follow steps below
- Select Product in Menubar -> Scheme -> Edit Scheme -> Select Test in left Navigator Area -> Select Code Coverage -> close
- Now run the test by Selecting Product -> Test
-  To check code coverage percentage -> Select Report Navigator area(right most option) in Left Project Navigator Area -> Click on Coverage

![Codecoverage_screenshot](https://github.com/mohammed-shakeer/PropertySearch/blob/main/ReferenceImages/CodeCoverage.png)

# User Interface - Light Mode

Property Listing Screen             |  Property Sort Screen
:-------------------------:|:-------------------------:
![](https://github.com/mohammed-shakeer/PropertySearch/blob/main/ReferenceImages/List.png)  |  ![](https://github.com/mohammed-shakeer/PropertySearch/blob/main/ReferenceImages/Sort.png)

# User Interface - Dark Mode

Property Listing Screen             |  Property Sort Screen
:-------------------------:|:-------------------------:
![](https://github.com/mohammed-shakeer/PropertySearch/blob/main/ReferenceImages/List-Dark.png)  |  ![](https://github.com/mohammed-shakeer/PropertySearch/blob/main/ReferenceImages/Sort-Dark.png)

## License

is released under the MIT license.

### Contact
* [Linkedin](https://www.linkedin.com/in/mohammed-shakeer-2073ab68/)
