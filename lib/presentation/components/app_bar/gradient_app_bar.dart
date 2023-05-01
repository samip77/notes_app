import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GradientAppBar extends HookWidget implements PreferredSizeWidget {
  const GradientAppBar({
    super.key,
    required this.title,
    this.scrollController,
  });

  final String title;
  final ScrollController? scrollController;

  static const _maxOffset = 100.0;
  static const _animationDuration = 200;

  @override
  Widget build(BuildContext context) {
    final opacity = useState(1.0);

    useEffect(
      () {
        final controller = scrollController;
        if (controller == null) return null;

        controller.addListener(() {
          controller.offset > _maxOffset
              ? opacity.value = 0.0
              : opacity.value = 1.0;

          /// max(controller.offset, 0) solves the issue with negative scroll offset
          opacity.value = max(0, 1 - (max(controller.offset, 0) / _maxOffset));
        });
        return null;
      },
      [],
    );

    return AnimatedOpacity(
      duration: const Duration(milliseconds: _animationDuration),
      opacity: opacity.value,
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.green],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
