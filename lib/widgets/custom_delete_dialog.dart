import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CDeleteAlertDialog extends StatelessWidget {
  const CDeleteAlertDialog({this.functionDeleteString, this.functionDeleteVoid, this.id = '', Key? key})
      : super(key: key);
  final void Function(String)? functionDeleteString;
  final void Function()? functionDeleteVoid;
  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: const Text('Are you sure?!', style: TextStyle(color: Colors.red)),
      content: RichText(
          text: const TextSpan(children: [
        TextSpan(text: 'Do you want to '),
        TextSpan(text: 'DELETE ', style: TextStyle(color: Colors.red)),
        TextSpan(text: 'this item?')
      ])),
      actions: <Widget>[
        TextButton(
          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
          onPressed: () => Modular.to.pop(),
          child: const Text('No', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
          onPressed: () => {id == '' ? functionDeleteVoid!() : functionDeleteString!(id), Modular.to.pop()},
          child: const Text('Yes', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
