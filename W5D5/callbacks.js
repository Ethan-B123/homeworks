window.setTimeout(()=>{
  alert("HAMMERTIME");
}, 5000);

const toClosure = function(time) {
  window.setTimeout(()=>{
    alert(`${time} is hammertime!`);
  }, 5000);
}
