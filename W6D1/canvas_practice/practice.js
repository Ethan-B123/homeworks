document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = canvas.height = 500;
  ctx = canvas.getContext("2d");

  ctx.beginPath();
  ctx.arc(250, 250, 200, 0, 2 * Math.PI);

  ctx.fillStyle = "black";
  ctx.fill();

  ctx.strokeStyle = "red";
  ctx.stroke();

  ctx.fillStyle = "white";
  ctx.fillRect(150, 40, 50, 50);
});
