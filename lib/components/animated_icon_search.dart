import 'package:flutter/material.dart';

import 'package:flutter_crud_back4app/utils/assets_manager.dart';

class AnimatedIconSearch extends StatefulWidget {
  const AnimatedIconSearch({
    Key? key,
    required this.sizeIcon,
  }) : super(key: key);

  final double sizeIcon;

  @override
  State<AnimatedIconSearch> createState() => _AnimatedIconSearchState();
}

class _AnimatedIconSearchState extends State<AnimatedIconSearch>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.sizeIcon,
        child: SlideTransition(
          position: _animation,
          child: Image.asset(AssetsManager.imageIconSearch),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
