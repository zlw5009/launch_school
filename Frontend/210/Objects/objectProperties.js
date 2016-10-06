function objectHasProperty(object, string) {
  return Object.keys(object).includes(string);
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

// console.log(objectHasProperty(pets, 'true'));

function incrementProperty(object, propertyName) {
  if (object[propertyName]) {
    object[propertyName] += 1;
  } else {
    object[propertyName]= 1;
  }

  return object[propertyName];
}

var wins = {
  steve: 3,
  susie: 4,
};

// console.log(incrementProperty(wins, 'susie'));
// console.log(wins);
// console.log(incrementProperty(wins, 'lucy'));
// console.log(wins);

function copyProperties(source, destination) {
  var count = 0;
  for (var property in source) {
    destination[property] = source[property];
    count++;
  }

  return count;
}

function wordCount(string) {
  var count = {};
  var properties = string.split(' ' || ',');

  for (var i = 0; i < properties.length; i++) {
    if (!object[properties[i]]) {
      object[properties[i]] = 0;
    }

    object[properties[i]] += 1;
  }

  return object;
}

console.log(wordCount('box car cat bag box'));

