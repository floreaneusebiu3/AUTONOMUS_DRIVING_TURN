;define scenario and event
(ag_percept (percept_pobj scenario1) (percept_pname isa) (percept_pval scenario))
(ag_percept (percept_pobj event26) (percept_pname isa) (percept_pval event))

;define roads
(ag_percept (percept_pobj current_road) (percept_pname isa) (percept_pval road))  ; vertically road
(ag_percept (percept_pobj another_road) (percept_pname isa) (percept_pval road))  ; horizontally road

;define semaphores
(ag_percept (percept_pobj my_semaphore) (percept_pname isa) (percept_pval semaphore))

;define cars
(ag_percept (percept_pobj my_car) (percept_pname isa) (percept_pval car))

;define lanes
(ag_percept (percept_pobj current_lane) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj opposite_lane) (percept_pname isa) (percept_pval lane))

;define signs
(ag_percept (percept_pobj additional_give_way) (percept_pname isa) (percept_pval sign))

;define components
(ag_percept (percept_pobj current_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj another_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj my_car) (percept_pname partof) (percept_pval current_lane))
(ag_percept (percept_pobj current_lane) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj opposite_lane) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj my_semaphore) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj additional_give_way) (percept_pname partof) (percept_pval my_semaphore))

;define caracteristics
(ag_percept (percept_pobj my_semaphore) (percept_pname color) (percept_pval green))
(ag_percept (percept_pobj my_car) (percept_pname direction) (percept_pval left))


