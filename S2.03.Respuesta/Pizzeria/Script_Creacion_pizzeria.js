use pizzeria

db.provincia.insertMany(
[
 	{"_id":"BCN", "nombre":"Barcelona"},
	{"_id":"GRN", "nombre":"Girona"}
]
)

db.localidad.insertMany(        
[
	{"_id": 1, 
	 "nombre": "Barcelona",
	 "provincia_id": "BCN"},
	{"_id": 2, 
	 "nombre": "Badalona",
	 "provincia_id": "BCN"},
	{"_id": 3, 
	 "nombre": "Sant Celoni",
	 "provincia_id": "BCN"},
	{"_id": 4, 
	 "nombre": "Lloret de Mar",
	 "provincia_id": "GRN"}
]
)

db.client.insertMany(        
[        

	{"_id": "cli1",
	"nombre": "Maria",
	"apellido": "Lopez",
	"direccion": "Calle Pablo III, 152",
	"CP": "08001",
	"telefono": "111121314",
	"localidad_id": 1},
	{"_id": "cli2",
	"nombre": "Pablo",
	"apellido": "Martinez",
	"direccion": "Calle Caceres, 215",
	"CP": "08003",
	"telefono": "222245145",
	"localidad_id": 2},
	{"_id": "cli3",
	"nombre": "Andres",
	"apellido": "Vilarrubias",
	"direccion": "Calle Pau Casals, 47",
	"CP": "08470",
	"telefono": "33321314",
	"localidad_id": 3},
	{"_id": "cli4",
	"nombre": "Silvia",
	"apellido": "Pascual",
	"direccion": "Avenida Republica, 6, 10, 1",
	"CP": "27100",
	"telefono": "444158894",
	"localidad_id": 4}
]
)

db.tipo_de_pedido.insertMany(        
[    
	{"_id": "T", "nombre":"Recogida tienda"},
	{"_id": "D", "nombre":"Entrega Domicilio"}
]
)

    
db.Posiciones.insertMany(        
[         
	{"_id": "C", "nombre":"Cocinero"},
	{"_id": "R", "nombre":"Repartidor"}
]
)

db.tienda.insertMany(        
[                 

	{"_id": "tienda1", "direccion": "Calle La font, 42", "CP":"08002", "localidad_id": 1},
	{"_id": "tienda2", "direccion": "Avenida Republica, 71", "CP":"08100", "localidad_id": 2}
]
)

db.Empleado.insertMany(        
[ 

	{"_id": 1, "nombre": "Cristina", "apellido": "Revilla", "NIF": "00000015E", "tienda_id": "tienda1", "posicion": "Cocinero"},
	{"_id": 2, "nombre": "Manel", "apellido": "Moliner", "NIF": "88888894T", "tienda_id": "tienda1", "posicion": "Repartidor"},
	{"_id": 3, "nombre": "Sigrid", "apellido": "Lopez", "NIF": "55555698F", "tienda_id": "tienda2", "posicion": "Cocinero"},
	{"_id": 4, "nombre": "Laura", "apellido": "Sanchez", "NIF": "66666578G", "tienda_id": "tienda2", "posicion": "Repartidor"}
]
)

db.pedidos.insertMany(        
[ 
	{"_id": "pedido1",
	"cliente": 	{"_id": "cli1",
			"nombre": "Maria",
			"apellido": "Lopez",
			"direccion": "Calle Pablo III, 152",
			"CP": "08001",
			"telefono": "111121314",
			"localidad_id": 1},
	"fecha_Hora": "2022-01-15 22:05:00",
 	"Cantidad_productos": 2,
	"Tipo_de_pedido_id": "T",
	"tienda_id": "tienda1"},
	{"_id": "pedido2",
	"cliente": 	{"_id": "cli2",
			"nombre": "Pablo",
			"apellido": "Martinez",
			"direccion": "Calle Caceres, 215",
			"CP": "08003",
			"telefono": "222245145",
			"localidad_id": 2},
	"fecha_Hora": "2022-01-15 22:15:00",
 	"Cantidad_productos": 3,
	"Tipo_de_pedido_id": "D",
	"Fecha_entrega": "2022-01-15 22:45:00",
	"tienda_id": "tienda2"},
	{"_id": "pedido3",
	"cliente": 	{"_id": "cli3",
			"nombre": "Andres",
			"apellido": "Vilarrubias",
			"direccion": "Calle Pau Casals, 47",
			"CP": "08470",
			"telefono": "33321314",
			"localidad_id": 3},	
	"fecha_Hora": "2022-01-16 21:15:00",
 	"Cantidad_productos": 4,
	"Tipo_de_pedido_id": "D",
	"Fecha_entrega": "2022-01-15 21:45:00",
	"tienda_id": "tienda1"}
]
)

db.Categoria.insertMany(        
[

	{"_id":"V", "nombre": "Vegetariano"},
	{"_id":"NV", "nombre": "No Vegetariano"}
]
)

db.Clase_producto.insertMany(        
[

	{"_id": "clas1", "nombre":"Hamburguesa"},
	{"_id": "clas2", "nombre":"Pizza"},
	{"_id": "clas3", "nombre":"Bebida"}
]
)            
       
db.productos.insertMany(        
[ 
	{"_id": "produc1", "nombre":"Hambuerguesa Completa", "descripcion":"Hambuegursa ternera, lechuga, queso, huevo", "precio":7.50, "categoria_id":"NV", "clase_producto": "Hamburguesa"},
	{"_id": "produc2", "nombre":"Pizza campestre", "descripcion":"Pizza, queso, tomate, calabacin, champinones, pimiento", "precio":6.50, "categoria_id":"V", "clase_producto": "Pizza"},
	{"_id": "produc3", "nombre":"Pizza jamon", "descripcion":"Pizza, queso, tomate, jamon", "precio":6.75, "categoria_id":"NV", "clase_producto": "Pizza"},
	{"_id": "produc4", "nombre":"Coca_cola", "descripcion":"Coca_cola Zero", "precio":2.50, "categoria_id":"V", "clase_producto": "Bebida"}
]
)
  
db.Lineas_pedido.insertMany(        
[       

	{"Cantidad_pedido": 3, "Importe_linea": 0.00, "pedido_id": "pedido1", "producto_id": "produc1"},
	{"Cantidad_pedido": 2, "Importe_linea": 0.00, "pedido_id": "pedido1", "producto_id": "produc4"},
	{"Cantidad_pedido": 2, "Importe_linea": 0.00, "pedido_id": "pedido2", "producto_id": "produc2"},
	{"Cantidad_pedido": 1, "Importe_linea": 0.00, "pedido_id": "pedido2", "producto_id": "produc3"},
	{"Cantidad_pedido": 2, "Importe_linea": 0.00, "pedido_id": "pedido3", "producto_id": "produc1"},
	{"Cantidad_pedido": 3, "Importe_linea": 0.00, "pedido_id": "pedido3", "producto_id": "produc2"},
	{"Cantidad_pedido": 5, "Importe_linea": 0.00, "pedido_id": "pedido3", "producto_id": "produc4"}
]
)

        