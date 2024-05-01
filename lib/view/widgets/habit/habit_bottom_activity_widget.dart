import 'package:flutter/material.dart';

class BottomActivityWidget extends StatelessWidget {
  const BottomActivityWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.name,
  });
  final void Function()? onPressed;
  final Icon icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card( 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: onPressed, icon: icon), 
          ),
        ),
        Text(name)
      ],
    );
  }
}
