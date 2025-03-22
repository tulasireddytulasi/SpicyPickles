import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maxRating;
  final int initialRating;
  final Function(int)? onRatingChanged;
  final Color starColor;
  final double starSize;
  final double starSpacing;
  final Duration animationDuration;

  StarRating({
    this.maxRating = 5,
    this.initialRating = 0,
    this.onRatingChanged,
    this.starColor = Colors.amber,
    this.starSize = 30.0,
    this.starSpacing = 4.0,
    this.animationDuration = const Duration(milliseconds: 200),
  }) : assert(initialRating >= 0 && initialRating <= maxRating);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> with TickerProviderStateMixin {
  late ValueNotifier<int> _rating;
  final Map<int, AnimationController> _animationControllers = {};
  final Map<int, Animation<double>> _animations = {};

  @override
  void initState() {
    super.initState();
    _rating = ValueNotifier<int>(widget.initialRating);
  }

  @override
  void dispose() {
    _rating.dispose();
    _animationControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Widget _buildStar(int index) {
    IconData iconData;
    Color color;

    if (_rating.value >= index + 1) {
      iconData = Icons.star;
      color = Colors.amber[600]!;
    } else {
      iconData = Icons.star_border;
      color = Colors.amber[600]!;
    }

    if (!_animationControllers.containsKey(index)) {
      _animationControllers[index] = AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      );
      _animations[index] = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationControllers[index]!, curve: Curves.easeInOut),
      );
    }

    return GestureDetector(
      onTap: () {
        _rating.value = index + 1;
        if (widget.onRatingChanged != null) {
          widget.onRatingChanged!(_rating.value);
        }
        _animationControllers[index]!.reset();
        _animationControllers[index]!.forward();
      },
      child: AnimatedBuilder(
        animation: _animations[index]!,
        builder: (context, child) {
          return Transform.scale(
            scale: _animations[index]!.value,
            child: child,
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.starSpacing / 2),
          child: Icon(
            iconData,
            size: widget.starSize,
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _rating,
      builder: (context, value, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.maxRating, (index) => _buildStar(index)),
        );
      },
    );
  }
}

