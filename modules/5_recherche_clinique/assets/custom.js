
console.log("custom.js")

const $ = (selector) => document.querySelectorAll(selector);

const selectNonNested = function(className) {
    const cleanClassName = className.startsWith('.') ? className : `.${className}`;
    return document.querySelectorAll(`${cleanClassName}:not(${cleanClassName} ${cleanClassName})`);
}


const init = function(event) {

  console.log("custom.js -> init")


  // tous les callouts deviennent des fragments non incrémentaux
  //*
  callouts = $(".callout")
  callouts.forEach(element => {
    if(element.closest(".no_fragment") == null) {
      element.parentElement.classList.add('fragment', 'nonincremental');
      element.classList.add('nonincremental');
    }
  });
  //*/

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

  /*
  animatedImages = $('img[src$=".gif"], img[src$=".webp"]');
  animatedImages.forEach(img => {
    img.classList.add('animated-img');
    const originalSrc = img.src;
    let isPlaying = true;

    c = document.createElement('canvas');


    img.addEventListener('click', () => {
      if (isPlaying) {
        //img.src = ''; // Stop
        w = c.width = img.width;
        h = c.height = img.height;
        c.getContext('2d').drawImage(img, 0, 0, w, h);
        img.src = c.toDataURL("image/gif");
      } else {
        img.src = originalSrc + '?v=' + new Date().getTime(); // Start
      }
      isPlaying = !isPlaying;
    });
  });
  //*/
}

const later = function(event) {

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
  });

  setTimeout(later, 1000); //in ms
  init()
});

