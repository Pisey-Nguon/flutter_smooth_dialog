import 'dart:io';
import 'package:easy_dialog/resources_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimDialog {

  final BuildContext context;
  final ResourcesDialog resourcesDialog;

  AnimDialog(this.context,this.resourcesDialog);

  bool _isShowing = false;

  /// Show progress dialog
  void show() {
    if (!_isShowing) {
      _isShowing = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: resourcesDialog.barrierDismissible,
          barrierLabel: "",
          pageBuilder: (context,anim1,anim2){
            return _getDialogWidget();
          },
          transitionBuilder: (context,anim1,anim2,child){
            return FadeTransition(opacity: anim1,child: child,);
          },
        transitionDuration: resourcesDialog.animationDuration != null ? resourcesDialog.animationDuration! : const Duration(milliseconds: 300)
      );
      _isShowing = false;
    }
  }

  /// Dismiss progress dialog
  void dismiss() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.pop(context);
    }
  }

  Widget _getDialogWidget(){
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.95, end: 1),
        duration: resourcesDialog.animationDuration != null ? resourcesDialog.animationDuration! : const Duration(milliseconds: 200) ,
        builder: (context, double val, child) {
          return Transform.scale(
            scale: val,
            child: _validateWidgetByPlatform(),
          );
        });
  }

  Widget _validateWidgetByPlatform(){
    if(Platform.isAndroid){
      return _androidDialog();
    }else{
      return _iOSDialog();
    }
  }

  Widget _androidDialog(){
    return AlertDialog(
      backgroundColor: resourcesDialog.backgroundColor,
      title: resourcesDialog.titleHeader != null ? Text(resourcesDialog.titleHeader!) : null,
      content: resourcesDialog.description != null ? Text(resourcesDialog.description!) : null,
      actions: <Widget>[
        if(resourcesDialog.titleNegative != null) TextButton(
          child: Text(
            resourcesDialog.titleNegative!,
            style: const TextStyle(color: Colors.black),
          ),
          onPressed: () {
            resourcesDialog.onDismissListener?.call();
            resourcesDialog.onNegativeListener?.call();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            resourcesDialog.titlePositive != null ? resourcesDialog.titlePositive! : "OK",
            style: const TextStyle(color: Colors.black),
          ),
          onPressed: () {
            resourcesDialog.onDismissListener?.call();
            resourcesDialog.onPositiveListener?.call();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _iOSDialog(){
    return CupertinoAlertDialog(
      title: resourcesDialog.titleHeader != null ? Text(resourcesDialog.titleHeader!) : null,
      content: resourcesDialog.description != null ? Text(resourcesDialog.description!) : null,
      actions: <Widget>[
        if(resourcesDialog.titleNegative != null) CupertinoDialogAction(
          child: Text(
            resourcesDialog.titleNegative!,
            style: const TextStyle(color: Colors.black),
          ),
          onPressed: () {
            resourcesDialog.onDismissListener?.call();
            resourcesDialog.onNegativeListener?.call();
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text(
            resourcesDialog.titlePositive != null ? resourcesDialog.titlePositive! : "OK",
            style: const TextStyle(color: Colors.black),
          ),
          onPressed: () {
            resourcesDialog.onDismissListener?.call();
            resourcesDialog.onPositiveListener?.call();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}