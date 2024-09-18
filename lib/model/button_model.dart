import 'package:flutter/material.dart';
import 'package:calculator_flutter/utils/constant.dart';

// List of button labels/icons
final List<Map<String, dynamic>> buttons = [
  {
    'label': 'AC',
    'color': const Color(kBtnColor),
  },
  {
    'label': 'Del',
    'color': const Color(kBtnColor),
    'icon': Icons.backspace_outlined,
  },
  {'label': '%', 'icon': Icons.percent, 'color': const Color(kBtnColor)},
  {'label': '÷', 'color': const Color(kBtnColor)},
  {'label': '7'},
  {'label': '8'},
  {'label': '9'},
  {
    'label': '×',
    'color': const Color(kBtnColor),
  },
  {'label': '4'},
  {'label': '5'},
  {'label': '6'},
  {'label': '-', 'color': const Color(kBtnColor)},
  {'label': '1'},
  {'label': '2'},
  {'label': '3'},
  {'label': '+', 'color': const Color(kBtnColor)},
  {'label': '+/-', 'icon': Icons.swap_horiz, 'color': const Color(kBtnColor)},
  {'label': '0'},
  {'label': '.'},
  {
    'label': '=',
    'color': const Color(kResultColor),
    'bg-color': const Color(kBtnColor),
  },
];
