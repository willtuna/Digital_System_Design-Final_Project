onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Test_keypad/enc_out
add wave -noupdate /Test_keypad/pressed
add wave -noupdate -radix binary /Test_keypad/row_select
add wave -noupdate -radix binary -childformat {{{/Test_keypad/in[3]} -radix binary} {{/Test_keypad/in[2]} -radix binary} {{/Test_keypad/in[1]} -radix binary} {{/Test_keypad/in[0]} -radix binary}} -subitemconfig {{/Test_keypad/in[3]} {-height 15 -radix binary} {/Test_keypad/in[2]} {-height 15 -radix binary} {/Test_keypad/in[1]} {-height 15 -radix binary} {/Test_keypad/in[0]} {-height 15 -radix binary}} /Test_keypad/in
add wave -noupdate /Test_keypad/rst
add wave -noupdate -radix binary /Test_keypad/keypad/keypad_sweep/db_cnt/in
add wave -noupdate -radix binary /Test_keypad/keypad/keypad_sweep/db_cnt/press_col
add wave -noupdate -radix decimal /Test_keypad/keypad/keypad_sweep/db_cnt/count
add wave -noupdate -radix binary /Test_keypad/keypad/keypad_sweep/press_pos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300005900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
configure wave -valuecolwidth 69
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
WaveRestoreZoom {300005896 ps} {300005904 ps}
