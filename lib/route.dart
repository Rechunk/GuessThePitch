import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  FractionalOffsetTween tw;
  CustomRoute(FractionalOffsetTween tween, {
    WidgetBuilder builder,
  }): this.tw = tween, super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child)
  {
    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      position: tw
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