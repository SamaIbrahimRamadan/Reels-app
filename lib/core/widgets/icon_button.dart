import 'package:flutter/material.dart';

class CustomIconButton  extends StatelessWidget{
  final IconData icon;
  final void Function()? onPressed;
  final Color?  color ;
  const CustomIconButton({super.key, required this.icon,  this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:  Icon(
      icon,
        color: color ??Colors.white,
        size: 35,
      ),
      onPressed: onPressed??(){},
    );
  }

}