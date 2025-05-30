window.RevealFragOff = function () {
  return {
    id: "RevealFragOff",
    init: function (deck) {

      console.log(deck);

      let toolbar = document.querySelector(".slide-menu-items");

      let newLi = document.createElement("li");
      newLi.classList.add("slide-menu-item");

      let checkbox = document.createElement("input");
      checkbox.type = "checkbox";
      checkbox.id = "fragoff_checkbox";
      checkbox.checked = true;

      let label = document.createElement("label");
      label.htmlFor = "fragoff_checkbox";
      label.textContent = "Fragments enabled";

      newLi.appendChild(checkbox);
      newLi.appendChild(label);
      newLi.style.textAlign = "center";
      toolbar.insertBefore(newLi, toolbar.firstChild);

      let fragments = document.querySelectorAll('.fragment');
      newLi.addEventListener("click", function() {
        console.log("<li> cliquée !");
        checkbox.checked = !checkbox.checked;
        checkbox.dispatchEvent(new Event("change"));
      });
      checkbox.addEventListener("change", function() {
          if (this.checked) {
            console.log("Checkbox cochée !");
            fragments.forEach(frag => {
              frag.classList.add('fragment')
              frag.classList.remove('disabled_fragment')
              label.textContent = "Fragments enabled"
            });
          } else {
            console.log("Checkbox décochée !");
            fragments.forEach(frag => {
              frag.classList.add('disabled_fragment')
              frag.classList.remove('fragment')
              label.textContent = "Fragments disabled"
            });
          }
      });

    },
  };
};

