enum Categories {
  abstract,
  animal_painting,
  cityscape,
  figurative,
  flower_painting,
  genre_painting,
  landscape,
  marina,
  mythological_painting,
  nude_painting_nu,
  portrait,
  religious_painting,
  still_life,
  symbolic_painting,
}

// an extention to format category enum to only name and replace accordignly
extension ParseToString on Categories {
  String toShortString() {
    return this.toString().split(".")[1].replaceAll("_", "-");
  }
}
