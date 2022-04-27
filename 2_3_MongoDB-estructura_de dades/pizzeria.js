db.dropDatabase()
use pizzeria

db.createCollection("clients")
db.clients.InsertOne({ 
    "clientId" : ObjectId("8849b4ddd2781d08c09890f1"),
    "firstName" : "Elsa",
    "lastName" : "Ellberg",
    "phoneNumber" : "93478900",
    
    address: {
        "street" : "Haverchuck street",
        "zipCode" : 090003,
        "city"  : "Somecity",
        "region": "Sonora",
    },

    order: [{"ticketId" : ObjectId("49b4ddd2781d08c09890f1"),
             "orderDate" : ISODate("2022-02-02T23:30:15.123Z"), 
             "shopId": ObjectId("55b4ddd2781d08c09890f1"),
             "employeeId": ObjectId("66b4ddd2781d08c09890f1"),
             "deliveryHour": ISODate("2022-02-03T00:10:15.123Z"),
              "order": [{"productId": ObjectId("99b4ddd2781d08c09890f1"),
                         "quantity:": 4,
                        "totalPrice": 16}, 
                        {"productId": ObjectId("99b4ddd2781d08c09890f2"),
                        "Quantity:": 2,
                       "totalPrice": 18}],
 }],
   
})


db.createCollection(products)
db.products.InsertOne({"productId": ObjectId("99b4ddd2781d08c09890f2"), 
    "productName": "pizza primavera",
    // if applied 
    "category": "seasonal",
    "productDescription": "Spring greens and stracciatella.",
    "productType": "pizza",
    "imageUrl": "'https://fastfoodt2u.com/archive/def_pizza.jpg", 
    "price": 9,
  })
    

db.createCollection(shops)
db.shops.InsertOne(
    {"shop_id": ObjectId("22b4ddd2781d08c09890f1"),
    "address" : 
        {"streetAddress" : "32504 Dare Trail Suite 490",
        "zip_code": 90422,
        "city": "Anaheim",
        "region":"Someregion"},
    "employee" : [{ "employeeId" : ObjectId("66b4ddd2781d08c09890f1"),
    "firstName": "Lolita",
    "lastName": "Bechtelar",
    "employeeDni" : "6783092840D"  ,
    "phoneNumber" :  987867656,
    "position": "delivery",}]
   }
)



   
    

 

    
   
