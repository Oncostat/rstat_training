window.RevealFragOff = function () {
  return {
    id: "RevealFragOff",
    init: function (deck) {
      fragoff.log(deck);

      const menu = document.querySelector(".slide-menu");
      const panel = document.querySelector(".slide-menu-panel");

      const span = document.createElement("span");
      span.classList.add("slide-menu-item");

      const checkbox = document.createElement("input");
      checkbox.type = "checkbox";
      checkbox.id = "fragoff_checkbox";
      checkbox.checked = true;

      const label = document.createElement("label");
      label.textContent = "Fragments enabled";

      span.appendChild(checkbox);
      span.appendChild(label);
      span.style.textAlign = "center";
      menu.insertBefore(span, panel);


      span.addEventListener("click", function(event) {
        fragoff.log("<li> cliquée !");
        if(event.srcElement.id!="fragoff_checkbox"){
          checkbox.checked = !checkbox.checked;
          checkbox.dispatchEvent(new Event("change"));
          event.stopPropagation();
        }
      });

      checkbox.addEventListener("change", function() {
          if (this.checked) {
            fragoff.log("Checkbox unchecked -> checked: enabling fragments");
            label.textContent = "Fragments enabled"
            const fragments = document.querySelectorAll('.disabled_fragment');
            fragments.forEach(frag => {
              frag.classList.add('fragment')
              frag.classList.remove('disabled_fragment')
            });
          } else {
            fragoff.log("Checkbox checked -> unchecked:  disabling fragments");
            label.textContent = "Fragments disabled"
            const fragments = document.querySelectorAll('.fragment');
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
