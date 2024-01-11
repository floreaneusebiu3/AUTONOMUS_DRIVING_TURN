;define scenario and event
(ag_percept (percept_pobj scenario1) (percept_pname isa) (percept_pval scenario))
(ag_percept (percept_pobj event11) (percept_pname isa) (percept_pval event))

;define roads
(ag_percept (percept_pobj current_road) (percept_pname isa) (percept_pval road))  ; vertically road
(ag_percept (percept_pobj another_road) (percept_pname isa) (percept_pval road))  ; horizontally road

;define semaphores
(ag_percept (percept_pobj my_semaphore) (percept_pname isa) (percept_pval semaphore))

;define cars
(ag_percept (percept_pobj my_car) (percept_pname isa) (percept_pval car))
(ag_percept (percept_pobj another_car) (percept_pname isa) (percept_pval car))

;define lanes
(ag_percept (percept_pobj current_lane) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj opposite_lane) (percept_pname isa) (percept_pval lane))

;define arrows
(ag_percept (percept_pobj my_arrow) (percept_pname isa) (percept_pval arrow))

;define pedestrians
(ag_percept (percept_pobj ahead_pedestrian) (percept_pname isa) (percept_pval pedestrian))

;define components
(ag_percept (percept_pobj current_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj another_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj my_car) (percept_pname partof) (percept_pval current_lane))
(ag_percept (percept_pobj another_car) (percept_pname partof) (percept_pval opposite_lane))
(ag_percept (percept_pobj current_lane) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj opposite_lane) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj my_semaphore) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj my_arrow) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj ahead_pedestrian) (percept_pname partof) (percept_pval another_road))

;define caracteristics
(ag_percept (percept_pobj my_semaphore) (percept_pname color) (percept_pval red))
(ag_percept (percept_pobj my_car) (percept_pname direction) (percept_pval left))
(ag_percept (percept_pobj another_car) (percept_pname direction) (percept_pval right))
(ag_percept (percept_pobj my_arrow) (percept_pname direction) (percept_pval left))
(ag_percept (percept_pobj my_arrow) (percept_pname color) (percept_pval green))


