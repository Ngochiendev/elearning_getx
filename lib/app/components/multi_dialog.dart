import 'package:flutter/material.dart';

class MultiDialog extends StatefulWidget {
  final Widget? child;

  const MultiDialog({Key? key, this.child}) : super(key: key);
  @override
  _MultiDialogState createState() => _MultiDialogState();

  static void addDialog(
      {@required BuildContext? context, @required Widget? dialog}) {
    assert(context != null, "the context cannot be null");
    assert(dialog != null, "the dialog cannot be null");
    context!.findAncestorStateOfType<_MultiDialogState>()?._addDialog(dialog!);
  }

  static void remove({@required BuildContext? context}) {
    assert(context != null, "the context cannot be null");
    context!.findAncestorStateOfType<_MultiDialogState>()?._remove();
  }
}

class _MultiDialogState extends State<MultiDialog> {
  final _allDialogs = <Widget>[];

  void _addDialog<T>(Widget dialog) {
    assert(dialog != null, "The dialog cannot be null");
    setState(() {
      _allDialogs.add(dialog);
    });
  }

  void _remove() {
    if (_allDialogs.isEmpty) {
      print("No dialogs to remove");
      return;
    }
    setState(() {
      _allDialogs.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child!,
        if (_allDialogs.isNotEmpty) _allDialogs.last,
      ],
    );
  }
}
