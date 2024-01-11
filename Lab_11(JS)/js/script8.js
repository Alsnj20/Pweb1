//Arrays
const numbers = [10, 20, 30, 50];
console.log(numbers);5
let months = ['hola', 'February', 'March', 'April', 'May'];
console.log(months);
const varia = ['Hi', [1,2,3], null, true, {Name: "Juan", Work: "Programming"}];
console.log(varia);

//Acces array value
console.log(typeof varia[4]);
console.log(varia[4].Name);
//large array
console.log(numbers.length);
//Iterar sobre todos los elementos de un array
months.forEach(function(n){
    console.log(n);
});
//Iterar sobre todos los elementos de un arrow functions
months.forEach((n)=>{
    console.log(n)
});

//METHODS
//Elimina el final
months.pop();
//Elimina al inicio
months.shift();
//Agregar al final
months.push('June');
//Agregar al inicio
months.unshift('January');

console.log(months);
// ...-> concatena arreglos
let months2 = [...months, 'July', 'August', 'October'];
console.log(months2);

//una iteracion con condicion o un if
let result = months.includes('October');
console.log(result);





