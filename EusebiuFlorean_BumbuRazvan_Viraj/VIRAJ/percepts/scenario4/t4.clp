;define scenario and event
(ag_percept (percept_pobj scenario4) (percept_pname isa) (percept_pval scenario))
(ag_percept (percept_pobj event4) (percept_pname isa) (percept_pval event))

;define roads
(ag_percept (percept_pobj current_road) (percept_pname isa) (percept_pval road))  ; vertically road 
(ag_percept (percept_pobj road_to_parking) (percept_pname isa) (percept_pval road))

;define cars
(ag_percept (percept_pobj my_car) (percept_pname isa) (percept_pval car))

;define lanes
(ag_percept (percept_pobj my_lane) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj opposite_lane) (percept_pname isa) (percept_pval lane))

;define parkings
(ag_percept (percept_pobj my_parking) (percept_pname isa) (percept_pval parking))

;define info_screens
(ag_percept (percept_pobj parking_screen) (percept_pname isa) (percept_pval info_screen)) 

;define obstacles
(ag_percept (percept_pobj first_obstacle) (percept_pname isa) (percept_pval obstacle)) 

;define components
(ag_percept (percept_pobj current_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj road_to_parking) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj my_lane) (percept_pname partof) (percept_pval road_to_parking))
(ag_percept (percept_pobj opposite_lane) (percept_pname partof) (percept_pval road_to_parking))
(ag_percept (percept_pobj my_car) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj my_parking) (percept_pname partof) (percept_pval road_to_parking))
(ag_percept (percept_pobj parking_screen) (percept_pname partof) (percept_pval road_to_parking))
(ag_percept (percept_pobj first_obstacle) (percept_pname partof) (percept_pval my_lane))

;define caracteristics
(ag_percept (percept_pobj my_car) (percept_pname direction) (percept_pval right))
(ag_percept (percept_pobj parking_screen) (percept_pname available_parking_spaces) (percept_pval greater_than_zero))
(ag_percept (percept_pobj first_obstacle) (percept_pname distance_from_my_car_to) (percept_pval less_than_four))

