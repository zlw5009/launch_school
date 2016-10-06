function objectHasProperty(object, string) {
  if (Object.keys(object).includes(string)) {
    return true;
  }

  return false;
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog'));