console.log("custom.js")

const $ = (selector) => document.querySelectorAll(selector);

window.addEventListener("ready", (event) => {
  console.log("EVENT: window ready")
});

