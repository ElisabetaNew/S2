use S204

// 1.	Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants

db.restaurants.find({})

// 2.	Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine per tots els documents en la col·lecció Restaurants

db.restaurants.find({}, {"restaurant_id":1, "name":1, "borough":1, "cuisine":1})

// 3.    Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però excloure el camp _id per tots els documents en la col·lecció Restaurants

db.restaurants.find({}, {"_id":false, "restaurant_id":1, "name":1, "borough":1, "cuisine":1})

// 4.   ??? Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però excloure el camp _id per tots els documents en la col·lecció Restaurants

db.getCollection('restaurants').aggregate([
   { "$lookup": {
     "from": "address",
     "foreignField": "_id",
     "localField": "_id",
     "as": "restaurantecompleto"
   }}
 ]);
db.restaurants.find({},{_id:0, restaurant_id:1, name:1, borough:1, "address.zipcode":true})
db.restaurants.address.find({})

// 5.	Escriu una consulta per mostrar tot els restaurants que estan en el Bronx

db.restaurants.find({}, {"borough":"Bronx"})

// 6.	Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx

db.restaurants.find({}, {"borough":"Bronx"}).limit(5)

// 7.	Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx

db.restaurants.find({}, {"borough":"Bronx"}).skip(5).limit(5)

// 8.   ???Escriu una consulta per trobar els restaurants que tenen un score de més de 90

db.restaurants.aggregate([{$group:{grades:"$grades",  }])
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "grades":1})

db.restaurants.updateOne(
  {
    "grades._id": "62798ea51cb18a06085828d5",
  },
  {
    $set: {
      "grades.$[grades].files.$[file].url": "something else",
    },
  },
  {
    arrayFilters: [
      { "version._id": "606592b1c5d509071857f6e7" },
      { "file._id": "606592b3c5d509071857f6e8" },
    ],
  }
);

//9.  ???  Escriu una consulta per trobar els restaurants que tenen un score de més que 80 però menys que 100

db.getCollection("restaurants").aggregate([{$project:{"address":1, "borough":1, "cuisine":1, "name":1, "restaurant_id":1}},{$match:{"_id":"62798ea51cb18a0608582f0c"}},{$unwind:"$grades"}])
restaurants.grades = restaurants

//10.    Escriu una consulta per trobar els restaurants quins localitzen en valor de latitud menys que -95.754168

db.restaurants.find({"address.coord.0":{$lt:-95.754168}})

//11.  ???  Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i el seu puntaje de qualificació superior a 70 i latitud inferior a -65.754168


db.restaurants.find({"grades.0.score":{$gt:80}})
for(i=0; i<restaurants.size(); i++){}
db.restaurants.grades.count()


db.restaurants.find({"grades.0.score":{$gt:80}})
db.restaurants.find({"cuisine": {$ne:"American"},"address.coord.0":{$lt:-65.754168}})

//12.Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van aconseguir un marcador més de 70 i localitzat en la longitud menys que -65.754168. Nota: Fes aquesta consulta sense utilitzar $and operador.

db.restaurants.find({"cuisine": {$ne:"American"}})