onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_core_fsm/rst
add wave -noupdate -radix binary /test_core_fsm/row_out
add wave -noupdate -radix binary /test_core_fsm/col_in
add wave -noupdate -radix unsigned /test_core_fsm/core_op
add wave -noupdate -radix unsigned /test_core_fsm/core_mode
add wave -noupdate -radix hexadecimal /test_core_fsm/core_value_out
add wave -noupdate -radix unsigned /test_core_fsm/display_state
add wave -noupdate -radix unsigned /test_core_fsm/enc_out
add wave -noupdate -radix unsigned /test_core_fsm/key_in_mode
add wave -noupdate /test_core_fsm/key_in_value_out
add wave -noupdate -radix unsigned /test_core_fsm/keyin_state
add wave -noupdate /test_core_fsm/pressed
add wave -noupdate /test_core_fsm/set
add wave -noupdate /test_core_fsm/start
add wave -noupdate -radix unsigned /test_core_fsm/core/c_state
add wave -noupdate -radix unsigned /test_core_fsm/core/n_state
add wave -noupdate /test_core_fsm/core/again
add wave -noupdate /test_core_fsm/core/solution
add wave -noupdate /test_core_fsm/core/guess_value
add wave -noupdate -radix unsigned /test_core_fsm/core/num_A
add wave -noupdate -radix unsigned /test_core_fsm/core/num_B
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {232 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 217
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
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {799 ps}
