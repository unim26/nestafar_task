import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  final String title;
  final void Function() onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        enableFeedback: true,
        minimumSize: Size(double.infinity, 55),
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: onPressed,
      child:
          icon == null
              ? Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //icon
                  Icon(icon),

                  //text
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
    );
  }
}
