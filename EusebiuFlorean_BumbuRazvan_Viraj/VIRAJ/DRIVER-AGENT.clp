
;init all states as unchecked
(defrule AGENT::init_cycle
  (declare (salience 99))
  (timp (valoare ?)) 
  =>
  (assert (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no)))
)


;if { dreapta && rosu && [not (sageata) || (pieton && sageata) || (masina && sageata)] } => PROHIBITED
(defrule AGENT:take_decision_scenario1_evt1-4
  (declare (salience 20))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval right))
  ?semaphore <- (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval red))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (not (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green)))
    (and 
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (ag_bel (bel_pobj right_pedestrian))
    )
    (and 
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (ag_bel (bel_pobj another_car))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra nepermisa (semafor rosu sau masina pe drum prioritar sau pieton) " crlf))
  (retract ?unchecked)
)


;if { dreapta && [ (rosu && sageata && not(pieton) && not(masina)) || verde ] } => ALLOWED
(defrule AGENT:take_decision_scenario1_evt5-9
  (declare (salience 10))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval right))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval green))
    (and 
      (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval red))
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (not (ag_bel (bel_pobj right_pedestrian)))
      (not (ag_bel (bel_pobj another_car)))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval allowed)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra permisa " crlf))
  (retract ?unchecked)
)


;if { stanga && rosu && [not (sageata) || (pieton && sageata) || (sageata && masina && (directie dreapta || directie inainte))] } => PROHIBITED
(defrule AGENT:take_decision_scenario1_evt10-16
  (declare (salience 20))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?semaphore <- (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval red))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (not (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green)))
    (and 
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (ag_bel (bel_pobj ahead_pedestrian))
    )
    (and 
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (
        or
        (ag_bel (bel_pobj another_car) (bel_pname direction) (bel_pval right))
        (ag_bel (bel_pobj another_car) (bel_pname direction) (bel_pval ahead))
      )
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra nepermisa (semafor rosu sau masina pe drum prioritar sau pieton) " crlf))
  (retract ?unchecked)
)


;if { stanga && [ (rosu && sageata && not(pieton) && masina && directie stanga) || ((rosu && sageata && not(pieton) && not(masina))] } => ALLOWED
(defrule AGENT:take_decision_scenario1_evt17-18
  (declare (salience 10))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (and
      (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval red))
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (not (ag_bel (bel_pobj ahead_pedestrian)))
      (ag_bel (bel_pobj another_car) (bel_pname direction) (bel_pval left))
    )
    (and 
      (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval red))
      (ag_bel (bel_pobj my_arrow) (bel_pname color) (bel_pval green))
      (not (ag_bel (bel_pobj ahead_pedestrian)))
      (not (ag_bel (bel_pobj another_car)))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra permisa " crlf))
  (retract ?unchecked)
)


;if { stanga && verde && [(pieton && cedeaza) || (cedeaza && masina && (directie dreapta || directie inainte))] } => PROHIBITED
(defrule AGENT:take_decision_scenario1_evt19-24
  (declare (salience 20))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?semaphore <- (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval green))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (and 
      (ag_bel (bel_pobj additional_give_way))
      (ag_bel (bel_pobj ahead_pedestrian))
    )
    (and 
      (ag_bel (bel_pobj additional_give_way))
      (
        or
        (ag_bel (bel_pobj another_car) (bel_pname direction) (bel_pval right))
        (ag_bel (bel_pobj another_car) (bel_pname direction) (bel_pval ahead))
      )
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra nepermisa (semafor rosu sau masina pe drum prioritar sau pieton) " crlf))
  (retract ?unchecked)
)


;if { stanga && [ (verde && cedeaza && not(pieton) && masina && directie stanga) || ((verde && cedeaza && not(pieton) && not(masina)) || 
;(verde && not(cedeaza) && not(pieton) && not(masina))] } => ALLOWED
(defrule AGENT:take_decision_scenario1_evt25-27
  (declare (salience 10))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (and
      (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval green))
      (ag_bel (bel_pobj additional_give_way))
      (not (ag_bel (bel_pobj ahead_pedestrian)))
      (ag_bel (bel_pobj another_car) (bel_pname direction) (bel_pval left))
    )
    (and
      (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval green))
      (ag_bel (bel_pobj additional_give_way))
      (not (ag_bel (bel_pobj ahead_pedestrian)))
      (not (ag_bel (bel_pobj another_car)))
    )
    (and 
      (ag_bel (bel_pobj my_semaphore) (bel_pname color) (bel_pval green))
      (not (ag_bel (bel_pobj additional_give_way)))
      (not (ag_bel (bel_pobj ahead_pedestrian)))
      (not (ag_bel (bel_pobj another_car)))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra permisa " crlf))
  (retract ?unchecked)
)


;if { stanga && trecere && [(pieton && sub 4 m) || masina] } => PROHIBITED
(defrule AGENT:take_decision_scenario2_evt1-5
  (declare (salience 20))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?crosswalk <- (ag_bel (bel_pobj left_crosswalk))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (and 
      (ag_bel (bel_pobj left_crosswalk) (bel_pname distance_from_intersection) (bel_pval less_than_four))
      (ag_bel (bel_pobj left_pedestrian))
    )
    (and 
      (ag_bel (bel_pobj another_car))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra nepermisa (pieton si distanta mai mica de 4m intre trecere si intersectie sau masina pe drum prioritar) " crlf))
  (retract ?unchecked)
)


;if { stanga && trecere && [(not(pieton) && not(masina)) || (pieton && not(masina) && peste 4 m )] } => ALLOWED
(defrule AGENT:take_decision_scenario2_evt6-8
  (declare (salience 10))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?crosswalk <- (ag_bel (bel_pobj left_crosswalk))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (and
      (not (ag_bel (bel_pobj left_pedestrian)))
      (not (ag_bel (bel_pobj another_car)))
    )
    (and
      (ag_bel (bel_pobj left_pedestrian))
      (not (ag_bel (bel_pobj another_car)))
      (ag_bel (bel_pobj left_crosswalk) (bel_pname distance_from_intersection) (bel_pval more_than_four))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra permisa " crlf))
  (retract ?unchecked)
)


;if [ stanga && (obligatoriu inainte || obligatoriu dreapta || interzis stanga || inainte/dreapta)]  => PROHIBITED
(defrule AGENT:take_decision_scenario3_evt1-4
  (declare (salience 20))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (ag_bel (bel_pobj mandatory_ahead_sign))
    (ag_bel (bel_pobj mandatory_right_sign))
    (ag_bel (bel_pobj no_left_turn_sign))
    (ag_bel (bel_pobj mandatory_ahead_or_right_sign))
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra nepermisa (indicatorul nu permite manevra) " crlf))
  (retract ?unchecked)
)


;if { stanga || [ stanga && (obligatoriu stanga || obligatoriu inainte/stanga || obligatoriu stanga/dreapta)]}  => ALLOWED
(defrule AGENT:take_decision_scenario3_evt5-8
  (declare (salience 10))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
    (and
      (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
      (ag_bel (bel_pobj mandatory_left_sign))
    )
    (and
      (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
      (ag_bel (bel_pobj mandatory_ahead_or_left_sign))
    )
    (and
      (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval left))
      (ag_bel (bel_pobj mandatory_left_or_right_sign))
    )
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra permisa " crlf))
  (retract ?unchecked)
)


;if (dreapta && 0 && not(bariera))  => PROHIBITED
(defrule AGENT:take_decision_scenario4_evt1-2
  (declare (salience 20))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval right))
  ?available_spaces <- (ag_bel (bel_pobj parking_screen) (bel_pname available_parking_spaces) (bel_pval zero))
  (not (ag_bel (bel_pobj first_obstacle) (bel_pname type) (bel_pval barrier)))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  =>
  (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra nepermisa (nu exista locuri disponibile) " crlf))
  (retract ?unchecked)
)


;if [ dreapta && (>0 || bariera)]  => ALLOWED
(defrule AGENT:take_decision_scenario4_evt3-5
  (declare (salience 10))
  ?car <- (ag_bel (bel_pobj my_car) (bel_pname direction) (bel_pval right))
  ?unchecked <- (ag_bel (bel_type moment) (bel_pname was_checked) (bel_pval no))
  (
    or
    (ag_bel (bel_pobj parking_screen) (bel_pname available_parking_spaces) (bel_pval greater_than_zero))
    (ag_bel (bel_pobj first_obstacle) (bel_pname type) (bel_pval barrier))
  )
  =>
  (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
  (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D> Manevra permisa " crlf))
  (retract ?unchecked)
)
