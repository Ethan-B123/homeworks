function titleize(names, cb){
  let newNames = names.map((name) => "Mx. " + name + " Jingleheimer Schmidt")
  cb(newNames)
}

// titleize(["Mary", "Brian", "Leo"], (title) => console.log(title))


function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}
Elephant.prototype.trumpet = function() {
  console.log(this.name + " the elephant goes 'phrRRRRRRRRRRR!!!!!!!'");
};
Elephant.prototype.grow = function() {
  this.height += 12;
};
Elephant.prototype.addTrick = function(newTrick) {
  this.tricks += newTrick;
};
Elephant.prototype.play = function() {
  let trick = this.tricks[getRandomInt(0, this.tricks.length)];
  console.log(this.name + " is " + trick + "!");
};


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

const paradeHelper = (elephant) => {
  console.log(elephant.name + " is trotting by!");
}


herd.forEach(paradeHelper);








//
