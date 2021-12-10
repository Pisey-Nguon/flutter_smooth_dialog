<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A smooth dialog is the customized dialog that provides the simple configuration of dialog and it has two UI experiences is Android and iOS.

## Features

Dialog will show base on Platform that build on it.

- This is for android, web, windows and linux.

![photo_2021-12-10 10 02 27](https://user-images.githubusercontent.com/47247206/145510171-dc3a6325-0b2c-4b20-bf9f-c1a9e97c5f66.jpeg)


- This is for iOS and mac.

![photo_2021-12-10 10 02 32](https://user-images.githubusercontent.com/47247206/145510183-9e9e70b2-eaf9-427e-80cc-ae84431e7825.jpeg)


## Getting started

Copy it into pubspec.yaml then run command flutter pub get

```dart
smooth_dialog: ^0.0.2
```

## Usage

- This is how to show dialog


```dart
  final SmoothDialog smoothDialog = SmoothDialog(context);
      smoothDialog
        .setTitleHeader("this is the header dialog")
        .setDescription("This is description")
        .setTitlePositive("Confirm")
        .setTitleNegative("Cancel")
        .showDialog();
```

- This is how to dismiss dialog

```dart
  final SmoothDialog smoothDialog = SmoothDialog(context);
      smoothDialog.dismissDialog();
```

- it also provide listener call back from button positive negative and dismiss

```dart
  final SmoothDialog smoothDialog = SmoothDialog(context);
    smoothDialog
        .setTitleHeader("this is the header dialog")
        .setDescription("This is description")
        .setTitlePositive("Confirm")
        .setTitleNegative("Cancel")
        .addButtonNegativeListener((){
          print("User click on button Negative");
    })
        .addButtonPositiveListener((){
      print("User click on button Positive");
    })
        .addDismissListener((){
      print("User was exit dialog");
    })
        .showDialog();
```

## Additional information

This is my first package, so if you want to contribute, please create an issue on this repository on Github, thank you!
# smooth_dialog
