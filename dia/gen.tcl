set SYN synplify

if {true} {
  set DEVICE LCMXO3D-4300HC-5SG72C
} else {
  set DEVICE LCMXO3D-9400HC-5SG72C
}

prj_project new -name "projname" -impl "impl0" -lpf the.lpf -dev $DEVICE -synthesis $SYN

prj_impl option top impl.top
prj_impl option {HDL type} VHDL

prj_src add "syn/impl0/top.edn"

# map
prj_strgy set_value -strategy Strategy1 map_rpt_signal_cross_ref=False
prj_strgy set_value -strategy Strategy1 map_rpt_symbol_cross_ref=False
prj_strgy set_value -strategy Strategy1 maptrce_full_name=True

# par
prj_strgy set_value -strategy Strategy1 partrce_check_unconstrained_connections=True
prj_strgy set_value -strategy Strategy1 partrce_check_unconstrained_paths=True
prj_strgy set_value -strategy Strategy1 partrce_full_name=True
prj_strgy set_value -strategy Strategy1 {partrce_rpt_style=Error Timing Report}
# prj_strgy set_value -strategy Strategy1 iotiming_all_speed=True

prj_project save
prj_project close

