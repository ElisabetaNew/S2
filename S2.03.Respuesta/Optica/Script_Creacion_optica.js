use optica_cul_ampolla
db.direccion.insertMany(
[
	{"calle":"Rosello", "numero":15, "piso":2, "puerta":2, "ciudad":"Barbera", "CP":"08100", "pais":"España"},
	{"calle":"Caceres", "numero":215, "piso":6, "puerta":3, "ciudad":"Barcelona", "CP":"08003", "pais":"España"},
        {"calle":"Pau Casals", "numero":47, "piso":3, "puerta":2, "ciudad":"Sant Celoni", "CP":"08470", "pais":"España"},
       	{"calle":"Republica", "numero":6, "piso":10, "puerta":1, "ciudad":"Lloret", "CP":"27100", "pais":"España"}
]
)

db.cliente.insertMany([
	{
	"_id":"Cli1",
	"Nombre":"Maria", 
	"Telefono":"111121314",
	"email":"maria@gmail.com",
	"fecha_alta":"2022-01-12",
	"Direccion": {
		"calle":"Pau Casals",
		"numero":47,
		"piso":3,
	 	"puerta":2,
		"ciudad":"Sant Celoni",
		"CP":"08470",
		"pais":"España"}
	},
	{
	"_id":"Cli2",
	"Nombre":"Pablo",
	"Telefono":"222121314",
	"email":"pablo@gmail.com",
	"fecha_alta":"2022-01-10",
	"recomendado_por":"Cli1",
	"Direccion": {
		"calle":"Caceres",
		"numero":215,
		"piso":6,
		"puerta":3,
		"ciudad":"Barcelona",
		"CP":"08003",
		"pais":"España"}
	},
	{
	"_id":"Cli3",
	"Nombre":"Andres",
	"Telefoano":"33321314",
	"email":"andre@gmail.com",
	"fecha_alta":"2022-02-01",
	"Direccion": {
		"calle":"Republica",
		"numero":6,
		"piso":10,
		"puerta":1,
		"ciudad":"Lloret",
		"CP":"27100",
		"pais":"España"}
	}
]
)
        
db.empleado.insertMany(
[
 	{"nombre":"Cristina"},
	{"nombre":"Manel"},
        {"nombre":"Sigrid"}
]
)    
         
db.proveedor.insertMany([
	{
	"_id": "Prov1",
	"nombre":"Proveedor_1",
	"telefono":"444556677",
	"fax":"444556678",
	"NIF":"B00000000",
	"Direccion":  {
		"calle":"Rosello",
		"numero":15,
		"piso":2,
		"puerta":2,
		"ciudad":"Barbera",
		"CP":"08100",
		"pais":"España"},
	},
	{
	"_id": "Prov2",
	"nombre":"Proveedor_2",
	"telefono":"999203040",
	"fax":"999203041",
	"NIF":"A99999999",
	"Direccion": {
		"calle":"Pau Casals",
		"numero":47,
		"piso":3,
		"puerta":2,
		"ciudad":"Sant Celoni",
		"CP":"08470",
		"pais":"España"},
	}	
]
)
        
db.tipo_montura.insertMany(
[
	{"nombre":"Vidre"},
	{"nombre":"Pasta"},
    {"nombre":"Metalica"}
]
)    

db.gafas.insertMany([
	{
	"_id":"Gafas1",
	"proveedor": "Prov1",
	"graduacion_IZ": 0.75,
	"tipo_montura": {
		"nombre": "Vidre"},
	"graduacion_DCH": 0.50,
	"color_montura": "Azul",
	"color_vidrio_IZ": "Oscuro",
	"color_vidrio_DCH": "Oscuro",
	"precio": 500,
	"Marca":"Ray-Ban"
	},
	{
	"_id":"Gafas2",
	"proveedor_id": "Prov2",
	"graduacion_IZ": 1.25,
	"tipo_montura": {
		"nombre": "Pasta"},
	"graduacion_DCH": 0.85,
	"color_montura": "Roja",
	"color_vidrio_IZ": "Azul",
	"color_vidrio_DCH": "Azul",
	"precio": 700,
	"Marca":"TOUS"
	},
	{
	"_id":"Gafas3",
	"proveedor_id": "Prov2",
	"graduacion_IZ": 0.15,
	"tipo_montura": {
		"nombre": "Metalica"},
	"graduacion_DCH": 0.45,
	"color_montura": "Blanco",
	"color_vidrio_IZ": "Neutro",
	"color_vidrio_DCH": "Neutro",
	"precio": 350,
	"Marca":"TOUS"
	},
	{
	"_id":"Gafas4",
	"proveedor_id": "Prov1",
	"graduacion_IZ": 0.25,
	"tipo_montura": {
		"nombre": "Vidre"},
	"graduacion_DCH": 0.70,
	"color_montura": "Plateado",
	"color_vidrio_IZ": "Amarillo",
	"color_vidrio_DCH": "Amarillo",
	"precio": 400,
	"Marca":"Ray-Ban"
	}
]
)

db.venta.insertMany([
	{
	"empleado": {
		"nombre":"Sigrid"},
	"gafas_id": "Gafas1",
	"fecha": "2022-01-15",
	"cliente_id": "Cli2"
	},
	{
	"empleado": {
		"nombre":"Manel"},
	"gafas_id": "Gafas2",
	"fecha": "2022-02-15",
	"cliente_id": "Cli1"
	},	
	{
	"empleado": {
		"nombre":"Cristina"},
	"gafas_id": "Gafas3",
	"fecha": "2022-02-20",
	"cliente_id": "Cli3"
	},
	{
	"empleado": {
		"nombre":"Cristina"},
	"gafas_id": "Gafas4",
	"fecha": "2022-03-20",
	"cliente_id": "Cli2"
	}
]
)   
        
