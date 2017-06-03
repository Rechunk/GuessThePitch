import 'package:flutter/material.dart';

FractionalOffsetTween rightToLeft = new FractionalOffsetTween(
begin: FractionalOffset.topRight,
end: FractionalOffset.topLeft,
);

FractionalOffsetTween leftToRight = new FractionalOffsetTween(
  begin: new FractionalOffset(-1.0, 0.0),
  end: FractionalOffset.topLeft,
);