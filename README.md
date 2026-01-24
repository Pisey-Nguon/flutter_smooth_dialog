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

# 🎨 Smooth Dialog

A modern, highly customizable Flutter dialog package with beautiful animations and platform-aware UI. Create stunning alert and loading dialogs with minimal code!

## ✨ Features

- 🎭 **Platform-Aware UI** - Automatically adapts to Material Design (Android/Web/Windows/Linux) or Cupertino (iOS/macOS)
- 🚀 **Simple API** - Clean, intuitive API with named parameters instead of builder patterns
- 🎨 **Highly Customizable** - Customize colors, styles, icons, animations, and more
- 💪 **Type-Safe** - Proper typing with VoidCallback instead of raw Function types
- ⚡ **Performance Optimized** - Fixed state management bugs and improved efficiency
- 📱 **Responsive** - Works beautifully on all screen sizes
- 🎬 **Smooth Animations** - Beautiful fade and scale animations
- 🔄 **Loading Dialogs** - Built-in loading indicator with customization options

## 📸 Preview

### Material Design (Android, Web, Windows, Linux)
![Material Dialog](https://user-images.githubusercontent.com/47247206/145510171-dc3a6325-0b2c-4b20-bf9f-c1a9e97c5f66.jpeg)

### Cupertino (iOS, macOS)
![Cupertino Dialog](https://user-images.githubusercontent.com/47247206/145510183-9e9e70b2-eaf9-427e-80cc-ae84431e7825.jpeg)

## 🚀 Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  smooth_dialog: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 📖 Usage

### Simple and Clean API

Button text and actions are combined in `DialogButton` objects for a clean, intuitive API:

```dart
SmoothAlertDialog.show(
  context: context,
  title: 'Confirm Action',
  positiveButton: DialogButton(
    text: 'Yes',
    onPressed: (dialog) => dialog.dismiss(),
  ),
  negativeButton: DialogButton(
    text: 'No',
    onPressed: (dialog) => dialog.dismiss(),
  ),
);
```

### Basic Alert Dialog

```dart
import 'package:smooth_dialog/smooth_dialog.dart';

SmoothAlertDialog.show(
  context: context,
  title: 'Welcome',
  content: 'Thank you for using Smooth Dialog!',
  positiveButton: DialogButton(
    text: 'OK',
    onPressed: (dialog) => dialog.dismiss(),
  ),
);
```

### Confirm Dialog with Callbacks

```dart
SmoothAlertDialog.show(
  context: context,
  title: 'Delete Item',
  content: 'Are you sure you want to delete this item?',
  positiveButton: DialogButton(
    text: 'Delete',
    onPressed: (dialog) {
      dialog.dismiss();
      print('Item deleted');
    },
  ),
  negativeButton: DialogButton(
    text: 'Cancel',
    onPressed: (dialog) {
      dialog.dismiss();
      print('Delete cancelled');
    },
  ),
);
```

### Custom Styled Dialog

```dart
SmoothAlertDialog.show(
  context: context,
  title: 'Success!',
  content: 'Your operation completed successfully.',
  positiveButton: DialogButton(
    text: 'Great',
    onPressed: (dialog) => dialog.dismiss(),
  ),
  config: SmoothDialogConfig(
    backgroundColor: Colors.green.shade50,
    titleStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
    icon: Icon(
      Icons.check_circle_outline,
      size: 64,
      color: Colors.green,
    ),
  ),
);
```

### Loading Dialog

```dart
// Show loading
SmoothLoadingDialog.show(
  context: context,
  message: 'Loading...',
);

// Perform async operation
await fetchData();

// Dismiss loading
SmoothLoadingDialog.dismiss();
```

### Custom Loading Dialog

```dart
SmoothLoadingDialog.show(
  context: context,
  message: 'Processing your request',
  config: SmoothLoadingConfig(
    backgroundColor: Colors.purple.shade50,
    indicatorColor: Colors.purple,
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.purple,
    ),
    size: 120,
    indicatorSize: 50,
  ),
);
```

### Custom Widget Content

```dart
SmoothAlertDialog.show(
  context: context,
  titleWidget: Row(
    children: [
      Icon(Icons.warning, color: Colors.orange),
      SizedBox(width: 8),
      Text('Custom Title'),
    ],
  ),
  contentWidget: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('You can add any widget here!'),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {},
        child: Text('Custom Button'),
      ),
    ],
  ),
  positiveButton: DialogButton(
    text: 'OK',
    onPressed: (dialog) => dialog.dismiss(),
  ),
);
```

### Non-Dismissible Dialog

```dart
SmoothAlertDialog.show(
  context: context,
  title: 'Important Notice',
  content: 'You must accept to continue.',
  positiveButton: DialogButton(
    text: 'Accept',
    onPressed: (dialog) => dialog.dismiss(),
  ),
  negativeButton: DialogButton(
    text: 'Decline',
    onPressed: (dialog) => dialog.dismiss(),
  ),
  config: SmoothDialogConfig(
    barrierDismissible: false, // Cannot dismiss by tapping outside
  ),
);
```

## 🎨 Customization Options

### SmoothDialogConfig

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `backgroundColor` | `Color?` | Background color of the dialog | Theme default |
| `titleStyle` | `TextStyle?` | Style for the title text | Theme default |
| `contentStyle` | `TextStyle?` | Style for the content text | Theme default |
| `positiveButtonStyle` | `TextStyle?` | Style for the positive button text | Theme default |
| `negativeButtonStyle` | `TextStyle?` | Style for the negative button text | Theme default |
| `barrierDismissible` | `bool` | Whether dialog can be dismissed by tapping outside | `true` |
| `animationDuration` | `Duration` | Duration of the dialog animation | `300ms` |
| `animationCurve` | `Curve` | Animation curve | `Curves.easeOut` |
| `elevation` | `double?` | Elevation of the dialog | Theme default |
| `shape` | `ShapeBorder?` | Shape of the dialog | Theme default |
| `icon` | `Widget?` | Optional icon at the top | `null` |

### SmoothLoadingConfig

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `backgroundColor` | `Color?` | Background color of loading container | `Colors.white` |
| `indicatorColor` | `Color?` | Color of the loading indicator | Theme primary |
| `textStyle` | `TextStyle?` | Style for the loading text | Default style |
| `barrierDismissible` | `bool` | Whether loading can be dismissed by tapping outside | `false` |
| `animationDuration` | `Duration` | Duration of the animation | `300ms` |
| `size` | `double` | Size of the loading container | `80.0` |
| `indicatorSize` | `double` | Size of the loading indicator | `40.0` |
| `customIndicator` | `Widget?` | Custom loading indicator widget | `null` |

## 🔄 Migration from v0.0.4

### Old API (v0.0.4)

```dart
final smoothDialog = SmoothDialog(context);
smoothDialog
  .setTitleHeader("Title")
  .setDescription("Description")
  .setTitlePositive("OK")
  .setTitleNegative("Cancel")
  .addButtonPositiveListener(() {})
  .addButtonNegativeListener(() {})
  .showDialog();
```

### New API (v1.0.0+)

```dart
SmoothAlertDialog.show(
  context: context,
  title: "Title",
  content: "Description",
  positiveButtonText: "OK",
  negativeButtonText: "Cancel",
  onPositivePressed: () {},
  onNegativePressed: () {},
);
```

### Key Changes

✅ **Simpler API** - No need to create instances, just call static methods  
✅ **Named Parameters** - More readable and IDE-friendly  
✅ **Type Safety** - `VoidCallback` instead of `Function`  
✅ **Better Performance** - Fixed state management bugs  
✅ **More Features** - Custom widgets, icons, better styling options  

## 💡 Tips

1. **Loading Dialogs**: Always remember to dismiss loading dialogs when your operation completes
2. **Context**: Make sure to use the correct BuildContext
3. **Customization**: Use `config` parameter for advanced styling
4. **Platform**: Dialog automatically adapts to the platform - no configuration needed!

## 🐛 Common Issues

**Loading dialog won't dismiss?**
- Make sure you're calling `SmoothLoadingDialog.dismiss()` after your async operation

**Dialog appears behind other widgets?**
- Ensure you're using the correct BuildContext from your widget tree

## 🤝 Contributing

Contributions are welcome! If you find a bug or want to add a feature:

1. Open an issue on [GitHub](https://github.com/Pisey-Nguon/flutter_smooth_dialog)
2. Submit a pull request
3. Share your feedback!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Pisey Nguon**
- GitHub: [@Pisey-Nguon](https://github.com/Pisey-Nguon)

## ⭐ Show Your Support

Give a ⭐️ if this project helped you!
