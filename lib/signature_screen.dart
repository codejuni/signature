import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:signature/custom_dialog.dart';
import 'package:signature/custom_dialog_accept.dart';
import 'package:signature/data_utilities.dart';
import 'package:signature/signature_painter.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  List<Offset?> points = [];
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        body: Stack(
          children: [
            body(),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.decelerate,
              right: 15,
              bottom: points.isEmpty ? 15 : 90,
              child: FloatingActionButton(
                elevation: points.isEmpty ? 0 : 5,
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  customDialog(
                    context: context,
                    title: 'Delete Signature',
                    text:
                        'Are you sure you want to delete the signature you typed?',
                    accept: () {
                      setState(() {
                        points.clear();
                      });
                    },
                  );
                },
              ),
            ),
            Positioned(
              right: 15,
              bottom: 15,
              child: FloatingActionButton(
                elevation: 5,
                onPressed: () async {
                  if (points.isEmpty) {
                    customDialogAccept(
                      context: context,
                      title: 'Error',
                      text: 'You have not placed your signature',
                    );
                  } else {
                    customDialog(
                      context: context,
                      title: 'Save Image',
                      text:
                          'Do you want to save your signature image on your device?',
                      accept: () async {
                        final image = await screenshotController
                            .captureFromWidget(body());
                        await DataUtilities.saveImage(image).whenComplete(
                            () => DataUtilities.saveAndShare(image));
                      },
                    );
                  }
                },
                backgroundColor: points.isEmpty
                    ? Colors.black
                    : Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() => GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox object = context.findRenderObject() as RenderBox;
            Offset localPosition = object.globalToLocal(details.globalPosition);
            points = List.from(points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) {
          setState(() {
            points.add(null);
          });
        },
        child: CustomPaint(
          painter: SignaturePinter(points: points),
          size: Size.infinite,
        ),
      );
}
