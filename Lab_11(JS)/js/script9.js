//Array Objects Method
const productos = [
    {nombre: 'Monitor', precio:500},
    {nombre: 'Television', precio:700},
    {nombre: 'Tablet', precio:300},
    {nombre: 'Audifono', precio:50},
    {nombre: 'Celular', precio:500},
]
//METHODS
//some -> Si se encuentra un objeto
let result = productos.some(function(p){
    return p.nombre === 'Monitor';
})
console.log(result);

result = productos.some(function(total){
    return total === productos.precio;
}, 0);
console.log(result);
//reduce -> Almacena un resultado
result = productos.reduce(function(total, producto){
    return total + producto.precio;
},0);
console.log(result);


//Arrow function
result = productos.reduce((total, producto)=> total + producto.precio
,0);
console.log(result);

//filter -> elementos de acuerdo a una condición
result = productos.filter((producto)=>producto.precio === 400, 0);
console.log(result);
