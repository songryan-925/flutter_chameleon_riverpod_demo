import 'package:demo/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

showColorPicker(
  BuildContext context,
  Color? initialColor, {
  required Function(Color?) onPicked,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black45,
    builder: (context) {
      return BottomSheet(
        constraints: const BoxConstraints(
          maxHeight: 600,
          maxWidth: 1000,
        ),
        onClosing: () {},
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pick a color for your app\'s theme',
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final themeModel = ref.watch(appThemeProvider);
                    return ColorPicker(
                      portraitOnly: true,
                      pickerColor: themeModel.seedColor,
                      onColorChanged: onPicked,
                      pickerAreaHeightPercent: 0.4,
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
