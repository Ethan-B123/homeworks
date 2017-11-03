const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// reader.question("Like some tea?", (res)=>{
//   if (res === "yes") {
//     console.log("I'll put on a pot");
//   } else {
//     console.log('No tea for you');
//   }
// });


function teaAndBiscuits () {
  let first, second;

  reader.question('Would you like some tea?', (res) => {
    first = res;
    console.log(`You replied ${res}.`);
    q2();
  });


  const q2 = function(){
    reader.question('Would you like some biscuits?', (res) => {
      second = res;
      console.log(`You replied ${res}.`);
      printRes();
    });
  }

  const printRes = function(){
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';
    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
  }

}

teaAndBiscuits();
