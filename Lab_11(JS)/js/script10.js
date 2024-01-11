//Asignament functions
function add(n1, n2){
    return n1+n2;
}
let result = add();
console.log(result);
// IIFE -> Se llaman solas, Recomendable para proteger variables
(function(){
    console.log('This is an function');
})();

//Arrow Functions
const learn = learn => console.log("Learning",learn);
learn('JavaScript');
const add2 = (n1,n2)=>console.log(n1+n2);
add2(4,5);




