;define scenario and event
(ag_percept (percept_pobj scenario2) (percept_pname isa) (percept_pval scenario))
(ag_percept (percept_pobj event6) (percept_pname isa) (percept_pval event))

;define roads
(ag_percept (percept_pobj current_road) (percept_pname isa) (percept_pval road))  ; vertically road
(ag_percept (percept_pobj another_road) (percept_pname isa) (percept_pval road))  ; horizontally road

;define cars
(ag_percept (percept_pobj my_car) (percept_pname isa) (percept_pval car))

;define pedestrians
(ag_percept (percept_pobj left_pedestrian) (percept_pname isa) (percept_pval pedestrian))

;define crosswalks
(ag_percept (percept_pobj left_crosswalk) (percept_pname isa) (percept_pval crosswalk))

;define components
(ag_percept (percept_pobj current_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj another_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj left_crosswalk) (percept_pname partof) (percept_pval another_road))
(ag_percept (percept_pobj my_car) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj left_pedestrian) (percept_pname partof) (percept_pval left_crosswalk))

;define caracteristics
(ag_percept (percept_pobj my_car) (percept_pname direction) (percept_pval left))
(ag_percept (percept_pobj left_crosswalk) (percept_pname distance_from_intersection) (percept_pval more_than_four))


