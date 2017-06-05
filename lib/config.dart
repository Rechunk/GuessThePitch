import 'package:flutter/material.dart';

String helpText = "Das Spiel beginnt, sobald du auf 'Play' drückst. "
    "Innerhalb von einer Sekunde hörst du dann 5 Töne. Für jeden Ton steht "
    "einer der Schieberegler. Schätze ein, wie hoch jeweils die Töne waren, "
    "indem du sie einzeln bewegst. Drücke anschließend auf 'Done' und schaue "
    "dir deine Ergebnisse an!";

Color mainColor = Colors.red;

FractionalOffsetTween rightToLeft = new FractionalOffsetTween(
begin: FractionalOffset.topRight,
end: FractionalOffset.topLeft,
);

FractionalOffsetTween leftToRight = new FractionalOffsetTween(
  begin: new FractionalOffset(-1.0, 0.0),
  end: FractionalOffset.topLeft,
);