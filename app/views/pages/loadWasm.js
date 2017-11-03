// loadWasm.js
Module = {};    // create the Module object to hold the wasm code

loadWASM = () => {
  
  return new Promise((resolve) => {
    
    fetch("wget.wasm")    // load the .wasm file
      .then(response => response.arrayBuffer())
      .then((buffer) => {    //return ArrayBuffer
        Module.wasmBinary = buffer;   // assign buffer to Module
        
        const script = document.createElement('script');
        script.src = 'wget.js';   // set script source
        
        script.onload = () => {    // once script has loaded
          console.log("Loaded Emscripten.");
          resolve(Module);    // return Module
        };

        document.body.appendChild(script); // append script to DOM
      });
  });
};


loadWASM().then((m) => {    // 'm' now holds _myFunc()
  
});