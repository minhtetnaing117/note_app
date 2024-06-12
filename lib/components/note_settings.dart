import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTop;
  final void Function()? onDeleteTop;

  const NoteSettings({
    super.key,
    required this.onEditTop,
    required this.onDeleteTop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTop!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTop!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
                child: Text(
                    "Delete",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ),
        ),
      ],
    );
  }
}
