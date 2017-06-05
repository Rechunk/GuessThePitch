import 'package:flutter/material.dart';

FractionalOffsetTween rightToLeft = new FractionalOffsetTween(
  begin: FractionalOffset.topRight,
  end: FractionalOffset.topLeft,
);

FractionalOffsetTween leftToRight = new FractionalOffsetTween(
  begin: new FractionalOffset(-1.0, 0.0),
  end: FractionalOffset.topLeft,
);

class CustomRoute<T> extends MaterialPageRoute<T> {
  FractionalOffsetTween tween;
  CustomRoute({
    WidgetBuilder builder,
    FractionalOffsetTween navigationDirection,
  }): this.tween = navigationDirection, super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child)
  {
    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      position: tween
          .animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
          )
      ),
      child: child,
    );
  }

  @override Duration get transitionDuration => const Duration(milliseconds: 300);
}