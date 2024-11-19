
console.log("custom.js")

const $ = (selector) => document.querySelectorAll(selector);

const selectNonNested = function(className) {
    const cleanClassName = className.startsWith('.') ? className : `.${className}`;
    return document.querySelectorAll(`${cleanClassName}:not(${cleanClassName} ${cleanClassName})`);
}


const init = function(event) {

  console.log("custom.js -> init")

  // tous les chunks et leur output deviennent des fragments
  code_chunks = selectNonNested(".sourceCode")
  code_chunks.forEach(element => {
      element.classList.add('fragment');
  });

  code_output = selectNonNested(".cell-output-display")
  code_output.forEach(element => {
      element.classList.add('fragment');
  });

  // tous les callouts deviennent des fragments non incrémentaux
  callouts = $(".callout")
  callouts.forEach(element => {
      element.classList.add('fragment', 'nonincremental');
  });

}
window.addEventListener("ready", (event) => {
  console.log("EVENT: window ready")
  init()
});

