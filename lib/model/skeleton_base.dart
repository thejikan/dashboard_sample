import 'package:dashboard/model/constants.dart';
import 'package:flutter/material.dart';

class SkeletonBase extends StatefulWidget {
  const SkeletonBase(
      {Key? key, this.height = 24, this.width = 24, required this.shape})
      : super(key: key);

  final double? height;
  final double? width;
  final BoxShape shape;

  @override
  State<SkeletonBase> createState() => _SkeletonBaseState();
}

class _SkeletonBaseState extends State<SkeletonBase>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _gradientPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: widget.shape,
          gradient: LinearGradient(
            begin: Alignment(_gradientPosition.value, 0),
            end: const Alignment(-1, 0),
            colors: const [
              ColorsEnum.skeleton,
              ColorsEnum.gray90,
              ColorsEnum.skeleton
            ],
          ),
          color: ColorsEnum.skeleton,
          borderRadius: widget.shape == BoxShape.rectangle
              ? BorderRadius.circular(10.0)
              : null),
    );
  }
}

