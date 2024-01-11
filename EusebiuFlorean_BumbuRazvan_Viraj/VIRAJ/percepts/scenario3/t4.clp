;define scenario and event
(ag_percept (percept_pobj scenario3) (percept_pname isa) (percept_pval scenario))
(ag_percept (percept_pobj event4) (percept_pname isa) (percept_pval event))

;define roads
(ag_percept (percept_pobj current_road) (percept_pname isa) (percept_pval road))  ; vertically road
(ag_percept (percept_pobj another_road) (percept_pname isa) (percept_pval road))  ; horizontally road

;define cars
(ag_percept (percept_pobj my_car) (percept_pname isa) (percept_pval car))

;define sign
(ag_percept (percept_pobj mandatory_ahead_or_right_sign) (percept_pname isa) (percept_pval sign))

;define components
(ag_percept (percept_pobj current_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj another_road) (percept_pname partof) (percept_pval scenario1))
(ag_percept (percept_pobj my_car) (percept_pname partof) (percept_pval current_road))
(ag_percept (percept_pobj mandatory_ahead_or_right_sign) (percept_pname partof) (percept_pval current_road))

;define caracteristics
(ag_percept (percept_pobj my_car) (percept_pname direction) (percept_pval left))

