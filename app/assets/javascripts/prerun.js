
var Module = {}

function sayAbc() {
    console.log("pre-run, abc");
}

function sayXyz() {
    console.log("post run CARALho, xyz");
    e();
}

function sayOnInit() {
    console.log("on init");
    
}

Module.preRun = [sayAbc];
Module.onInit = [sayOnInit];

function notifyReady() {
    var event = new Event("wasmLoaded");
    window.dispatchEvent(event);
}

Module.postRun=[sayXyz, notifyReady];

window.addEventListener("wasmLoaded", function() {
    console.log("wasm all loaded, saying hi.");
   
})
	
