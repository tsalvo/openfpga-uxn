-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 57
entity step_cpu_0CLK_d647ba01 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 is_new_frame : in unsigned(0 downto 0);
 screen_vector : in unsigned(15 downto 0);
 controller_vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_d647ba01;
architecture arch of step_cpu_0CLK_d647ba01 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal pc : unsigned(15 downto 0) := to_unsigned(256, 16);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal step_cpu_phase : unsigned(11 downto 0) := to_unsigned(0, 12);
signal is_ins_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_waiting : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pending_controller : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pending_frame : unsigned(0 downto 0) := to_unsigned(0, 1);
signal last_controller0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal cpu_step_result : cpu_step_result_t := (
is_ram_write => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
swap_buffers => to_unsigned(0, 1),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(11 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_is_waiting : unsigned(0 downto 0);
signal REG_COMB_pending_controller : unsigned(0 downto 0);
signal REG_COMB_pending_frame : unsigned(0 downto 0);
signal REG_COMB_last_controller0 : unsigned(7 downto 0);
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_NEQ[uxn_c_l71_c6_93de]
signal BIN_OP_NEQ_uxn_c_l71_c6_93de_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_93de_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_d45a]
signal BIN_OP_NEQ_uxn_c_l71_c49_d45a_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_d45a_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_9b85]
signal BIN_OP_AND_uxn_c_l71_c6_9b85_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_9b85_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_9b85_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_88f6]
signal pending_controller_MUX_uxn_c_l71_c2_88f6_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_88f6_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_88f6_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_88f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_f869]
signal BIN_OP_EQ_uxn_c_l75_c22_f869_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_f869_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_f869_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_7728]
signal MUX_uxn_c_l75_c22_7728_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_7728_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_7728_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_7728_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_84be]
signal BIN_OP_AND_uxn_c_l75_c6_84be_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_84be_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_84be_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_851c]
signal pending_frame_MUX_uxn_c_l75_c2_851c_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_851c_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_851c_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_851c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_d217]
signal BIN_OP_AND_uxn_c_l79_c33_d217_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_d217_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_d217_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_6f66]
signal MUX_uxn_c_l80_c54_6f66_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_6f66_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_6f66_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_6f66_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_a356]
signal MUX_uxn_c_l80_c21_a356_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_a356_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_a356_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_a356_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_6541]
signal MUX_uxn_c_l80_c7_6541_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_6541_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_6541_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_6541_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_3aab]
signal BIN_OP_OR_uxn_c_l81_c15_3aab_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_3aab_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_3aab_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_1fdd]
signal MUX_uxn_c_l81_c15_1fdd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_1fdd_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_1fdd_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_1fdd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_0596]
signal BIN_OP_EQ_uxn_c_l82_c23_0596_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_0596_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_0596_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_60af]
signal MUX_uxn_c_l82_c23_60af_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_60af_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_60af_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_60af_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_7a8e]
signal BIN_OP_EQ_uxn_c_l87_c6_7a8e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_7a8e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_20a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l87_c2_14bb]
signal pc_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_14bb]
signal is_ins_done_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_14bb]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l87_c2_14bb]
signal ins_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_14bb]
signal is_waiting_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_f59f]
signal BIN_OP_EQ_uxn_c_l94_c11_f59f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_f59f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_155c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l94_c7_20a7]
signal pc_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_20a7]
signal is_ins_done_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_20a7]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l94_c7_20a7]
signal ins_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_20a7]
signal is_waiting_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_efdd]
signal BIN_OP_PLUS_uxn_c_l95_c3_efdd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_efdd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_4aa5]
signal BIN_OP_EQ_uxn_c_l98_c9_4aa5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_4aa5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_58d8]
signal MUX_uxn_c_l98_c9_58d8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_58d8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_58d8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_58d8_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_7784]
signal BIN_OP_MINUS_uxn_c_l99_c64_7784_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_7784_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output : unsigned(11 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_91e5]
signal eval_opcode_phased_uxn_c_l99_c45_91e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_phase : unsigned(11 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_91e5_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_7586]
signal MUX_uxn_c_l100_c8_7586_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_7586_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_7586_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_7586_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_6db3]
signal BIN_OP_OR_uxn_c_l112_c6_6db3_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_6db3_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_6db3_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_8d97]
signal step_cpu_phase_MUX_uxn_c_l112_c2_8d97_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iftrue : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iffalse : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_3bf6]
signal BIN_OP_EQ_uxn_c_l115_c21_3bf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_3bf6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_777c]
signal BIN_OP_PLUS_uxn_c_l115_c44_777c_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_777c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output : unsigned(12 downto 0);

-- MUX[uxn_c_l115_c21_e3c7]
signal MUX_uxn_c_l115_c21_e3c7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_e3c7_iftrue : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_e3c7_iffalse : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_e3c7_return_output : unsigned(11 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.swap_buffers := ref_toks_0;
      base.u16_addr := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.vram_write_layer := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_93de
BIN_OP_NEQ_uxn_c_l71_c6_93de : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_93de_left,
BIN_OP_NEQ_uxn_c_l71_c6_93de_right,
BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_d45a
BIN_OP_NEQ_uxn_c_l71_c49_d45a : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_d45a_left,
BIN_OP_NEQ_uxn_c_l71_c49_d45a_right,
BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_9b85
BIN_OP_AND_uxn_c_l71_c6_9b85 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_9b85_left,
BIN_OP_AND_uxn_c_l71_c6_9b85_right,
BIN_OP_AND_uxn_c_l71_c6_9b85_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_88f6
pending_controller_MUX_uxn_c_l71_c2_88f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_88f6_cond,
pending_controller_MUX_uxn_c_l71_c2_88f6_iftrue,
pending_controller_MUX_uxn_c_l71_c2_88f6_iffalse,
pending_controller_MUX_uxn_c_l71_c2_88f6_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_f869
BIN_OP_EQ_uxn_c_l75_c22_f869 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_f869_left,
BIN_OP_EQ_uxn_c_l75_c22_f869_right,
BIN_OP_EQ_uxn_c_l75_c22_f869_return_output);

-- MUX_uxn_c_l75_c22_7728
MUX_uxn_c_l75_c22_7728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_7728_cond,
MUX_uxn_c_l75_c22_7728_iftrue,
MUX_uxn_c_l75_c22_7728_iffalse,
MUX_uxn_c_l75_c22_7728_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_84be
BIN_OP_AND_uxn_c_l75_c6_84be : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_84be_left,
BIN_OP_AND_uxn_c_l75_c6_84be_right,
BIN_OP_AND_uxn_c_l75_c6_84be_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_851c
pending_frame_MUX_uxn_c_l75_c2_851c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_851c_cond,
pending_frame_MUX_uxn_c_l75_c2_851c_iftrue,
pending_frame_MUX_uxn_c_l75_c2_851c_iffalse,
pending_frame_MUX_uxn_c_l75_c2_851c_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_d217
BIN_OP_AND_uxn_c_l79_c33_d217 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_d217_left,
BIN_OP_AND_uxn_c_l79_c33_d217_right,
BIN_OP_AND_uxn_c_l79_c33_d217_return_output);

-- MUX_uxn_c_l80_c54_6f66
MUX_uxn_c_l80_c54_6f66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_6f66_cond,
MUX_uxn_c_l80_c54_6f66_iftrue,
MUX_uxn_c_l80_c54_6f66_iffalse,
MUX_uxn_c_l80_c54_6f66_return_output);

-- MUX_uxn_c_l80_c21_a356
MUX_uxn_c_l80_c21_a356 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_a356_cond,
MUX_uxn_c_l80_c21_a356_iftrue,
MUX_uxn_c_l80_c21_a356_iffalse,
MUX_uxn_c_l80_c21_a356_return_output);

-- MUX_uxn_c_l80_c7_6541
MUX_uxn_c_l80_c7_6541 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_6541_cond,
MUX_uxn_c_l80_c7_6541_iftrue,
MUX_uxn_c_l80_c7_6541_iffalse,
MUX_uxn_c_l80_c7_6541_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_3aab
BIN_OP_OR_uxn_c_l81_c15_3aab : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_3aab_left,
BIN_OP_OR_uxn_c_l81_c15_3aab_right,
BIN_OP_OR_uxn_c_l81_c15_3aab_return_output);

-- MUX_uxn_c_l81_c15_1fdd
MUX_uxn_c_l81_c15_1fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_1fdd_cond,
MUX_uxn_c_l81_c15_1fdd_iftrue,
MUX_uxn_c_l81_c15_1fdd_iffalse,
MUX_uxn_c_l81_c15_1fdd_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_0596
BIN_OP_EQ_uxn_c_l82_c23_0596 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_0596_left,
BIN_OP_EQ_uxn_c_l82_c23_0596_right,
BIN_OP_EQ_uxn_c_l82_c23_0596_return_output);

-- MUX_uxn_c_l82_c23_60af
MUX_uxn_c_l82_c23_60af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_60af_cond,
MUX_uxn_c_l82_c23_60af_iftrue,
MUX_uxn_c_l82_c23_60af_iffalse,
MUX_uxn_c_l82_c23_60af_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_7a8e
BIN_OP_EQ_uxn_c_l87_c6_7a8e : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_7a8e_left,
BIN_OP_EQ_uxn_c_l87_c6_7a8e_right,
BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output);

-- pc_MUX_uxn_c_l87_c2_14bb
pc_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_14bb_cond,
pc_MUX_uxn_c_l87_c2_14bb_iftrue,
pc_MUX_uxn_c_l87_c2_14bb_iffalse,
pc_MUX_uxn_c_l87_c2_14bb_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_14bb
is_ins_done_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_14bb_cond,
is_ins_done_MUX_uxn_c_l87_c2_14bb_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_14bb_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output);

-- ins_MUX_uxn_c_l87_c2_14bb
ins_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_14bb_cond,
ins_MUX_uxn_c_l87_c2_14bb_iftrue,
ins_MUX_uxn_c_l87_c2_14bb_iffalse,
ins_MUX_uxn_c_l87_c2_14bb_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_14bb
is_waiting_MUX_uxn_c_l87_c2_14bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_14bb_cond,
is_waiting_MUX_uxn_c_l87_c2_14bb_iftrue,
is_waiting_MUX_uxn_c_l87_c2_14bb_iffalse,
is_waiting_MUX_uxn_c_l87_c2_14bb_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_f59f
BIN_OP_EQ_uxn_c_l94_c11_f59f : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_f59f_left,
BIN_OP_EQ_uxn_c_l94_c11_f59f_right,
BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output);

-- pc_MUX_uxn_c_l94_c7_20a7
pc_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_20a7_cond,
pc_MUX_uxn_c_l94_c7_20a7_iftrue,
pc_MUX_uxn_c_l94_c7_20a7_iffalse,
pc_MUX_uxn_c_l94_c7_20a7_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_20a7
is_ins_done_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_20a7_cond,
is_ins_done_MUX_uxn_c_l94_c7_20a7_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_20a7_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output);

-- ins_MUX_uxn_c_l94_c7_20a7
ins_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_20a7_cond,
ins_MUX_uxn_c_l94_c7_20a7_iftrue,
ins_MUX_uxn_c_l94_c7_20a7_iffalse,
ins_MUX_uxn_c_l94_c7_20a7_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_20a7
is_waiting_MUX_uxn_c_l94_c7_20a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_20a7_cond,
is_waiting_MUX_uxn_c_l94_c7_20a7_iftrue,
is_waiting_MUX_uxn_c_l94_c7_20a7_iffalse,
is_waiting_MUX_uxn_c_l94_c7_20a7_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_efdd
BIN_OP_PLUS_uxn_c_l95_c3_efdd : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_efdd_left,
BIN_OP_PLUS_uxn_c_l95_c3_efdd_right,
BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_4aa5
BIN_OP_EQ_uxn_c_l98_c9_4aa5 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_4aa5_left,
BIN_OP_EQ_uxn_c_l98_c9_4aa5_right,
BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output);

-- MUX_uxn_c_l98_c9_58d8
MUX_uxn_c_l98_c9_58d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_58d8_cond,
MUX_uxn_c_l98_c9_58d8_iftrue,
MUX_uxn_c_l98_c9_58d8_iffalse,
MUX_uxn_c_l98_c9_58d8_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_7784
BIN_OP_MINUS_uxn_c_l99_c64_7784 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_7784_left,
BIN_OP_MINUS_uxn_c_l99_c64_7784_right,
BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_91e5
eval_opcode_phased_uxn_c_l99_c45_91e5 : entity work.eval_opcode_phased_0CLK_9ca6ca05 port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_91e5_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_91e5_phase,
eval_opcode_phased_uxn_c_l99_c45_91e5_ins,
eval_opcode_phased_uxn_c_l99_c45_91e5_pc,
eval_opcode_phased_uxn_c_l99_c45_91e5_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_91e5_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_91e5_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_91e5_return_output);

-- MUX_uxn_c_l100_c8_7586
MUX_uxn_c_l100_c8_7586 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_7586_cond,
MUX_uxn_c_l100_c8_7586_iftrue,
MUX_uxn_c_l100_c8_7586_iffalse,
MUX_uxn_c_l100_c8_7586_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_6db3
BIN_OP_OR_uxn_c_l112_c6_6db3 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_6db3_left,
BIN_OP_OR_uxn_c_l112_c6_6db3_right,
BIN_OP_OR_uxn_c_l112_c6_6db3_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_8d97
step_cpu_phase_MUX_uxn_c_l112_c2_8d97 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_8d97_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_3bf6
BIN_OP_EQ_uxn_c_l115_c21_3bf6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_3bf6_left,
BIN_OP_EQ_uxn_c_l115_c21_3bf6_right,
BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_777c
BIN_OP_PLUS_uxn_c_l115_c44_777c : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_777c_left,
BIN_OP_PLUS_uxn_c_l115_c44_777c_right,
BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output);

-- MUX_uxn_c_l115_c21_e3c7
MUX_uxn_c_l115_c21_e3c7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_e3c7_cond,
MUX_uxn_c_l115_c21_e3c7_iftrue,
MUX_uxn_c_l115_c21_e3c7_iffalse,
MUX_uxn_c_l115_c21_e3c7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 previous_ram_read_value,
 previous_device_ram_read,
 controller0_buttons,
 is_new_frame,
 screen_vector,
 controller_vector,
 -- Registers
 pc,
 ins,
 step_cpu_phase,
 is_ins_done,
 is_waiting,
 pending_controller,
 pending_frame,
 last_controller0,
 cpu_step_result,
 -- All submodule outputs
 BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output,
 BIN_OP_AND_uxn_c_l71_c6_9b85_return_output,
 pending_controller_MUX_uxn_c_l71_c2_88f6_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_f869_return_output,
 MUX_uxn_c_l75_c22_7728_return_output,
 BIN_OP_AND_uxn_c_l75_c6_84be_return_output,
 pending_frame_MUX_uxn_c_l75_c2_851c_return_output,
 BIN_OP_AND_uxn_c_l79_c33_d217_return_output,
 MUX_uxn_c_l80_c54_6f66_return_output,
 MUX_uxn_c_l80_c21_a356_return_output,
 MUX_uxn_c_l80_c7_6541_return_output,
 BIN_OP_OR_uxn_c_l81_c15_3aab_return_output,
 MUX_uxn_c_l81_c15_1fdd_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_0596_return_output,
 MUX_uxn_c_l82_c23_60af_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output,
 pc_MUX_uxn_c_l87_c2_14bb_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output,
 ins_MUX_uxn_c_l87_c2_14bb_return_output,
 is_waiting_MUX_uxn_c_l87_c2_14bb_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output,
 pc_MUX_uxn_c_l94_c7_20a7_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output,
 ins_MUX_uxn_c_l94_c7_20a7_return_output,
 is_waiting_MUX_uxn_c_l94_c7_20a7_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output,
 MUX_uxn_c_l98_c9_58d8_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output,
 eval_opcode_phased_uxn_c_l99_c45_91e5_return_output,
 MUX_uxn_c_l100_c8_7586_return_output,
 BIN_OP_OR_uxn_c_l112_c6_6db3_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output,
 MUX_uxn_c_l115_c21_e3c7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_is_new_frame : unsigned(0 downto 0);
 variable VAR_screen_vector : unsigned(15 downto 0);
 variable VAR_controller_vector : unsigned(15 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_740e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_84be_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_7728_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_4150_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_7728_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_7728_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_7728_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_84be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_84be_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_851c_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_851c_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_851c_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_851c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_d217_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_d217_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_d217_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_6541_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_6541_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_6541_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_a356_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_a356_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_a356_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_6f66_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_6f66_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_6f66_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_6f66_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_a356_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_6541_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_1fdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_1fdd_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_1fdd_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_1fdd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_60af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_60af_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_60af_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_60af_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_a6ab : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_20a7_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_20a7_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_58d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_58d8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_58d8_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_58d8_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_phase : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_7586_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_111e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_7586_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_7586_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_7586_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_9591_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_90bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_b9c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_cdbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_aefb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_ec38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_27f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_3281_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iftrue : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_0827 : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iffalse : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_e3c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_31da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_e3c7_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_e3c7_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_e3c7_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_fc0c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_9fc6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_1b4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a975_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2_uxn_c_l118_l63_DUPLICATE_80dc_return_output : cpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_step_cpu_phase : unsigned(11 downto 0);
variable REG_VAR_is_ins_done : unsigned(0 downto 0);
variable REG_VAR_is_waiting : unsigned(0 downto 0);
variable REG_VAR_pending_controller : unsigned(0 downto 0);
variable REG_VAR_pending_frame : unsigned(0 downto 0);
variable REG_VAR_last_controller0 : unsigned(7 downto 0);
variable REG_VAR_cpu_step_result : cpu_step_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_pc := pc;
  REG_VAR_ins := ins;
  REG_VAR_step_cpu_phase := step_cpu_phase;
  REG_VAR_is_ins_done := is_ins_done;
  REG_VAR_is_waiting := is_waiting;
  REG_VAR_pending_controller := pending_controller;
  REG_VAR_pending_frame := pending_frame;
  REG_VAR_last_controller0 := last_controller0;
  REG_VAR_cpu_step_result := cpu_step_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l75_c22_7728_iftrue := to_unsigned(0, 1);
     VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l82_c23_60af_iftrue := to_unsigned(0, 1);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_851c_iffalse := pending_frame;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_right := to_unsigned(1, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l113_c3_0827 := resize(to_unsigned(0, 1), 12);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_0827;
     VAR_pending_frame_MUX_uxn_c_l75_c2_851c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l75_c22_7728_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_right := to_unsigned(2, 2);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_right := to_unsigned(1, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l115_c21_e3c7_iftrue := resize(to_unsigned(0, 1), 12);
     VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l81_c15_1fdd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_previous_ram_read_value := previous_ram_read_value;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_controller0_buttons := controller0_buttons;
     VAR_is_new_frame := is_new_frame;
     VAR_screen_vector := screen_vector;
     VAR_controller_vector := controller_vector;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_6f66_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_58d8_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_14bb_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_20a7_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_84be_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_d217_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_6541_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_1fdd_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_6f66_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_6541_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_58d8_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_a356_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_left := step_cpu_phase;
     -- BIN_OP_EQ[uxn_c_l98_c9_4aa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_4aa5_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_left;
     BIN_OP_EQ_uxn_c_l98_c9_4aa5_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output := BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output;

     -- BIN_OP_EQ[uxn_c_l94_c11_f59f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_f59f_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_left;
     BIN_OP_EQ_uxn_c_l94_c11_f59f_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output := BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;

     -- BIN_OP_EQ[uxn_c_l87_c6_7a8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_7a8e_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_left;
     BIN_OP_EQ_uxn_c_l87_c6_7a8e_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output := BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;

     -- BIN_OP_PLUS[uxn_c_l115_c44_777c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_777c_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_left;
     BIN_OP_PLUS_uxn_c_l115_c44_777c_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output := BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output;

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_20a7] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_20a7_return_output := cpu_step_result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_c_l99_c64_7784] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_7784_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_left;
     BIN_OP_MINUS_uxn_c_l99_c64_7784_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output := BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_fc0c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_fc0c_return_output := cpu_step_result.device_ram_address;

     -- uint16_15_8[uxn_c_l71_c49_740e] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_740e_return_output := uint16_15_8(
     VAR_controller_vector);

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_1b4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_1b4d_return_output := cpu_step_result.vram_write_layer;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_20a7] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_20a7_return_output := cpu_step_result.is_vram_write;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_20a7] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_20a7_return_output := cpu_step_result.is_ram_write;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_20a7] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_20a7_return_output := cpu_step_result.u16_addr;

     -- BIN_OP_NEQ[uxn_c_l71_c6_93de] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_93de_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_left;
     BIN_OP_NEQ_uxn_c_l71_c6_93de_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output := BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_9fc6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_9fc6_return_output := cpu_step_result.u8_value;

     -- uint16_15_8[uxn_c_l75_c22_4150] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_4150_return_output := uint16_15_8(
     VAR_screen_vector);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_14bb_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_7a8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_20a7_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_f59f_return_output;
     VAR_MUX_uxn_c_l98_c9_58d8_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_4aa5_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_7784_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_93de_return_output;
     VAR_MUX_uxn_c_l115_c21_e3c7_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_777c_return_output, 12);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_1b4d_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_1b4d_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_fc0c_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_fc0c_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_9fc6_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_9fc6_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_20a7_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_left := VAR_uint16_15_8_uxn_c_l71_c49_740e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_left := VAR_uint16_15_8_uxn_c_l75_c22_4150_return_output;
     -- BIN_OP_NEQ[uxn_c_l71_c49_d45a] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_d45a_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_left;
     BIN_OP_NEQ_uxn_c_l71_c49_d45a_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output := BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output;

     -- MUX[uxn_c_l98_c9_58d8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_58d8_cond <= VAR_MUX_uxn_c_l98_c9_58d8_cond;
     MUX_uxn_c_l98_c9_58d8_iftrue <= VAR_MUX_uxn_c_l98_c9_58d8_iftrue;
     MUX_uxn_c_l98_c9_58d8_iffalse <= VAR_MUX_uxn_c_l98_c9_58d8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_58d8_return_output := MUX_uxn_c_l98_c9_58d8_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_f869] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_f869_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_left;
     BIN_OP_EQ_uxn_c_l75_c22_f869_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_return_output := BIN_OP_EQ_uxn_c_l75_c22_f869_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_7728_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_f869_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_d45a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_ins := VAR_MUX_uxn_c_l98_c9_58d8_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_MUX_uxn_c_l98_c9_58d8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_155c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output;

     -- ins_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_20a7_cond <= VAR_ins_MUX_uxn_c_l94_c7_20a7_cond;
     ins_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_20a7_iftrue;
     ins_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_20a7_return_output := ins_MUX_uxn_c_l94_c7_20a7_return_output;

     -- BIN_OP_AND[uxn_c_l71_c6_9b85] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_9b85_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_left;
     BIN_OP_AND_uxn_c_l71_c6_9b85_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_return_output := BIN_OP_AND_uxn_c_l71_c6_9b85_return_output;

     -- MUX[uxn_c_l75_c22_7728] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_7728_cond <= VAR_MUX_uxn_c_l75_c22_7728_cond;
     MUX_uxn_c_l75_c22_7728_iftrue <= VAR_MUX_uxn_c_l75_c22_7728_iftrue;
     MUX_uxn_c_l75_c22_7728_iffalse <= VAR_MUX_uxn_c_l75_c22_7728_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_7728_return_output := MUX_uxn_c_l75_c22_7728_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_9b85_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_155c_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_84be_right := VAR_MUX_uxn_c_l75_c22_7728_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_ins_MUX_uxn_c_l94_c7_20a7_return_output;
     -- pending_controller_MUX[uxn_c_l71_c2_88f6] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_88f6_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_cond;
     pending_controller_MUX_uxn_c_l71_c2_88f6_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_88f6_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_return_output := pending_controller_MUX_uxn_c_l71_c2_88f6_return_output;

     -- BIN_OP_AND[uxn_c_l75_c6_84be] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_84be_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_84be_left;
     BIN_OP_AND_uxn_c_l75_c6_84be_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_84be_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_84be_return_output := BIN_OP_AND_uxn_c_l75_c6_84be_return_output;

     -- ins_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_14bb_cond <= VAR_ins_MUX_uxn_c_l87_c2_14bb_cond;
     ins_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_14bb_iftrue;
     ins_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_14bb_return_output := ins_MUX_uxn_c_l87_c2_14bb_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_851c_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_84be_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_14bb_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_right := VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_return_output;
     VAR_MUX_uxn_c_l80_c54_6f66_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_return_output;
     VAR_MUX_uxn_c_l82_c23_60af_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_88f6_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_851c] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_851c_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_851c_cond;
     pending_frame_MUX_uxn_c_l75_c2_851c_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_851c_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_851c_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_851c_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_851c_return_output := pending_frame_MUX_uxn_c_l75_c2_851c_return_output;

     -- MUX[uxn_c_l80_c54_6f66] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_6f66_cond <= VAR_MUX_uxn_c_l80_c54_6f66_cond;
     MUX_uxn_c_l80_c54_6f66_iftrue <= VAR_MUX_uxn_c_l80_c54_6f66_iftrue;
     MUX_uxn_c_l80_c54_6f66_iffalse <= VAR_MUX_uxn_c_l80_c54_6f66_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_6f66_return_output := MUX_uxn_c_l80_c54_6f66_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_a356_iffalse := VAR_MUX_uxn_c_l80_c54_6f66_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_d217_left := VAR_pending_frame_MUX_uxn_c_l75_c2_851c_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_left := VAR_pending_frame_MUX_uxn_c_l75_c2_851c_return_output;
     VAR_MUX_uxn_c_l80_c21_a356_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_851c_return_output;
     -- BIN_OP_AND[uxn_c_l79_c33_d217] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_d217_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_d217_left;
     BIN_OP_AND_uxn_c_l79_c33_d217_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_d217_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_d217_return_output := BIN_OP_AND_uxn_c_l79_c33_d217_return_output;

     -- BIN_OP_OR[uxn_c_l81_c15_3aab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_3aab_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_left;
     BIN_OP_OR_uxn_c_l81_c15_3aab_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_return_output := BIN_OP_OR_uxn_c_l81_c15_3aab_return_output;

     -- MUX[uxn_c_l80_c21_a356] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_a356_cond <= VAR_MUX_uxn_c_l80_c21_a356_cond;
     MUX_uxn_c_l80_c21_a356_iftrue <= VAR_MUX_uxn_c_l80_c21_a356_iftrue;
     MUX_uxn_c_l80_c21_a356_iffalse <= VAR_MUX_uxn_c_l80_c21_a356_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_a356_return_output := MUX_uxn_c_l80_c21_a356_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_1fdd_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_3aab_return_output;
     VAR_MUX_uxn_c_l80_c7_6541_iftrue := VAR_MUX_uxn_c_l80_c21_a356_return_output;
     -- MUX[uxn_c_l81_c15_1fdd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_1fdd_cond <= VAR_MUX_uxn_c_l81_c15_1fdd_cond;
     MUX_uxn_c_l81_c15_1fdd_iftrue <= VAR_MUX_uxn_c_l81_c15_1fdd_iftrue;
     MUX_uxn_c_l81_c15_1fdd_iffalse <= VAR_MUX_uxn_c_l81_c15_1fdd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_1fdd_return_output := MUX_uxn_c_l81_c15_1fdd_return_output;

     -- MUX[uxn_c_l80_c7_6541] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_6541_cond <= VAR_MUX_uxn_c_l80_c7_6541_cond;
     MUX_uxn_c_l80_c7_6541_iftrue <= VAR_MUX_uxn_c_l80_c7_6541_iftrue;
     MUX_uxn_c_l80_c7_6541_iffalse <= VAR_MUX_uxn_c_l80_c7_6541_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_6541_return_output := MUX_uxn_c_l80_c7_6541_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_left := VAR_MUX_uxn_c_l80_c7_6541_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_left := VAR_MUX_uxn_c_l80_c7_6541_return_output;
     VAR_MUX_uxn_c_l100_c8_7586_iffalse := VAR_MUX_uxn_c_l80_c7_6541_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iftrue := VAR_MUX_uxn_c_l80_c7_6541_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_pc := VAR_MUX_uxn_c_l80_c7_6541_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_14bb_iftrue := VAR_MUX_uxn_c_l80_c7_6541_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_iftrue := VAR_MUX_uxn_c_l81_c15_1fdd_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_MUX_uxn_c_l81_c15_1fdd_return_output;
     -- eval_opcode_phased[uxn_c_l99_c45_91e5] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_91e5_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_91e5_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_phase;
     eval_opcode_phased_uxn_c_l99_c45_91e5_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_ins;
     eval_opcode_phased_uxn_c_l99_c45_91e5_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_pc;
     eval_opcode_phased_uxn_c_l99_c45_91e5_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_91e5_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_91e5_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output := eval_opcode_phased_uxn_c_l99_c45_91e5_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_efdd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_efdd_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_left;
     BIN_OP_PLUS_uxn_c_l95_c3_efdd_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output := BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c23_0596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_0596_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_left;
     BIN_OP_EQ_uxn_c_l82_c23_0596_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_return_output := BIN_OP_EQ_uxn_c_l82_c23_0596_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_60af_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_0596_return_output;
     VAR_pc_uxn_c_l95_c3_a6ab := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_efdd_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_20a7_iftrue := VAR_pc_uxn_c_l95_c3_a6ab;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_90bb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_90bb_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_111e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_111e_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.is_pc_updated;

     -- MUX[uxn_c_l82_c23_60af] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_60af_cond <= VAR_MUX_uxn_c_l82_c23_60af_cond;
     MUX_uxn_c_l82_c23_60af_iftrue <= VAR_MUX_uxn_c_l82_c23_60af_iftrue;
     MUX_uxn_c_l82_c23_60af_iffalse <= VAR_MUX_uxn_c_l82_c23_60af_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_60af_return_output := MUX_uxn_c_l82_c23_60af_return_output;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a975 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a975_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_27f7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_27f7_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.is_waiting;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_ec38] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_ec38_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_9591] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_9591_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_aefb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_aefb_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_3281] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_3281_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_cdbc] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_cdbc_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_b9c7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_b9c7_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_91e5_return_output.vram_write_layer;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_7586_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a975_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a975_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_aefb_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_3281_return_output;
     VAR_MUX_uxn_c_l100_c8_7586_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_111e_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_9591_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_90bb_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_27f7_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_b9c7_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_cdbc_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_ec38_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_60af_return_output;
     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_20a7_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_cond;
     is_ins_done_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output := is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output;

     -- MUX[uxn_c_l100_c8_7586] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_7586_cond <= VAR_MUX_uxn_c_l100_c8_7586_cond;
     MUX_uxn_c_l100_c8_7586_iftrue <= VAR_MUX_uxn_c_l100_c8_7586_iftrue;
     MUX_uxn_c_l100_c8_7586_iffalse <= VAR_MUX_uxn_c_l100_c8_7586_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_7586_return_output := MUX_uxn_c_l100_c8_7586_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_20a7_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_cond;
     is_waiting_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_return_output := is_waiting_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_20a7_iffalse := VAR_MUX_uxn_c_l100_c8_7586_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_20a7_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_20a7_return_output;
     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_14bb_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_cond;
     is_waiting_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_return_output := is_waiting_MUX_uxn_c_l87_c2_14bb_return_output;

     -- is_ins_done_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_14bb_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_cond;
     is_ins_done_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output := is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output;

     -- pc_MUX[uxn_c_l94_c7_20a7] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_20a7_cond <= VAR_pc_MUX_uxn_c_l94_c7_20a7_cond;
     pc_MUX_uxn_c_l94_c7_20a7_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_20a7_iftrue;
     pc_MUX_uxn_c_l94_c7_20a7_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_20a7_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_20a7_return_output := pc_MUX_uxn_c_l94_c7_20a7_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_14bb_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_right := VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_14bb_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_14bb_iffalse := VAR_pc_MUX_uxn_c_l94_c7_20a7_return_output;
     -- BIN_OP_OR[uxn_c_l112_c6_6db3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_6db3_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_left;
     BIN_OP_OR_uxn_c_l112_c6_6db3_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_return_output := BIN_OP_OR_uxn_c_l112_c6_6db3_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2_uxn_c_l118_l63_DUPLICATE_80dc LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2_uxn_c_l118_l63_DUPLICATE_80dc_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2(
     VAR_BIN_OP_AND_uxn_c_l79_c33_d217_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_14bb_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_14bb_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_14bb_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_14bb_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_14bb_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_14bb_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_14bb_return_output);

     -- pc_MUX[uxn_c_l87_c2_14bb] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_14bb_cond <= VAR_pc_MUX_uxn_c_l87_c2_14bb_cond;
     pc_MUX_uxn_c_l87_c2_14bb_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_14bb_iftrue;
     pc_MUX_uxn_c_l87_c2_14bb_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_14bb_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_14bb_return_output := pc_MUX_uxn_c_l87_c2_14bb_return_output;

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_6db3_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2_uxn_c_l118_l63_DUPLICATE_80dc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_3ad2_uxn_c_l118_l63_DUPLICATE_80dc_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_14bb_return_output;
     -- uint16_15_8[uxn_c_l115_c21_31da] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_31da_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_14bb_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_left := VAR_uint16_15_8_uxn_c_l115_c21_31da_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_3bf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_3bf6_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_left;
     BIN_OP_EQ_uxn_c_l115_c21_3bf6_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output := BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_e3c7_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_3bf6_return_output;
     -- MUX[uxn_c_l115_c21_e3c7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_e3c7_cond <= VAR_MUX_uxn_c_l115_c21_e3c7_cond;
     MUX_uxn_c_l115_c21_e3c7_iftrue <= VAR_MUX_uxn_c_l115_c21_e3c7_iftrue;
     MUX_uxn_c_l115_c21_e3c7_iffalse <= VAR_MUX_uxn_c_l115_c21_e3c7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_e3c7_return_output := MUX_uxn_c_l115_c21_e3c7_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iffalse := VAR_MUX_uxn_c_l115_c21_e3c7_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_8d97] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_8d97_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_8d97_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_pc <= REG_VAR_pc;
REG_COMB_ins <= REG_VAR_ins;
REG_COMB_step_cpu_phase <= REG_VAR_step_cpu_phase;
REG_COMB_is_ins_done <= REG_VAR_is_ins_done;
REG_COMB_is_waiting <= REG_VAR_is_waiting;
REG_COMB_pending_controller <= REG_VAR_pending_controller;
REG_COMB_pending_frame <= REG_VAR_pending_frame;
REG_COMB_last_controller0 <= REG_VAR_last_controller0;
REG_COMB_cpu_step_result <= REG_VAR_cpu_step_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     pc <= REG_COMB_pc;
     ins <= REG_COMB_ins;
     step_cpu_phase <= REG_COMB_step_cpu_phase;
     is_ins_done <= REG_COMB_is_ins_done;
     is_waiting <= REG_COMB_is_waiting;
     pending_controller <= REG_COMB_pending_controller;
     pending_frame <= REG_COMB_pending_frame;
     last_controller0 <= REG_COMB_last_controller0;
     cpu_step_result <= REG_COMB_cpu_step_result;
 end if;
 end if;
end process;

end arch;
