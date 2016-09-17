var grade1 = Number(prompt('Enter score 1: '));
var grade2 = Number(prompt('Enter score 2: '));
var grade3 = Number(prompt('Enter score 3: '));

var avgScore = (grade1 + grade2 + grade3) / 3;

  if (avgScore >= 90){
    console.log('Based on the average of your 3 scores, your letter grade is \"A"');
  } else if (avgScore < 90 && avgScore >= 70) {
    console.log('Based on the average of your 3 scores, your letter grade is \"B"');
  } else if (avgScore < 70 && avgScore >= 50) {
    console.log('Based on the average of your 3 scores, your letter grade is \"C"');
  } else if (avgScore < 50) {
    console.log('Based on the average of your 3 scores, your letter grade is \"F"');
  }

