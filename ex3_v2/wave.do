onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/top/clk
add wave -noupdate /tb/top/reset
add wave -noupdate /tb/top/cmd
add wave -noupdate /tb/top/flag_cmd
add wave -noupdate /tb/top/cmd_valid
add wave -noupdate /tb/top/datain
add wave -noupdate -radix hexadecimal /tb/top/dataout
add wave -noupdate /tb/top/output_valid
add wave -noupdate /tb/top/busy
add wave -noupdate /tb/top/image_mem_temp
add wave -noupdate /tb/top/state
add wave -noupdate /tb/top/next_state
add wave -noupdate -radix unsigned /tb/top/data_cnt
add wave -noupdate -radix unsigned /tb/top/data_out_cnt
add wave -noupdate -radix unsigned /tb/top/data_out_bits_cnt
add wave -noupdate -radix decimal /tb/top/data_out_bits_cnt2
add wave -noupdate /tb/top/add
add wave -noupdate /tb/top/data_out_cnt1
add wave -noupdate -radix hexadecimal -childformat {{{/tb/top/data_out_bits_cnt3[15]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[14]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[13]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[12]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[11]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[10]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[9]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[8]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[7]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[6]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[5]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[4]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[3]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[2]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[1]} -radix hexadecimal} {{/tb/top/data_out_bits_cnt3[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb/top/data_out_bits_cnt3[15]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[14]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[13]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[12]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[11]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[10]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[9]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[8]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[7]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[6]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[5]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[4]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[3]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[2]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[1]} {-height 15 -radix hexadecimal} {/tb/top/data_out_bits_cnt3[0]} {-height 15 -radix hexadecimal}} /tb/top/data_out_bits_cnt3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {255950000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 117
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {295313550 ps}
