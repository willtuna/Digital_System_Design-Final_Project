onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_display/in
add wave -noupdate /test_display/set
add wave -noupdate /test_display/start
add wave -noupdate -radix unsigned /test_display/mode
add wave -noupdate -radix binary /test_display/state
add wave -noupdate -group top -radix binary /test_display/mosi
add wave -noupdate -group top -radix binary /test_display/rst
add wave -noupdate -group top -radix binary /test_display/sclk
add wave -noupdate -group top -radix binary /test_display/set
add wave -noupdate -group top -radix binary /test_display/ss
add wave -noupdate -group top -radix binary /test_display/start
add wave -noupdate -radix ascii -childformat {{{/test_display/dis/data_out[151]} -radix ascii} {{/test_display/dis/data_out[150]} -radix ascii} {{/test_display/dis/data_out[149]} -radix ascii} {{/test_display/dis/data_out[148]} -radix ascii} {{/test_display/dis/data_out[147]} -radix ascii} {{/test_display/dis/data_out[146]} -radix ascii} {{/test_display/dis/data_out[145]} -radix ascii} {{/test_display/dis/data_out[144]} -radix ascii} {{/test_display/dis/data_out[143]} -radix ascii} {{/test_display/dis/data_out[142]} -radix ascii} {{/test_display/dis/data_out[141]} -radix ascii} {{/test_display/dis/data_out[140]} -radix ascii} {{/test_display/dis/data_out[139]} -radix ascii} {{/test_display/dis/data_out[138]} -radix ascii} {{/test_display/dis/data_out[137]} -radix ascii} {{/test_display/dis/data_out[136]} -radix ascii} {{/test_display/dis/data_out[135]} -radix ascii} {{/test_display/dis/data_out[134]} -radix ascii} {{/test_display/dis/data_out[133]} -radix ascii} {{/test_display/dis/data_out[132]} -radix ascii} {{/test_display/dis/data_out[131]} -radix ascii} {{/test_display/dis/data_out[130]} -radix ascii} {{/test_display/dis/data_out[129]} -radix ascii} {{/test_display/dis/data_out[128]} -radix ascii} {{/test_display/dis/data_out[127]} -radix ascii} {{/test_display/dis/data_out[126]} -radix ascii} {{/test_display/dis/data_out[125]} -radix ascii} {{/test_display/dis/data_out[124]} -radix ascii} {{/test_display/dis/data_out[123]} -radix ascii} {{/test_display/dis/data_out[122]} -radix ascii} {{/test_display/dis/data_out[121]} -radix ascii} {{/test_display/dis/data_out[120]} -radix ascii} {{/test_display/dis/data_out[119]} -radix ascii} {{/test_display/dis/data_out[118]} -radix ascii} {{/test_display/dis/data_out[117]} -radix ascii} {{/test_display/dis/data_out[116]} -radix ascii} {{/test_display/dis/data_out[115]} -radix ascii} {{/test_display/dis/data_out[114]} -radix ascii} {{/test_display/dis/data_out[113]} -radix ascii} {{/test_display/dis/data_out[112]} -radix ascii} {{/test_display/dis/data_out[111]} -radix ascii} {{/test_display/dis/data_out[110]} -radix ascii} {{/test_display/dis/data_out[109]} -radix ascii} {{/test_display/dis/data_out[108]} -radix ascii} {{/test_display/dis/data_out[107]} -radix ascii} {{/test_display/dis/data_out[106]} -radix ascii} {{/test_display/dis/data_out[105]} -radix ascii} {{/test_display/dis/data_out[104]} -radix ascii} {{/test_display/dis/data_out[103]} -radix ascii} {{/test_display/dis/data_out[102]} -radix ascii} {{/test_display/dis/data_out[101]} -radix ascii} {{/test_display/dis/data_out[100]} -radix ascii} {{/test_display/dis/data_out[99]} -radix ascii} {{/test_display/dis/data_out[98]} -radix ascii} {{/test_display/dis/data_out[97]} -radix ascii} {{/test_display/dis/data_out[96]} -radix ascii} {{/test_display/dis/data_out[95]} -radix ascii} {{/test_display/dis/data_out[94]} -radix ascii} {{/test_display/dis/data_out[93]} -radix ascii} {{/test_display/dis/data_out[92]} -radix ascii} {{/test_display/dis/data_out[91]} -radix ascii} {{/test_display/dis/data_out[90]} -radix ascii} {{/test_display/dis/data_out[89]} -radix ascii} {{/test_display/dis/data_out[88]} -radix ascii} {{/test_display/dis/data_out[87]} -radix ascii} {{/test_display/dis/data_out[86]} -radix ascii} {{/test_display/dis/data_out[85]} -radix ascii} {{/test_display/dis/data_out[84]} -radix ascii} {{/test_display/dis/data_out[83]} -radix ascii} {{/test_display/dis/data_out[82]} -radix ascii} {{/test_display/dis/data_out[81]} -radix ascii} {{/test_display/dis/data_out[80]} -radix ascii} {{/test_display/dis/data_out[79]} -radix ascii} {{/test_display/dis/data_out[78]} -radix ascii} {{/test_display/dis/data_out[77]} -radix ascii} {{/test_display/dis/data_out[76]} -radix ascii} {{/test_display/dis/data_out[75]} -radix ascii} {{/test_display/dis/data_out[74]} -radix ascii} {{/test_display/dis/data_out[73]} -radix ascii} {{/test_display/dis/data_out[72]} -radix ascii} {{/test_display/dis/data_out[71]} -radix ascii} {{/test_display/dis/data_out[70]} -radix ascii} {{/test_display/dis/data_out[69]} -radix ascii} {{/test_display/dis/data_out[68]} -radix ascii} {{/test_display/dis/data_out[67]} -radix ascii} {{/test_display/dis/data_out[66]} -radix ascii} {{/test_display/dis/data_out[65]} -radix ascii} {{/test_display/dis/data_out[64]} -radix ascii} {{/test_display/dis/data_out[63]} -radix ascii} {{/test_display/dis/data_out[62]} -radix ascii} {{/test_display/dis/data_out[61]} -radix ascii} {{/test_display/dis/data_out[60]} -radix ascii} {{/test_display/dis/data_out[59]} -radix ascii} {{/test_display/dis/data_out[58]} -radix ascii} {{/test_display/dis/data_out[57]} -radix ascii} {{/test_display/dis/data_out[56]} -radix ascii} {{/test_display/dis/data_out[55]} -radix ascii} {{/test_display/dis/data_out[54]} -radix ascii} {{/test_display/dis/data_out[53]} -radix ascii} {{/test_display/dis/data_out[52]} -radix ascii} {{/test_display/dis/data_out[51]} -radix ascii} {{/test_display/dis/data_out[50]} -radix ascii} {{/test_display/dis/data_out[49]} -radix ascii} {{/test_display/dis/data_out[48]} -radix ascii} {{/test_display/dis/data_out[47]} -radix ascii} {{/test_display/dis/data_out[46]} -radix ascii} {{/test_display/dis/data_out[45]} -radix ascii} {{/test_display/dis/data_out[44]} -radix ascii} {{/test_display/dis/data_out[43]} -radix ascii} {{/test_display/dis/data_out[42]} -radix ascii} {{/test_display/dis/data_out[41]} -radix ascii} {{/test_display/dis/data_out[40]} -radix ascii} {{/test_display/dis/data_out[39]} -radix ascii} {{/test_display/dis/data_out[38]} -radix ascii} {{/test_display/dis/data_out[37]} -radix ascii} {{/test_display/dis/data_out[36]} -radix ascii} {{/test_display/dis/data_out[35]} -radix ascii} {{/test_display/dis/data_out[34]} -radix ascii} {{/test_display/dis/data_out[33]} -radix ascii} {{/test_display/dis/data_out[32]} -radix ascii} {{/test_display/dis/data_out[31]} -radix ascii} {{/test_display/dis/data_out[30]} -radix ascii} {{/test_display/dis/data_out[29]} -radix ascii} {{/test_display/dis/data_out[28]} -radix ascii} {{/test_display/dis/data_out[27]} -radix ascii} {{/test_display/dis/data_out[26]} -radix ascii} {{/test_display/dis/data_out[25]} -radix ascii} {{/test_display/dis/data_out[24]} -radix ascii} {{/test_display/dis/data_out[23]} -radix ascii} {{/test_display/dis/data_out[22]} -radix ascii} {{/test_display/dis/data_out[21]} -radix ascii} {{/test_display/dis/data_out[20]} -radix ascii} {{/test_display/dis/data_out[19]} -radix ascii} {{/test_display/dis/data_out[18]} -radix ascii} {{/test_display/dis/data_out[17]} -radix ascii} {{/test_display/dis/data_out[16]} -radix ascii} {{/test_display/dis/data_out[15]} -radix ascii} {{/test_display/dis/data_out[14]} -radix ascii} {{/test_display/dis/data_out[13]} -radix ascii} {{/test_display/dis/data_out[12]} -radix ascii} {{/test_display/dis/data_out[11]} -radix ascii} {{/test_display/dis/data_out[10]} -radix ascii} {{/test_display/dis/data_out[9]} -radix ascii} {{/test_display/dis/data_out[8]} -radix ascii} {{/test_display/dis/data_out[7]} -radix ascii} {{/test_display/dis/data_out[6]} -radix ascii} {{/test_display/dis/data_out[5]} -radix ascii} {{/test_display/dis/data_out[4]} -radix ascii} {{/test_display/dis/data_out[3]} -radix ascii} {{/test_display/dis/data_out[2]} -radix ascii} {{/test_display/dis/data_out[1]} -radix ascii} {{/test_display/dis/data_out[0]} -radix ascii}} -subitemconfig {{/test_display/dis/data_out[151]} {-height 15 -radix ascii} {/test_display/dis/data_out[150]} {-height 15 -radix ascii} {/test_display/dis/data_out[149]} {-height 15 -radix ascii} {/test_display/dis/data_out[148]} {-height 15 -radix ascii} {/test_display/dis/data_out[147]} {-height 15 -radix ascii} {/test_display/dis/data_out[146]} {-height 15 -radix ascii} {/test_display/dis/data_out[145]} {-height 15 -radix ascii} {/test_display/dis/data_out[144]} {-height 15 -radix ascii} {/test_display/dis/data_out[143]} {-height 15 -radix ascii} {/test_display/dis/data_out[142]} {-height 15 -radix ascii} {/test_display/dis/data_out[141]} {-height 15 -radix ascii} {/test_display/dis/data_out[140]} {-height 15 -radix ascii} {/test_display/dis/data_out[139]} {-height 15 -radix ascii} {/test_display/dis/data_out[138]} {-height 15 -radix ascii} {/test_display/dis/data_out[137]} {-height 15 -radix ascii} {/test_display/dis/data_out[136]} {-height 15 -radix ascii} {/test_display/dis/data_out[135]} {-height 15 -radix ascii} {/test_display/dis/data_out[134]} {-height 15 -radix ascii} {/test_display/dis/data_out[133]} {-height 15 -radix ascii} {/test_display/dis/data_out[132]} {-height 15 -radix ascii} {/test_display/dis/data_out[131]} {-height 15 -radix ascii} {/test_display/dis/data_out[130]} {-height 15 -radix ascii} {/test_display/dis/data_out[129]} {-height 15 -radix ascii} {/test_display/dis/data_out[128]} {-height 15 -radix ascii} {/test_display/dis/data_out[127]} {-height 15 -radix ascii} {/test_display/dis/data_out[126]} {-height 15 -radix ascii} {/test_display/dis/data_out[125]} {-height 15 -radix ascii} {/test_display/dis/data_out[124]} {-height 15 -radix ascii} {/test_display/dis/data_out[123]} {-height 15 -radix ascii} {/test_display/dis/data_out[122]} {-height 15 -radix ascii} {/test_display/dis/data_out[121]} {-height 15 -radix ascii} {/test_display/dis/data_out[120]} {-height 15 -radix ascii} {/test_display/dis/data_out[119]} {-height 15 -radix ascii} {/test_display/dis/data_out[118]} {-height 15 -radix ascii} {/test_display/dis/data_out[117]} {-height 15 -radix ascii} {/test_display/dis/data_out[116]} {-height 15 -radix ascii} {/test_display/dis/data_out[115]} {-height 15 -radix ascii} {/test_display/dis/data_out[114]} {-height 15 -radix ascii} {/test_display/dis/data_out[113]} {-height 15 -radix ascii} {/test_display/dis/data_out[112]} {-height 15 -radix ascii} {/test_display/dis/data_out[111]} {-height 15 -radix ascii} {/test_display/dis/data_out[110]} {-height 15 -radix ascii} {/test_display/dis/data_out[109]} {-height 15 -radix ascii} {/test_display/dis/data_out[108]} {-height 15 -radix ascii} {/test_display/dis/data_out[107]} {-height 15 -radix ascii} {/test_display/dis/data_out[106]} {-height 15 -radix ascii} {/test_display/dis/data_out[105]} {-height 15 -radix ascii} {/test_display/dis/data_out[104]} {-height 15 -radix ascii} {/test_display/dis/data_out[103]} {-height 15 -radix ascii} {/test_display/dis/data_out[102]} {-height 15 -radix ascii} {/test_display/dis/data_out[101]} {-height 15 -radix ascii} {/test_display/dis/data_out[100]} {-height 15 -radix ascii} {/test_display/dis/data_out[99]} {-height 15 -radix ascii} {/test_display/dis/data_out[98]} {-height 15 -radix ascii} {/test_display/dis/data_out[97]} {-height 15 -radix ascii} {/test_display/dis/data_out[96]} {-height 15 -radix ascii} {/test_display/dis/data_out[95]} {-height 15 -radix ascii} {/test_display/dis/data_out[94]} {-height 15 -radix ascii} {/test_display/dis/data_out[93]} {-height 15 -radix ascii} {/test_display/dis/data_out[92]} {-height 15 -radix ascii} {/test_display/dis/data_out[91]} {-height 15 -radix ascii} {/test_display/dis/data_out[90]} {-height 15 -radix ascii} {/test_display/dis/data_out[89]} {-height 15 -radix ascii} {/test_display/dis/data_out[88]} {-height 15 -radix ascii} {/test_display/dis/data_out[87]} {-height 15 -radix ascii} {/test_display/dis/data_out[86]} {-height 15 -radix ascii} {/test_display/dis/data_out[85]} {-height 15 -radix ascii} {/test_display/dis/data_out[84]} {-height 15 -radix ascii} {/test_display/dis/data_out[83]} {-height 15 -radix ascii} {/test_display/dis/data_out[82]} {-height 15 -radix ascii} {/test_display/dis/data_out[81]} {-height 15 -radix ascii} {/test_display/dis/data_out[80]} {-height 15 -radix ascii} {/test_display/dis/data_out[79]} {-height 15 -radix ascii} {/test_display/dis/data_out[78]} {-height 15 -radix ascii} {/test_display/dis/data_out[77]} {-height 15 -radix ascii} {/test_display/dis/data_out[76]} {-height 15 -radix ascii} {/test_display/dis/data_out[75]} {-height 15 -radix ascii} {/test_display/dis/data_out[74]} {-height 15 -radix ascii} {/test_display/dis/data_out[73]} {-height 15 -radix ascii} {/test_display/dis/data_out[72]} {-height 15 -radix ascii} {/test_display/dis/data_out[71]} {-height 15 -radix ascii} {/test_display/dis/data_out[70]} {-height 15 -radix ascii} {/test_display/dis/data_out[69]} {-height 15 -radix ascii} {/test_display/dis/data_out[68]} {-height 15 -radix ascii} {/test_display/dis/data_out[67]} {-height 15 -radix ascii} {/test_display/dis/data_out[66]} {-height 15 -radix ascii} {/test_display/dis/data_out[65]} {-height 15 -radix ascii} {/test_display/dis/data_out[64]} {-height 15 -radix ascii} {/test_display/dis/data_out[63]} {-height 15 -radix ascii} {/test_display/dis/data_out[62]} {-height 15 -radix ascii} {/test_display/dis/data_out[61]} {-height 15 -radix ascii} {/test_display/dis/data_out[60]} {-height 15 -radix ascii} {/test_display/dis/data_out[59]} {-height 15 -radix ascii} {/test_display/dis/data_out[58]} {-height 15 -radix ascii} {/test_display/dis/data_out[57]} {-height 15 -radix ascii} {/test_display/dis/data_out[56]} {-height 15 -radix ascii} {/test_display/dis/data_out[55]} {-height 15 -radix ascii} {/test_display/dis/data_out[54]} {-height 15 -radix ascii} {/test_display/dis/data_out[53]} {-height 15 -radix ascii} {/test_display/dis/data_out[52]} {-height 15 -radix ascii} {/test_display/dis/data_out[51]} {-height 15 -radix ascii} {/test_display/dis/data_out[50]} {-height 15 -radix ascii} {/test_display/dis/data_out[49]} {-height 15 -radix ascii} {/test_display/dis/data_out[48]} {-height 15 -radix ascii} {/test_display/dis/data_out[47]} {-height 15 -radix ascii} {/test_display/dis/data_out[46]} {-height 15 -radix ascii} {/test_display/dis/data_out[45]} {-height 15 -radix ascii} {/test_display/dis/data_out[44]} {-height 15 -radix ascii} {/test_display/dis/data_out[43]} {-height 15 -radix ascii} {/test_display/dis/data_out[42]} {-height 15 -radix ascii} {/test_display/dis/data_out[41]} {-height 15 -radix ascii} {/test_display/dis/data_out[40]} {-height 15 -radix ascii} {/test_display/dis/data_out[39]} {-height 15 -radix ascii} {/test_display/dis/data_out[38]} {-height 15 -radix ascii} {/test_display/dis/data_out[37]} {-height 15 -radix ascii} {/test_display/dis/data_out[36]} {-height 15 -radix ascii} {/test_display/dis/data_out[35]} {-height 15 -radix ascii} {/test_display/dis/data_out[34]} {-height 15 -radix ascii} {/test_display/dis/data_out[33]} {-height 15 -radix ascii} {/test_display/dis/data_out[32]} {-height 15 -radix ascii} {/test_display/dis/data_out[31]} {-height 15 -radix ascii} {/test_display/dis/data_out[30]} {-height 15 -radix ascii} {/test_display/dis/data_out[29]} {-height 15 -radix ascii} {/test_display/dis/data_out[28]} {-height 15 -radix ascii} {/test_display/dis/data_out[27]} {-height 15 -radix ascii} {/test_display/dis/data_out[26]} {-height 15 -radix ascii} {/test_display/dis/data_out[25]} {-height 15 -radix ascii} {/test_display/dis/data_out[24]} {-height 15 -radix ascii} {/test_display/dis/data_out[23]} {-height 15 -radix ascii} {/test_display/dis/data_out[22]} {-height 15 -radix ascii} {/test_display/dis/data_out[21]} {-height 15 -radix ascii} {/test_display/dis/data_out[20]} {-height 15 -radix ascii} {/test_display/dis/data_out[19]} {-height 15 -radix ascii} {/test_display/dis/data_out[18]} {-height 15 -radix ascii} {/test_display/dis/data_out[17]} {-height 15 -radix ascii} {/test_display/dis/data_out[16]} {-height 15 -radix ascii} {/test_display/dis/data_out[15]} {-height 15 -radix ascii} {/test_display/dis/data_out[14]} {-height 15 -radix ascii} {/test_display/dis/data_out[13]} {-height 15 -radix ascii} {/test_display/dis/data_out[12]} {-height 15 -radix ascii} {/test_display/dis/data_out[11]} {-height 15 -radix ascii} {/test_display/dis/data_out[10]} {-height 15 -radix ascii} {/test_display/dis/data_out[9]} {-height 15 -radix ascii} {/test_display/dis/data_out[8]} {-height 15 -radix ascii} {/test_display/dis/data_out[7]} {-height 15 -radix ascii} {/test_display/dis/data_out[6]} {-height 15 -radix ascii} {/test_display/dis/data_out[5]} {-height 15 -radix ascii} {/test_display/dis/data_out[4]} {-height 15 -radix ascii} {/test_display/dis/data_out[3]} {-height 15 -radix ascii} {/test_display/dis/data_out[2]} {-height 15 -radix ascii} {/test_display/dis/data_out[1]} {-height 15 -radix ascii} {/test_display/dis/data_out[0]} {-height 15 -radix ascii}} /test_display/dis/data_out
add wave -noupdate /test_display/dis/end_transmission
add wave -noupdate -radix binary -childformat {{{/test_display/dis/input_value[15]} -radix binary} {{/test_display/dis/input_value[14]} -radix binary} {{/test_display/dis/input_value[13]} -radix binary} {{/test_display/dis/input_value[12]} -radix binary} {{/test_display/dis/input_value[11]} -radix binary} {{/test_display/dis/input_value[10]} -radix binary} {{/test_display/dis/input_value[9]} -radix binary} {{/test_display/dis/input_value[8]} -radix binary} {{/test_display/dis/input_value[7]} -radix binary} {{/test_display/dis/input_value[6]} -radix binary} {{/test_display/dis/input_value[5]} -radix binary} {{/test_display/dis/input_value[4]} -radix binary} {{/test_display/dis/input_value[3]} -radix binary} {{/test_display/dis/input_value[2]} -radix binary} {{/test_display/dis/input_value[1]} -radix binary} {{/test_display/dis/input_value[0]} -radix binary}} -subitemconfig {{/test_display/dis/input_value[15]} {-height 15 -radix binary} {/test_display/dis/input_value[14]} {-height 15 -radix binary} {/test_display/dis/input_value[13]} {-height 15 -radix binary} {/test_display/dis/input_value[12]} {-height 15 -radix binary} {/test_display/dis/input_value[11]} {-height 15 -radix binary} {/test_display/dis/input_value[10]} {-height 15 -radix binary} {/test_display/dis/input_value[9]} {-height 15 -radix binary} {/test_display/dis/input_value[8]} {-height 15 -radix binary} {/test_display/dis/input_value[7]} {-height 15 -radix binary} {/test_display/dis/input_value[6]} {-height 15 -radix binary} {/test_display/dis/input_value[5]} {-height 15 -radix binary} {/test_display/dis/input_value[4]} {-height 15 -radix binary} {/test_display/dis/input_value[3]} {-height 15 -radix binary} {/test_display/dis/input_value[2]} {-height 15 -radix binary} {/test_display/dis/input_value[1]} {-height 15 -radix binary} {/test_display/dis/input_value[0]} {-height 15 -radix binary}} /test_display/dis/input_value
add wave -noupdate -radix decimal /test_display/dis/MasterFSM/delay_cnt
add wave -noupdate /test_display/dis/MasterFSM/current_state
add wave -noupdate /test_display/dis/MasterFSM/next_state
add wave -noupdate /test_display/dis/MasterFSM/end_display
add wave -noupdate /test_display/dis/spi/begin_transmission
add wave -noupdate /test_display/dis/spi/spi_clk_count
add wave -noupdate /test_display/dis/MasterFSM/data_out
add wave -noupdate /test_display/dis/MasterFSM/ascii_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {416997000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 262
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
WaveRestoreZoom {0 ps} {735535500 ps}
