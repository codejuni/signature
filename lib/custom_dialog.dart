import 'package:flutter/material.dart';
import 'package:signature/custom_button.dart';

void customDialog({
  required BuildContext context,
  required String title,
  required String text,
  required VoidCallback accept,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: const Color(0xFF333333),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        text: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomButton(
                        text: 'Accept',
                        onTap: () {
                          Navigator.pop(context);
                          accept();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
