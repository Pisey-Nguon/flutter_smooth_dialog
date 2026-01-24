## 1.0.0 - Major Release 🎉

### Breaking Changes
* **Complete API redesign** - Replaced builder pattern with clean, modern static methods using named parameters
* **Removed old API** - `SmoothDialog` class with builder pattern no longer available
* **Simplified callbacks** - Button text and actions are combined in `DialogButton` objects: `DialogButton(text: 'OK', onPressed: (dialog) => dialog.dismiss())`
* **Manual dismissal required** - Buttons no longer auto-dismiss dialogs, giving you full control

### New Features
* ✨ **Simplified API** - Use `SmoothAlertDialog.show()` and `SmoothLoadingDialog.show()` with named parameters
* 🎯 **Clean button pattern** - `DialogButton` class combines text and action in one place
* 🎨 **Enhanced customization** - New `SmoothDialogConfig` and `SmoothLoadingConfig` for comprehensive styling
* 🎭 **Custom widgets** - Support for `titleWidget` and `contentWidget` for full UI control
* 🖼️ **Icon support** - Add icons to alert dialogs easily
* 🎬 **Customizable animations** - Control animation duration and curves
* 💪 **Better type safety** - Proper typing throughout the codebase
* 📱 **Improved responsive design** - Better sizing and layout on all screen sizes

### Bug Fixes
* 🐛 Fixed critical state management bug where `_isShowing` flag was incorrectly reset
* 🐛 Fixed loading dialog dismiss issues with proper overlay management
* 🐛 Improved memory management and lifecycle handling

### Improvements
* ⚡ Better performance with optimized widget rebuilds
* 📚 Comprehensive documentation and examples
* 🎯 More intuitive API with better IDE autocomplete support
* 🧹 Cleaner codebase with better organization
* 🔗 Dialog controller provides explicit control over dismissal

### Migration Guide
See README.md and MIGRATION_GUIDE.md for detailed migration instructions from v0.0.4 to v1.0.0

**Key Change:** Button text and actions are now combined:
```dart
// Old (v0.0.4)
onPositivePressed: () => doSomething()

// New (v1.0.0)
positiveButton: DialogButton(
  text: 'OK',
  onPressed: (dialog) {
    dialog.dismiss();
    doSomething();
  },
)
```

## 0.0.4

* Add loading dialog
* Optimize structure of code

## 0.0.3

* Add license to the project
* Fix the issue can run show dialog on web