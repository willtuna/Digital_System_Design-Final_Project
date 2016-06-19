onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_keyin_counter/col_in
add wave -noupdate /test_keyin_counter/key_interface/row_out
add wave -noupdate /test_keyin_counter/rst
add wave -noupdate /test_keyin_counter/off_key_cnt
add wave -noupdate /test_keyin_counter/start
add wave -noupdate /test_keyin_counter/set
add wave -noupdate /test_keyin_counter/pressed
add wave -noupdate /test_keyin_counter/mode
add wave -noupdate /test_keyin_counter/enc_out
add wave -noupdate /test_keyin_counter/display_state
add wave -noupdate /test_keyin_counter/keyin_state
add wave -noupdate /test_keyin_counter/value_out
add wave -noupdate /test_keyin_counter/keyin_cnt/keyin
add wave -noupdate /test_keyin_counter/disp/end_transmission
add wave -noupdate -radix ascii /test_keyin_counter/disp/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26468750 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
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
WaveRestoreZoom {0 ps} {1155 us}
