{
  "$GMObject":"",
  "%Name":"obj_player",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":1,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":12,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_player",
  "overriddenProperties":[],
  "parent":{
    "name":"PlayerRelated",
    "path":"folders/Objects/PlayerRelated.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"dash_cooldown","filters":[],"listItems":[],"multiselect":false,"name":"dash_cooldown","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"90","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"dash_speed","filters":[],"listItems":[],"multiselect":false,"name":"dash_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"10","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"dash_time","filters":[],"listItems":[],"multiselect":false,"name":"dash_time","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"15","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"move_speed","filters":[],"listItems":[],"multiselect":false,"name":"move_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"z_offset","filters":[],"listItems":[],"multiselect":false,"name":"z_offset","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_playerIdleTemp",
    "path":"sprites/spr_playerIdleTemp/spr_playerIdleTemp.yy",
  },
  "spriteMaskId":{
    "name":"spr_playerIdleTemp",
    "path":"sprites/spr_playerIdleTemp/spr_playerIdleTemp.yy",
  },
  "visible":true,
}