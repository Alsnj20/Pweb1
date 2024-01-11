//String o cadena de texto
const producto = 'Monitor HD\"';
console.log(producto);
// longitud del texto
console.log(producto.length);
console.log(typeof producto);
console.log(('HD1').substring(producto));
//indexOf (-1: si no encuentra posicion)
console.log(producto.indexOf('HD'));
console.log(producto.indexOf('HD1'));
//includes(true o false)
console.log(producto.includes('HD1'));
console.log(producto.includes('HD'));
//concatenacion
const producto2 = 'Mouse';
console.log("P1: "+producto+ " - P2: "+producto2);
//la , le da un espacio adicional
console.log("P1:",producto,"P2:",producto2);
//template String - String literals (comilla invertida)
console.log(`P1: ${producto} P2: ${producto2}`);
