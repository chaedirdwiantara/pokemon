import 'package:flutter/material.dart';

Map<String, List<Color>> typeGradientColors = {
  'normal': [Colors.grey, Colors.blueGrey],
  'fighting': [Colors.red, Colors.orange],
  'flying': [Colors.blue, Colors.lightBlue],
  'poison': [Colors.purple, Colors.deepPurple],
  'ground': [Colors.brown, Colors.orange],
  'rock': [Colors.brown, Colors.grey],
  'bug': [Colors.lightGreen, Colors.green],
  'ghost': [Colors.indigo, Colors.deepPurple],
  'steel': [Colors.blueGrey, Colors.grey],
  'fire': [Colors.redAccent, Colors.orangeAccent],
  'water': [Colors.blue, Colors.lightBlue],
  'grass': [Colors.green, Colors.lightGreen],
  'electric': [Colors.yellow, Colors.amber],
  'psychic': [Colors.pink, Colors.purple],
  'ice': [Colors.cyan, Colors.lightBlue],
  'dragon': [Colors.indigo, Colors.deepPurple],
  'dark': [Colors.black, Colors.grey],
  'fairy': [Colors.pink, Colors.purple],
  'unknown': [Colors.grey, Colors.black],
  'shadow': [Colors.black, Colors.indigo],
};

List<Color> getGradientColors(String type) {
  return typeGradientColors[type.toLowerCase()] ??
      [Colors.grey, Colors.blueGrey];
}
