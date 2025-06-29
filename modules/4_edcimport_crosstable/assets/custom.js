
console.log("custom.js")

selectNonNested = function(className) {
  const $ = (selector) => document.querySelectorAll(selector);
  const cleanClassName = className.startsWith('.') ? className : `.${className}`;
  return document.querySelectorAll(`${cleanClassName}:not(${cleanClassName} ${cleanClassName})`);
}


init = function(event) {

  console.log("custom.js -> init")


  // tous les callouts deviennent des fragments non incrémentaux
  callouts = document.querySelectorAll(".callout")
  callouts.forEach(element => {
      element.parentElement.classList.add('fragment', 'nonincremental');
      element.classList.add('nonincremental');
  });

  // tous les chunks et leur output deviennent des fragments
  code_chunks = selectNonNested(".sourceCode")
  code_chunks.forEach(element => {
    if(element.closest(".no_fragment") == null)
      element.classList.add('fragment');
  });

  code_output = selectNonNested(".cell-output-display")
  code_output.forEach(element => {
    if(element.closest(".no_fragment") == null)
      element.classList.add('fragment');
  });

}

later = function(event) {

  console.log("custom.js -> later")

  // si on définit real-fragment-index, on remplace fragment-index en postprod
  // résout le bug du non-incremental
  // interaction avec incremental=true donc setTimeout mais c'est pas très propre...
  const elements = document.querySelectorAll('[data-real-fragment-index]');
  elements.forEach(element => {
      const value = element.getAttribute('data-real-fragment-index');
      element.setAttribute('data-fragment-index', value);
  });
}



window.addEventListener("ready", (event) => {
  console.log("EVENT: window ready")
  Reveal.on('ready', (event) => {
    console.log("EVENT: Reveal ready")
  });
  Reveal.on('slidechanged', (event) => {
    console.log("EVENT: slidechanged")
    later()//overkill: on lance à chaque changement de slide
  });

  //setTimeout(later, 1000); //in ms
  init()
});

