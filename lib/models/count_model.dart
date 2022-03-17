import 'dart:ui';

class CountModel {
  final int id;
  final int value;
  final Color colorElement;

  CountModel(
    this.id,
    this.value,
    this.colorElement,
  );

  CountModel iterate() => CountModel(
        id,
        value + 1,
        colorElement,
      );
  factory CountModel.defaultModel(int id) => CountModel(id, 0, _colorParser(id));

  static Color _colorParser(int id) {
    return collectionColorsOfElement[id] ?? const Color(0xFFFF0000);
  }

  @override
  bool operator ==(dynamic other) => other is CountModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

const collectionColorsOfElement = {
  0: Color(0xFFFF6E6E),
  1: Color(0xFFDDD05E),
  2: Color(0xFF51C485),
};
