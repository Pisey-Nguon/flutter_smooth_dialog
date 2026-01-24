# Migration Guide: v0.0.4 → v1.0.0

This guide helps you migrate from smooth_dialog v0.0.4 to v1.0.0.

## Overview of Changes

v1.0.0 introduces a completely redesigned API that's simpler, more type-safe, and more powerful. The old builder-pattern API has been deprecated but is still available for backward compatibility.

### Key Changes

1. **Static Methods**: Replaced builder pattern with static `show()` methods
2. **DialogButton Pattern**: Button text and actions are combined in `DialogButton` objects
3. **Explicit Dialog Control**: Use `dialog.dismiss()` to close dialogs
4. **Enhanced Customization**: New configuration classes for comprehensive styling
5. **Better Type Safety**: Proper typing throughout the codebase

**New Pattern Example:**
```dart
positiveButton: DialogButton(
  text: 'OK',
  onPressed: (dialog) {
    dialog.dismiss(); // Explicit control
    handleAction();
  },
)
```

## Quick Migration

### Alert Dialogs

**Old API (v0.0.4)**
```dart
final smoothDialog = SmoothDialog(context);
smoothDialog
  .setTitleHeader("Confirm Action")
  .setDescription("Are you sure you want to proceed?")
  .setTitlePositive("Confirm")
  .setTitleNegative("Cancel")
  .addButtonPositiveListener(() {
    print("Confirmed");
  })
  .addButtonNegativeListener(() {
    print("Cancelled");
  })
  .addDismissListener(() {
    print("Dialog dismissed");
  })
  .setBarrierDismissible(true)
  .showDialog();
```

**New API (v1.0.0)**
```dart
SmoothAlertDialog.show(
  context: context,
  title: "Confirm Action",
  content: "Are you sure you want to proceed?",
  positiveButton: DialogButton(
    text: "Confirm",
    onPressed: (dialog) {
      dialog.dismiss();
      print("Confirmed");
    },
  ),
  negativeButton: DialogButton(
    text: "Cancel",
    onPressed: (dialog) {
      dialog.dismiss();
      print("Cancelled");
    },
  ),
  onDismissed: () {
    print("Dialog dismissed");
  },
  config: SmoothDialogConfig(
    barrierDismissible: true,
  ),
);
```

### Loading Dialogs

**Old API (v0.0.4)**
```dart
final smoothDialog = SmoothDialog(context);
smoothDialog
  .setTitleLoading("Loading...")
  .showLoadingDialog();

// Later...
smoothDialog.dismissLoading();
```

**New API (v1.0.0)**
```dart
SmoothLoadingDialog.show(
  context: context,
  message: "Loading...",
);

// Later...
SmoothLoadingDialog.dismiss();
```

## Step-by-Step Migration

### Step 1: Update Dependencies

Update your `pubspec.yaml`:

```yaml
dependencies:
  smooth_dialog: ^1.0.0  # was ^0.0.4
```

Run:
```bash
flutter pub get
```

### Step 2: Update Imports

No changes needed - imports remain the same:
```dart
import 'package:smooth_dialog/smooth_dialog.dart';
```

### Step 3: Replace Dialog Instances

#### Option A: Quick Fix (Using Legacy API)

The legacy API still works but shows deprecation warnings:

```dart
// This still works but is deprecated
final dialog = SmoothDialog(context);  // ⚠️ Deprecated
dialog.setTitleHeader("Title").showDialog();  // ⚠️ Deprecated
```

#### Option B: Migrate to New API (Recommended)

Replace with the new static methods:

```dart
// New modern API
SmoothAlertDialog.show(
  context: context,
  title: "Title",
);
```

## Common Migration Patterns

### Pattern 1: Basic Alert

**Before:**
```dart
SmoothDialog(context)
  .setTitleHeader("Success")
  .setDescription("Operation completed")
  .showDialog();
```

**After:**
```dart
SmoothAlertDialog.show(
  context: context,
  title: "Success",
  content: "Operation completed",
  positiveButton: DialogButton(
    text: 'OK',
    onPressed: (dialog) => dialog.dismiss(),
  ),
);
```

### Pattern 2: Confirm Dialog

**Before:**
```dart
SmoothDialog(context)
  .setTitleHeader("Delete")
  .setDescription("Delete this item?")
  .setTitlePositive("Delete")
  .setTitleNegative("Cancel")
  .addButtonPositiveListener(() => deleteItem())
  .showDialog();
```

**After:**
```dart
SmoothAlertDialog.show(
  context: context,
  title: "Delete",
  content: "Delete this item?",
  positiveButton: DialogButton(
    text: 'Delete',
    onPressed: (dialog) {
      dialog.dismiss();
      deleteItem();
    },
  ),
  negativeButton: DialogButton(
    text: 'Cancel',
    onPressed: (dialog) => dialog.dismiss(),
  ),
);
```

### Pattern 3: Non-Dismissible Dialog

**Before:**
```dart
SmoothDialog(context)
  .setTitleHeader("Please Wait")
  .setBarrierDismissible(false)
  .showDialog();
```

**After:**
```dart
SmoothAlertDialog.show(
  context: context,
  title: "Please Wait",
  positiveButton: DialogButton(
    text: 'OK',
    onPressed: (dialog) => dialog.dismiss(),
  ),
  config: SmoothDialogConfig(
    barrierDismissible: false,
  ),
);
```

### Pattern 4: Loading Dialog

**Before:**
```dart
final dialog = SmoothDialog(context);
dialog.setTitleLoading("Processing...").showLoadingDialog();

// Later
dialog.dismissLoading();
```

**After:**
```dart
SmoothLoadingDialog.show(
  context: context,
  message: "Processing...",
);

// Later
SmoothLoadingDialog.dismiss();
```

## New Features in v1.0.0

Take advantage of new capabilities not available in v0.0.4:

### Custom Icons

```dart
SmoothAlertDialog.show(
  context: context,
  title: "Success",
  config: SmoothDialogConfig(
    icon: Icon(Icons.check_circle, size: 64, color: Colors.green),
  ),
);
```

### Custom Widgets

```dart
SmoothAlertDialog.show(
  context: context,
  titleWidget: MyCustomTitleWidget(),
  contentWidget: MyCustomContentWidget(),
);
```

### Advanced Styling

```dart
SmoothAlertDialog.show(
  context: context,
  title: "Styled Dialog",
  config: SmoothDialogConfig(
    backgroundColor: Colors.blue.shade50,
    titleStyle: TextStyle(fontSize: 24, color: Colors.blue),
    animationDuration: Duration(milliseconds: 500),
    animationCurve: Curves.elasticOut,
  ),
);
```

### Custom Loading Indicators

```dart
SmoothLoadingDialog.show(
  context: context,
  config: SmoothLoadingConfig(
    customIndicator: MyCustomSpinner(),
    backgroundColor: Colors.purple.shade50,
    size: 120,
  ),
);
```

## Breaking Changes

### 1. API Structure

- `SmoothDialog` class is now deprecated
- New static methods: `SmoothAlertDialog.show()` and `SmoothLoadingDialog.show()`

### 2. Method Names

| Old (v0.0.4) | New (v1.0.0) |
|--------------|--------------|
| `setTitleHeader()` | `title` parameter |
| `setDescription()` | `content` parameter |
| `setTitlePositive()` | `positiveButtonText` parameter |
| `setTitleNegative()` | `negativeButtonText` parameter |
| `addButtonPositiveListener()` | `onPositivePressed` parameter |
| `addButtonNegativeListener()` | `onNegativePressed` parameter |
| `addDismissListener()` | `onDismissed` parameter |
| `setBarrierDismissible()` | `config.barrierDismissible` |
| `showDialog()` | Automatic on `show()` |
| `dismissDialog()` | Auto-dismiss on button press |

### 3. Callback Types

- Changed from `Function` to `void Function(BuildContext context)` for better control
- Callbacks now receive the dialog context to allow manual dismissal
- This provides Android-like behavior where you control when the dialog closes

**Before:**
```dart
.addButtonPositiveListener(() {
  // Function type - no context
  print("Confirmed");
})
```

**After:**
```dart
onPositivePressed: (context) {
  Navigator.of(context).pop(); // You control dismissal
  print("Confirmed");
}
```

**Important:** You must now manually dismiss the dialog in your callbacks using `Navigator.of(context).pop()`. This gives you full control, similar to Android's native dialogs.

## Deprecation Timeline

- **v1.0.0**: Legacy API deprecated with warnings
- **v2.0.0**: Legacy API will be removed

## Need Help?

If you encounter issues during migration:

1. Check the [OPTIMIZATION_SUMMARY.md](OPTIMIZATION_SUMMARY.md) for detailed changes
2. Review the [example app](example/lib/main.dart) for working examples
3. Open an issue on [GitHub](https://github.com/Pisey-Nguon/flutter_smooth_dialog/issues)

## Benefits of Migrating

✅ **Cleaner Code**: 30% less boilerplate  
✅ **Better Type Safety**: Compile-time error checking  
✅ **More Features**: Icons, custom widgets, advanced styling  
✅ **Better Performance**: Fixed state management bugs  
✅ **Better IDE Support**: Improved autocomplete and documentation  

---

**Happy coding with Smooth Dialog v1.0.0!** 🎉
