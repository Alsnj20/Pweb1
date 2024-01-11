//Loop Array 
const productos = [
    {nombre: 'Monitor', precio:500},
    {nombre: 'Television', precio:700},
    {nombre: 'Tablet', precio:300},
    {nombre: 'Audifono', precio:50},
    {nombre: 'Celular', precio:500},
]
//forEach -> hacer pruebas
productos.forEach(product=>{
    console.log(product.nombre);
})
//map -> almacenar en un nuevo arreglo
const arr2 = productos.map(product=> product.nombre);