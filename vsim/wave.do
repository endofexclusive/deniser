onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/clk7
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/cck
add wave -noupdate -expand -group dut -radix hexadecimal -radixshowbase 0 /tb/dut/rga
add wave -noupdate -expand -group dut -radix hexadecimal -childformat {{/tb/dut/drd(15) -radix hexadecimal} {/tb/dut/drd(14) -radix hexadecimal} {/tb/dut/drd(13) -radix hexadecimal} {/tb/dut/drd(12) -radix hexadecimal} {/tb/dut/drd(11) -radix hexadecimal} {/tb/dut/drd(10) -radix hexadecimal} {/tb/dut/drd(9) -radix hexadecimal} {/tb/dut/drd(8) -radix hexadecimal} {/tb/dut/drd(7) -radix hexadecimal} {/tb/dut/drd(6) -radix hexadecimal} {/tb/dut/drd(5) -radix hexadecimal} {/tb/dut/drd(4) -radix hexadecimal} {/tb/dut/drd(3) -radix hexadecimal} {/tb/dut/drd(2) -radix hexadecimal} {/tb/dut/drd(1) -radix hexadecimal} {/tb/dut/drd(0) -radix hexadecimal}} -subitemconfig {/tb/dut/drd(15) {-height 17 -radix hexadecimal} /tb/dut/drd(14) {-height 17 -radix hexadecimal} /tb/dut/drd(13) {-height 17 -radix hexadecimal} /tb/dut/drd(12) {-height 17 -radix hexadecimal} /tb/dut/drd(11) {-height 17 -radix hexadecimal} /tb/dut/drd(10) {-height 17 -radix hexadecimal} /tb/dut/drd(9) {-height 17 -radix hexadecimal} /tb/dut/drd(8) {-height 17 -radix hexadecimal} /tb/dut/drd(7) {-height 17 -radix hexadecimal} /tb/dut/drd(6) {-height 17 -radix hexadecimal} /tb/dut/drd(5) {-height 17 -radix hexadecimal} /tb/dut/drd(4) {-height 17 -radix hexadecimal} /tb/dut/drd(3) {-height 17 -radix hexadecimal} /tb/dut/drd(2) {-height 17 -radix hexadecimal} /tb/dut/drd(1) {-height 17 -radix hexadecimal} /tb/dut/drd(0) {-height 17 -radix hexadecimal}} /tb/dut/drd
add wave -noupdate -expand -group dut -format Analog-Step -height 64 -max 15.0 -radix hexadecimal -childformat {{/tb/dut/video_r(3) -radix hexadecimal} {/tb/dut/video_r(2) -radix hexadecimal} {/tb/dut/video_r(1) -radix hexadecimal} {/tb/dut/video_r(0) -radix hexadecimal}} -subitemconfig {/tb/dut/video_r(3) {-height 17 -radix hexadecimal} /tb/dut/video_r(2) {-height 17 -radix hexadecimal} /tb/dut/video_r(1) {-height 17 -radix hexadecimal} /tb/dut/video_r(0) {-height 17 -radix hexadecimal}} /tb/dut/video_r
add wave -noupdate -expand -group dut -format Analog-Step -height 64 -max 15.0 -radix hexadecimal -childformat {{/tb/dut/video_b(3) -radix hexadecimal} {/tb/dut/video_b(2) -radix hexadecimal} {/tb/dut/video_b(1) -radix hexadecimal} {/tb/dut/video_b(0) -radix hexadecimal}} -subitemconfig {/tb/dut/video_b(3) {-height 17 -radix hexadecimal} /tb/dut/video_b(2) {-height 17 -radix hexadecimal} /tb/dut/video_b(1) {-height 17 -radix hexadecimal} /tb/dut/video_b(0) {-height 17 -radix hexadecimal}} /tb/dut/video_b
add wave -noupdate -expand -group dut -format Analog-Step -height 64 -max 15.0 -radix hexadecimal /tb/dut/video_g
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/m0v
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/m0h
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/m1v
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/m1h
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/nburst
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/nzd
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/ncsync
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/ncdac
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/drd_noe
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/drd_rl_to_fpga
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/user0
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/user1
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/led0
add wave -noupdate -expand -group dut -radix hexadecimal -childformat {{/tb/dut/deni.clk7 -radix hexadecimal} {/tb/dut/deni.cck -radix hexadecimal} {/tb/dut/deni.rga -radix hexadecimal} {/tb/dut/deni.drd -radix hexadecimal} {/tb/dut/deni.m0v -radix hexadecimal} {/tb/dut/deni.m0h -radix hexadecimal} {/tb/dut/deni.m1v -radix hexadecimal} {/tb/dut/deni.m1h -radix hexadecimal} {/tb/dut/deni.ncsync -radix hexadecimal} {/tb/dut/deni.ncdac -radix hexadecimal}} -subitemconfig {/tb/dut/deni.clk7 {-radix hexadecimal} /tb/dut/deni.cck {-radix hexadecimal} /tb/dut/deni.rga {-radix hexadecimal} /tb/dut/deni.drd {-radix hexadecimal} /tb/dut/deni.m0v {-radix hexadecimal} /tb/dut/deni.m0h {-radix hexadecimal} /tb/dut/deni.m1v {-radix hexadecimal} /tb/dut/deni.m1h {-radix hexadecimal} /tb/dut/deni.ncsync {-radix hexadecimal} /tb/dut/deni.ncdac {-radix hexadecimal}} /tb/dut/deni
add wave -noupdate -expand -group dut -radix hexadecimal /tb/dut/deno
add wave -noupdate -expand -group dut -radix hexadecimal -childformat {{/tb/dut/den0/r.a -radix hexadecimal -childformat {{/tb/dut/den0/r.a.sel -radix hexadecimal} {/tb/dut/den0/r.a.cck -radix hexadecimal} {/tb/dut/den0/r.a.rga -radix hexadecimal}}} {/tb/dut/den0/r.b -radix hexadecimal} {/tb/dut/den0/r.c -radix hexadecimal} {/tb/dut/den0/r.d -radix hexadecimal} {/tb/dut/den0/r.e -radix hexadecimal} {/tb/dut/den0/r.f -radix hexadecimal} {/tb/dut/den0/r.g -radix hexadecimal} {/tb/dut/den0/r.h -radix hexadecimal} {/tb/dut/den0/r.nburst -radix hexadecimal} {/tb/dut/den0/r.drd -radix hexadecimal} {/tb/dut/den0/r.drd_oe -radix hexadecimal} {/tb/dut/den0/r.drd_ext_noe -radix hexadecimal} {/tb/dut/den0/r.drd_ext_to_denice -radix hexadecimal}} -expand -subitemconfig {/tb/dut/den0/r.a {-radix hexadecimal -childformat {{/tb/dut/den0/r.a.sel -radix hexadecimal} {/tb/dut/den0/r.a.cck -radix hexadecimal} {/tb/dut/den0/r.a.rga -radix hexadecimal}} -expand} /tb/dut/den0/r.a.sel {-radix hexadecimal} /tb/dut/den0/r.a.cck {-radix hexadecimal} /tb/dut/den0/r.a.rga {-radix hexadecimal} /tb/dut/den0/r.b {-radix hexadecimal} /tb/dut/den0/r.c {-radix hexadecimal} /tb/dut/den0/r.d {-radix hexadecimal} /tb/dut/den0/r.e {-radix hexadecimal} /tb/dut/den0/r.f {-radix hexadecimal} /tb/dut/den0/r.g {-radix hexadecimal} /tb/dut/den0/r.h {-radix hexadecimal} /tb/dut/den0/r.nburst {-radix hexadecimal} /tb/dut/den0/r.drd {-radix hexadecimal} /tb/dut/den0/r.drd_oe {-radix hexadecimal} /tb/dut/den0/r.drd_ext_noe {-radix hexadecimal} /tb/dut/den0/r.drd_ext_to_denice {-radix hexadecimal}} /tb/dut/den0/r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20814006 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {14707572 ps} {27572428 ps}
