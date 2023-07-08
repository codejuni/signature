import 'package:flutter/material.dart';

// Custom button widget
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.width,
    required this.onTap,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);

  // The text to display on the button
  final String text;

  // The width of the button
  final double? width;

  // The callback function to be called when the button is tapped
  final VoidCallback onTap;

  // The icon to display on the button (optional)
  final IconData? icon;

  // The background color of the button (optional)
  final Color? color;

  // The text color of the button (optional)
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Theme.of(context).primaryColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 50,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the icon if provided
              if (icon != null)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Icon(
                    icon,
                    size: 25,
                  ),
                ),
              // Display the button text
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: textColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
