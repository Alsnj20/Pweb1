//Objects
const infoPersonal = {
    namePerson : "Enrique",
    id : 123456789,
    isMarried : false 
}
//Add new properties
infoPersonal.telf = 947387287;
console.log(infoPersonal);
console.log("Name:",infoPersonal.namePerson);
console.log("ID:",infoPersonal["id"]);
//Remove property
delete infoPersonal.isMarried;
console.log(infoPersonal);

//Descructuring
const {id} = infoPersonal;
//Same name of the property
console.log(id);

//Bad way
console.log("ID:",infoPersonal[id]);


