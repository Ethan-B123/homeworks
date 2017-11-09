document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  const button = document.getElementsByClassName('favorite-submit')[0];

  // adding SF places as list items

  button.addEventListener("click", (e) => {
    e.preventDefault();
    let li = document.createElement("li");
    let textInput = document.getElementsByClassName('favorite-input')[0];
    li.innerHTML = textInput.value;
    textInput.value = "";
    document.getElementById('restaurants').appendChild(li);
  });
  // --- your code here!



  // adding new photosbutton.addEventListener("click", (e) => {
  document.getElementsByClassName("photo-show-button")[0]
  .addEventListener("click", (e) => {
    e.preventDefault();
    let photoForm = document.getElementsByClassName("photo-form-container")[0];
    if (photoForm.classList.contains("hidden")) {
      photoForm.classList.remove("hidden");
    } else {
      photoForm.classList.add("hidden");
    }

  });


  document.getElementsByClassName("photo-url-submit")[0]
  .addEventListener("click", (e) => {
    e.preventDefault();

    let img = document.createElement("img");
    let textInput = document.getElementsByClassName('photo-url-input')[0];
    let ul = document.getElementsByClassName('dog-photos')[0];
    let li = document.createElement("li");
    li.appendChild(img);

    img.setAttribute("src", textInput.value);
    ul.appendChild(li);
    textInput.value = "";
  });

  // --- your code here!



});
