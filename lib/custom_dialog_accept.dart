import 'package:flutter/material.dart';
import 'package:signature/custom_button.dart';

void customDialogAccept({
  required BuildContext context,
  required String title,
  required String text,
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
              CustomButton(
                text: 'Accept',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
