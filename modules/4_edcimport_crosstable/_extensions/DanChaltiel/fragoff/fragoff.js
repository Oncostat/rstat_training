window.RevealFragOff = function () {
  return {
    id: "RevealFragOff",
    init: function (deck) {
      fragoff.log(deck);

      let toolbar = document.querySelector(".slide-menu-items");
      let fragments = document.querySelectorAll('.fragment');

      let newLi = document.createElement("li");
      newLi.classList.add("slide-menu-item");

      let checkbox = document.createElement("input");
      checkbox.type = "checkbox";
      checkbox.id = "fragoff_checkbox";
      checkbox.checked = true;

      let label = document.createElement("label");
      label.textContent = "Fragments enabled";

      newLi.appendChild(checkbox);
      newLi.appendChild(label);
      newLi.style.textAlign = "center";
      toolbar.insertBefore(newLi, toolbar.firstChild);

      newLi.addEventListener("click", function(event) {
        fragments = document.querySelectorAll('.fragment');
        fragoff.log("<li> cliquée !");
        if(event.srcElement.id!="fragoff_checkbox"){
          checkbox.checked = !checkbox.checked;
          checkbox.dispatchEvent(new Event("change"));
          event.stopPropagation();
        }
      });

      checkbox.addEventListener("change", function() {
          if (this.checked) {
            fragoff.log("Checkbox décochée -> cochée");
            label.textContent = "Fragments enabled"
            fragments.forEach(frag => {
              frag.classList.add('fragment')
              frag.classList.remove('disabled_fragment')
            });
          } else {
            fragoff.log("Checkbox cochée -> décochée");
            label.textContent = "Fragments disabled"
            fragments.forEach(frag => {
              frag.classList.add('disabled_fragment')
              frag.classList.remove('fragment')
            });
          }
      });

    },
  };
};

//run `fragoff.verbose = true` in the console to activate the logs
window.fragoff = {
  verbose: false,
  log: function(...args) {
    if (this.verbose) console.log(...args)
  }
}
