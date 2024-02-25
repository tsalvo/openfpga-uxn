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
entity step_cpu_0CLK_1d574cf7 is
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
end step_cpu_0CLK_1d574cf7;
architecture arch of step_cpu_0CLK_1d574cf7 is
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
-- BIN_OP_NEQ[uxn_c_l71_c6_38fc]
signal BIN_OP_NEQ_uxn_c_l71_c6_38fc_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_38fc_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_4e30]
signal BIN_OP_NEQ_uxn_c_l71_c49_4e30_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_4e30_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_0b9f]
signal BIN_OP_AND_uxn_c_l71_c6_0b9f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_0b9f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_a586]
signal pending_controller_MUX_uxn_c_l71_c2_a586_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_a586_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_a586_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_a586_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_ba83]
signal BIN_OP_EQ_uxn_c_l75_c22_ba83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_ba83_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_8abb]
signal MUX_uxn_c_l75_c22_8abb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_8abb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_8abb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_8abb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_f245]
signal BIN_OP_AND_uxn_c_l75_c6_f245_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_f245_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_f245_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_6b5d]
signal pending_frame_MUX_uxn_c_l75_c2_6b5d_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_6b5d_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_6b5d_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_0ee4]
signal BIN_OP_AND_uxn_c_l79_c33_0ee4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_0ee4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_ee42]
signal MUX_uxn_c_l80_c54_ee42_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_ee42_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_ee42_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_ee42_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_8a18]
signal MUX_uxn_c_l80_c21_8a18_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_8a18_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_8a18_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_8a18_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_655a]
signal MUX_uxn_c_l80_c7_655a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_655a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_655a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_655a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_a516]
signal BIN_OP_OR_uxn_c_l81_c15_a516_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_a516_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_a516_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_db08]
signal MUX_uxn_c_l81_c15_db08_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_db08_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_db08_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_db08_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_09ce]
signal BIN_OP_EQ_uxn_c_l82_c23_09ce_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_09ce_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_645e]
signal MUX_uxn_c_l82_c23_645e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_645e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_645e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_645e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_4070]
signal BIN_OP_EQ_uxn_c_l87_c6_4070_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_4070_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_4070_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_a273]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l87_c2_10dd]
signal ins_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l87_c2_10dd]
signal pc_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(7 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_10dd]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_10dd]
signal is_ins_done_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_10dd]
signal is_waiting_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_55bd]
signal BIN_OP_EQ_uxn_c_l94_c11_55bd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_55bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_e344]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l94_c7_a273]
signal ins_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_a273_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l94_c7_a273]
signal pc_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_a273_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output : unsigned(7 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_a273]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_a273]
signal is_ins_done_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_a273]
signal is_waiting_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_e08c]
signal BIN_OP_PLUS_uxn_c_l95_c3_e08c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_e08c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_30f3]
signal BIN_OP_EQ_uxn_c_l98_c9_30f3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_30f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_a669]
signal MUX_uxn_c_l98_c9_a669_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_a669_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_a669_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_a669_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_ab12]
signal BIN_OP_MINUS_uxn_c_l99_c64_ab12_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_ab12_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output : unsigned(11 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_ba99]
signal eval_opcode_phased_uxn_c_l99_c45_ba99_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_phase : unsigned(11 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_ba99_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_530e]
signal MUX_uxn_c_l100_c8_530e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_530e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_530e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_530e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_41ce]
signal BIN_OP_OR_uxn_c_l112_c6_41ce_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_41ce_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_41ce_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_c7b1]
signal step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iftrue : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iffalse : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_81ba]
signal BIN_OP_EQ_uxn_c_l115_c21_81ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_81ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_6286]
signal BIN_OP_PLUS_uxn_c_l115_c44_6286_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_6286_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output : unsigned(12 downto 0);

-- MUX[uxn_c_l115_c21_9f3a]
signal MUX_uxn_c_l115_c21_9f3a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_9f3a_iftrue : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_9f3a_iffalse : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_9f3a_return_output : unsigned(11 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232( ref_toks_0 : unsigned;
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
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.u16_addr := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_38fc
BIN_OP_NEQ_uxn_c_l71_c6_38fc : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_38fc_left,
BIN_OP_NEQ_uxn_c_l71_c6_38fc_right,
BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_4e30
BIN_OP_NEQ_uxn_c_l71_c49_4e30 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_4e30_left,
BIN_OP_NEQ_uxn_c_l71_c49_4e30_right,
BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_0b9f
BIN_OP_AND_uxn_c_l71_c6_0b9f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_0b9f_left,
BIN_OP_AND_uxn_c_l71_c6_0b9f_right,
BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_a586
pending_controller_MUX_uxn_c_l71_c2_a586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_a586_cond,
pending_controller_MUX_uxn_c_l71_c2_a586_iftrue,
pending_controller_MUX_uxn_c_l71_c2_a586_iffalse,
pending_controller_MUX_uxn_c_l71_c2_a586_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_ba83
BIN_OP_EQ_uxn_c_l75_c22_ba83 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_ba83_left,
BIN_OP_EQ_uxn_c_l75_c22_ba83_right,
BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output);

-- MUX_uxn_c_l75_c22_8abb
MUX_uxn_c_l75_c22_8abb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_8abb_cond,
MUX_uxn_c_l75_c22_8abb_iftrue,
MUX_uxn_c_l75_c22_8abb_iffalse,
MUX_uxn_c_l75_c22_8abb_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_f245
BIN_OP_AND_uxn_c_l75_c6_f245 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_f245_left,
BIN_OP_AND_uxn_c_l75_c6_f245_right,
BIN_OP_AND_uxn_c_l75_c6_f245_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_6b5d
pending_frame_MUX_uxn_c_l75_c2_6b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_6b5d_cond,
pending_frame_MUX_uxn_c_l75_c2_6b5d_iftrue,
pending_frame_MUX_uxn_c_l75_c2_6b5d_iffalse,
pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_0ee4
BIN_OP_AND_uxn_c_l79_c33_0ee4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_0ee4_left,
BIN_OP_AND_uxn_c_l79_c33_0ee4_right,
BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output);

-- MUX_uxn_c_l80_c54_ee42
MUX_uxn_c_l80_c54_ee42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_ee42_cond,
MUX_uxn_c_l80_c54_ee42_iftrue,
MUX_uxn_c_l80_c54_ee42_iffalse,
MUX_uxn_c_l80_c54_ee42_return_output);

-- MUX_uxn_c_l80_c21_8a18
MUX_uxn_c_l80_c21_8a18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_8a18_cond,
MUX_uxn_c_l80_c21_8a18_iftrue,
MUX_uxn_c_l80_c21_8a18_iffalse,
MUX_uxn_c_l80_c21_8a18_return_output);

-- MUX_uxn_c_l80_c7_655a
MUX_uxn_c_l80_c7_655a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_655a_cond,
MUX_uxn_c_l80_c7_655a_iftrue,
MUX_uxn_c_l80_c7_655a_iffalse,
MUX_uxn_c_l80_c7_655a_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_a516
BIN_OP_OR_uxn_c_l81_c15_a516 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_a516_left,
BIN_OP_OR_uxn_c_l81_c15_a516_right,
BIN_OP_OR_uxn_c_l81_c15_a516_return_output);

-- MUX_uxn_c_l81_c15_db08
MUX_uxn_c_l81_c15_db08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_db08_cond,
MUX_uxn_c_l81_c15_db08_iftrue,
MUX_uxn_c_l81_c15_db08_iffalse,
MUX_uxn_c_l81_c15_db08_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_09ce
BIN_OP_EQ_uxn_c_l82_c23_09ce : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_09ce_left,
BIN_OP_EQ_uxn_c_l82_c23_09ce_right,
BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output);

-- MUX_uxn_c_l82_c23_645e
MUX_uxn_c_l82_c23_645e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_645e_cond,
MUX_uxn_c_l82_c23_645e_iftrue,
MUX_uxn_c_l82_c23_645e_iffalse,
MUX_uxn_c_l82_c23_645e_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_4070
BIN_OP_EQ_uxn_c_l87_c6_4070 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_4070_left,
BIN_OP_EQ_uxn_c_l87_c6_4070_right,
BIN_OP_EQ_uxn_c_l87_c6_4070_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output);

-- ins_MUX_uxn_c_l87_c2_10dd
ins_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_10dd_cond,
ins_MUX_uxn_c_l87_c2_10dd_iftrue,
ins_MUX_uxn_c_l87_c2_10dd_iffalse,
ins_MUX_uxn_c_l87_c2_10dd_return_output);

-- pc_MUX_uxn_c_l87_c2_10dd
pc_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_10dd_cond,
pc_MUX_uxn_c_l87_c2_10dd_iftrue,
pc_MUX_uxn_c_l87_c2_10dd_iffalse,
pc_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_10dd
is_ins_done_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_10dd_cond,
is_ins_done_MUX_uxn_c_l87_c2_10dd_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_10dd_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_10dd
is_waiting_MUX_uxn_c_l87_c2_10dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_10dd_cond,
is_waiting_MUX_uxn_c_l87_c2_10dd_iftrue,
is_waiting_MUX_uxn_c_l87_c2_10dd_iffalse,
is_waiting_MUX_uxn_c_l87_c2_10dd_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_55bd
BIN_OP_EQ_uxn_c_l94_c11_55bd : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_55bd_left,
BIN_OP_EQ_uxn_c_l94_c11_55bd_right,
BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output);

-- ins_MUX_uxn_c_l94_c7_a273
ins_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_a273_cond,
ins_MUX_uxn_c_l94_c7_a273_iftrue,
ins_MUX_uxn_c_l94_c7_a273_iffalse,
ins_MUX_uxn_c_l94_c7_a273_return_output);

-- pc_MUX_uxn_c_l94_c7_a273
pc_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_a273_cond,
pc_MUX_uxn_c_l94_c7_a273_iftrue,
pc_MUX_uxn_c_l94_c7_a273_iffalse,
pc_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_a273
is_ins_done_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_a273_cond,
is_ins_done_MUX_uxn_c_l94_c7_a273_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_a273_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_a273_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_a273
is_waiting_MUX_uxn_c_l94_c7_a273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_a273_cond,
is_waiting_MUX_uxn_c_l94_c7_a273_iftrue,
is_waiting_MUX_uxn_c_l94_c7_a273_iffalse,
is_waiting_MUX_uxn_c_l94_c7_a273_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_e08c
BIN_OP_PLUS_uxn_c_l95_c3_e08c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_e08c_left,
BIN_OP_PLUS_uxn_c_l95_c3_e08c_right,
BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_30f3
BIN_OP_EQ_uxn_c_l98_c9_30f3 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_30f3_left,
BIN_OP_EQ_uxn_c_l98_c9_30f3_right,
BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output);

-- MUX_uxn_c_l98_c9_a669
MUX_uxn_c_l98_c9_a669 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_a669_cond,
MUX_uxn_c_l98_c9_a669_iftrue,
MUX_uxn_c_l98_c9_a669_iffalse,
MUX_uxn_c_l98_c9_a669_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_ab12
BIN_OP_MINUS_uxn_c_l99_c64_ab12 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_ab12_left,
BIN_OP_MINUS_uxn_c_l99_c64_ab12_right,
BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_ba99
eval_opcode_phased_uxn_c_l99_c45_ba99 : entity work.eval_opcode_phased_0CLK_2b405341 port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_ba99_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_ba99_phase,
eval_opcode_phased_uxn_c_l99_c45_ba99_ins,
eval_opcode_phased_uxn_c_l99_c45_ba99_pc,
eval_opcode_phased_uxn_c_l99_c45_ba99_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_ba99_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_ba99_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_ba99_return_output);

-- MUX_uxn_c_l100_c8_530e
MUX_uxn_c_l100_c8_530e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_530e_cond,
MUX_uxn_c_l100_c8_530e_iftrue,
MUX_uxn_c_l100_c8_530e_iffalse,
MUX_uxn_c_l100_c8_530e_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_41ce
BIN_OP_OR_uxn_c_l112_c6_41ce : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_41ce_left,
BIN_OP_OR_uxn_c_l112_c6_41ce_right,
BIN_OP_OR_uxn_c_l112_c6_41ce_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_c7b1
step_cpu_phase_MUX_uxn_c_l112_c2_c7b1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_81ba
BIN_OP_EQ_uxn_c_l115_c21_81ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_81ba_left,
BIN_OP_EQ_uxn_c_l115_c21_81ba_right,
BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_6286
BIN_OP_PLUS_uxn_c_l115_c44_6286 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_6286_left,
BIN_OP_PLUS_uxn_c_l115_c44_6286_right,
BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output);

-- MUX_uxn_c_l115_c21_9f3a
MUX_uxn_c_l115_c21_9f3a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_9f3a_cond,
MUX_uxn_c_l115_c21_9f3a_iftrue,
MUX_uxn_c_l115_c21_9f3a_iffalse,
MUX_uxn_c_l115_c21_9f3a_return_output);



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
 BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output,
 BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output,
 pending_controller_MUX_uxn_c_l71_c2_a586_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output,
 MUX_uxn_c_l75_c22_8abb_return_output,
 BIN_OP_AND_uxn_c_l75_c6_f245_return_output,
 pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output,
 BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output,
 MUX_uxn_c_l80_c54_ee42_return_output,
 MUX_uxn_c_l80_c21_8a18_return_output,
 MUX_uxn_c_l80_c7_655a_return_output,
 BIN_OP_OR_uxn_c_l81_c15_a516_return_output,
 MUX_uxn_c_l81_c15_db08_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output,
 MUX_uxn_c_l82_c23_645e_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_4070_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output,
 ins_MUX_uxn_c_l87_c2_10dd_return_output,
 pc_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output,
 is_waiting_MUX_uxn_c_l87_c2_10dd_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output,
 ins_MUX_uxn_c_l94_c7_a273_return_output,
 pc_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_a273_return_output,
 is_waiting_MUX_uxn_c_l94_c7_a273_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output,
 MUX_uxn_c_l98_c9_a669_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output,
 eval_opcode_phased_uxn_c_l99_c45_ba99_return_output,
 MUX_uxn_c_l100_c8_530e_return_output,
 BIN_OP_OR_uxn_c_l112_c6_41ce_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output,
 MUX_uxn_c_l115_c21_9f3a_return_output)
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
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_38ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_a586_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_a586_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_a586_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_a586_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_f245_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_8abb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_5f93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_8abb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_8abb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_8abb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_f245_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_f245_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_655a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_655a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_655a_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_8a18_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_8a18_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_8a18_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ee42_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ee42_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ee42_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ee42_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_8a18_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_655a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_db08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_a516_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_a516_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_a516_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_db08_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_db08_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_db08_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_645e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_645e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_645e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_645e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_a273_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_a273_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_28d3 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_a273_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_a273_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_a273_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_a273_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_a273_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_a669_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_a669_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_a669_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_a669_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_phase : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_530e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_4ee9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_530e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_530e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_530e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_2866_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_2326_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_2ddb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_556f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_7b58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_1f32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_04bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_1041_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iftrue : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_1bae : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iffalse : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_9f3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_eebc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_9f3a_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_9f3a_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_9f3a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_64a3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_a862_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_44ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_8ca2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232_uxn_c_l118_l63_DUPLICATE_3236_return_output : cpu_step_result_t;
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
     VAR_MUX_uxn_c_l115_c21_9f3a_iftrue := resize(to_unsigned(0, 1), 12);
     VAR_MUX_uxn_c_l81_c15_db08_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l113_c3_1bae := resize(to_unsigned(0, 1), 12);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_1bae;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_right := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l75_c22_8abb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_right := to_unsigned(1, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l82_c23_645e_iftrue := to_unsigned(0, 1);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_iffalse := pending_frame;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_right := to_unsigned(1, 1);
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l75_c22_8abb_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_right := to_unsigned(1, 1);
     VAR_pending_controller_MUX_uxn_c_l71_c2_a586_iftrue := to_unsigned(1, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_ee42_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_a669_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_10dd_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_a273_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_f245_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_655a_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_db08_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_ee42_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_655a_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_a586_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_a669_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_8a18_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_left := step_cpu_phase;
     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_a273] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_a273_return_output := cpu_step_result.is_vram_write;

     -- BIN_OP_EQ[uxn_c_l98_c9_30f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_30f3_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_left;
     BIN_OP_EQ_uxn_c_l98_c9_30f3_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output := BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_44ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_44ae_return_output := cpu_step_result.vram_write_layer;

     -- BIN_OP_PLUS[uxn_c_l115_c44_6286] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_6286_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_left;
     BIN_OP_PLUS_uxn_c_l115_c44_6286_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output := BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_a273] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_a273_return_output := cpu_step_result.u16_addr;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_a273] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_a273_return_output := cpu_step_result.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_64a3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_64a3_return_output := cpu_step_result.device_ram_address;

     -- BIN_OP_MINUS[uxn_c_l99_c64_ab12] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_ab12_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_left;
     BIN_OP_MINUS_uxn_c_l99_c64_ab12_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output := BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output;

     -- uint16_15_8[uxn_c_l71_c49_38ed] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_38ed_return_output := uint16_15_8(
     VAR_controller_vector);

     -- BIN_OP_EQ[uxn_c_l87_c6_4070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_4070_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_left;
     BIN_OP_EQ_uxn_c_l87_c6_4070_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output := BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;

     -- uint16_15_8[uxn_c_l75_c22_5f93] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_5f93_return_output := uint16_15_8(
     VAR_screen_vector);

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_a273] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_a273_return_output := cpu_step_result.is_device_ram_write;

     -- BIN_OP_NEQ[uxn_c_l71_c6_38fc] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_38fc_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_left;
     BIN_OP_NEQ_uxn_c_l71_c6_38fc_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output := BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output;

     -- BIN_OP_EQ[uxn_c_l94_c11_55bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_55bd_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_left;
     BIN_OP_EQ_uxn_c_l94_c11_55bd_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output := BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_a862 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_a862_return_output := cpu_step_result.u8_value;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_10dd_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_4070_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_a273_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_55bd_return_output;
     VAR_MUX_uxn_c_l98_c9_a669_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_30f3_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_ab12_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_38fc_return_output;
     VAR_MUX_uxn_c_l115_c21_9f3a_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_6286_return_output, 12);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_44ae_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_44ae_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_64a3_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l87_l94_DUPLICATE_64a3_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_a862_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_a862_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_a273_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_left := VAR_uint16_15_8_uxn_c_l71_c49_38ed_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_left := VAR_uint16_15_8_uxn_c_l75_c22_5f93_return_output;
     -- BIN_OP_NEQ[uxn_c_l71_c49_4e30] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_4e30_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_left;
     BIN_OP_NEQ_uxn_c_l71_c49_4e30_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output := BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output;

     -- MUX[uxn_c_l98_c9_a669] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_a669_cond <= VAR_MUX_uxn_c_l98_c9_a669_cond;
     MUX_uxn_c_l98_c9_a669_iftrue <= VAR_MUX_uxn_c_l98_c9_a669_iftrue;
     MUX_uxn_c_l98_c9_a669_iffalse <= VAR_MUX_uxn_c_l98_c9_a669_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_a669_return_output := MUX_uxn_c_l98_c9_a669_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_ba83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_ba83_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_left;
     BIN_OP_EQ_uxn_c_l75_c22_ba83_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output := BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_8abb_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_ba83_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_4e30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_ins := VAR_MUX_uxn_c_l98_c9_a669_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_a273_iffalse := VAR_MUX_uxn_c_l98_c9_a669_return_output;
     -- BIN_OP_AND[uxn_c_l71_c6_0b9f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_0b9f_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_left;
     BIN_OP_AND_uxn_c_l71_c6_0b9f_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output := BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output;

     -- ins_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_a273_cond <= VAR_ins_MUX_uxn_c_l94_c7_a273_cond;
     ins_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_a273_iftrue;
     ins_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_a273_return_output := ins_MUX_uxn_c_l94_c7_a273_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_e344] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output;

     -- MUX[uxn_c_l75_c22_8abb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_8abb_cond <= VAR_MUX_uxn_c_l75_c22_8abb_cond;
     MUX_uxn_c_l75_c22_8abb_iftrue <= VAR_MUX_uxn_c_l75_c22_8abb_iftrue;
     MUX_uxn_c_l75_c22_8abb_iffalse <= VAR_MUX_uxn_c_l75_c22_8abb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_8abb_return_output := MUX_uxn_c_l75_c22_8abb_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_a586_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_0b9f_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_e344_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_f245_right := VAR_MUX_uxn_c_l75_c22_8abb_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_ins_MUX_uxn_c_l94_c7_a273_return_output;
     -- ins_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_10dd_cond <= VAR_ins_MUX_uxn_c_l87_c2_10dd_cond;
     ins_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_10dd_iftrue;
     ins_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_10dd_return_output := ins_MUX_uxn_c_l87_c2_10dd_return_output;

     -- pending_controller_MUX[uxn_c_l71_c2_a586] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_a586_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_a586_cond;
     pending_controller_MUX_uxn_c_l71_c2_a586_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_a586_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_a586_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_a586_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_a586_return_output := pending_controller_MUX_uxn_c_l71_c2_a586_return_output;

     -- BIN_OP_AND[uxn_c_l75_c6_f245] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_f245_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_f245_left;
     BIN_OP_AND_uxn_c_l75_c6_f245_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_f245_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_f245_return_output := BIN_OP_AND_uxn_c_l75_c6_f245_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_f245_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_10dd_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_a516_right := VAR_pending_controller_MUX_uxn_c_l71_c2_a586_return_output;
     VAR_MUX_uxn_c_l80_c54_ee42_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_a586_return_output;
     VAR_MUX_uxn_c_l82_c23_645e_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_a586_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_6b5d] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_6b5d_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_cond;
     pending_frame_MUX_uxn_c_l75_c2_6b5d_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_6b5d_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output := pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output;

     -- MUX[uxn_c_l80_c54_ee42] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_ee42_cond <= VAR_MUX_uxn_c_l80_c54_ee42_cond;
     MUX_uxn_c_l80_c54_ee42_iftrue <= VAR_MUX_uxn_c_l80_c54_ee42_iftrue;
     MUX_uxn_c_l80_c54_ee42_iffalse <= VAR_MUX_uxn_c_l80_c54_ee42_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_ee42_return_output := MUX_uxn_c_l80_c54_ee42_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_8a18_iffalse := VAR_MUX_uxn_c_l80_c54_ee42_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_left := VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_a516_left := VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output;
     VAR_MUX_uxn_c_l80_c21_8a18_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_6b5d_return_output;
     -- BIN_OP_AND[uxn_c_l79_c33_0ee4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_0ee4_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_left;
     BIN_OP_AND_uxn_c_l79_c33_0ee4_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output := BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output;

     -- BIN_OP_OR[uxn_c_l81_c15_a516] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_a516_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_a516_left;
     BIN_OP_OR_uxn_c_l81_c15_a516_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_a516_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_a516_return_output := BIN_OP_OR_uxn_c_l81_c15_a516_return_output;

     -- MUX[uxn_c_l80_c21_8a18] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_8a18_cond <= VAR_MUX_uxn_c_l80_c21_8a18_cond;
     MUX_uxn_c_l80_c21_8a18_iftrue <= VAR_MUX_uxn_c_l80_c21_8a18_iftrue;
     MUX_uxn_c_l80_c21_8a18_iffalse <= VAR_MUX_uxn_c_l80_c21_8a18_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_8a18_return_output := MUX_uxn_c_l80_c21_8a18_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_db08_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_a516_return_output;
     VAR_MUX_uxn_c_l80_c7_655a_iftrue := VAR_MUX_uxn_c_l80_c21_8a18_return_output;
     -- MUX[uxn_c_l81_c15_db08] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_db08_cond <= VAR_MUX_uxn_c_l81_c15_db08_cond;
     MUX_uxn_c_l81_c15_db08_iftrue <= VAR_MUX_uxn_c_l81_c15_db08_iftrue;
     MUX_uxn_c_l81_c15_db08_iffalse <= VAR_MUX_uxn_c_l81_c15_db08_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_db08_return_output := MUX_uxn_c_l81_c15_db08_return_output;

     -- MUX[uxn_c_l80_c7_655a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_655a_cond <= VAR_MUX_uxn_c_l80_c7_655a_cond;
     MUX_uxn_c_l80_c7_655a_iftrue <= VAR_MUX_uxn_c_l80_c7_655a_iftrue;
     MUX_uxn_c_l80_c7_655a_iffalse <= VAR_MUX_uxn_c_l80_c7_655a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_655a_return_output := MUX_uxn_c_l80_c7_655a_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_left := VAR_MUX_uxn_c_l80_c7_655a_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_left := VAR_MUX_uxn_c_l80_c7_655a_return_output;
     VAR_MUX_uxn_c_l100_c8_530e_iffalse := VAR_MUX_uxn_c_l80_c7_655a_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iftrue := VAR_MUX_uxn_c_l80_c7_655a_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_pc := VAR_MUX_uxn_c_l80_c7_655a_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_10dd_iftrue := VAR_MUX_uxn_c_l80_c7_655a_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_iftrue := VAR_MUX_uxn_c_l81_c15_db08_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_a273_iftrue := VAR_MUX_uxn_c_l81_c15_db08_return_output;
     -- BIN_OP_EQ[uxn_c_l82_c23_09ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_09ce_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_left;
     BIN_OP_EQ_uxn_c_l82_c23_09ce_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output := BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_e08c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_e08c_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_left;
     BIN_OP_PLUS_uxn_c_l95_c3_e08c_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output := BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output;

     -- eval_opcode_phased[uxn_c_l99_c45_ba99] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_ba99_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_ba99_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_phase;
     eval_opcode_phased_uxn_c_l99_c45_ba99_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_ins;
     eval_opcode_phased_uxn_c_l99_c45_ba99_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_pc;
     eval_opcode_phased_uxn_c_l99_c45_ba99_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_ba99_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_ba99_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output := eval_opcode_phased_uxn_c_l99_c45_ba99_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_645e_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_09ce_return_output;
     VAR_pc_uxn_c_l95_c3_28d3 := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_e08c_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_a273_iftrue := VAR_pc_uxn_c_l95_c3_28d3;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_4ee9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_4ee9_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_1041] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_1041_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_04bc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_04bc_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.is_waiting;

     -- MUX[uxn_c_l82_c23_645e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_645e_cond <= VAR_MUX_uxn_c_l82_c23_645e_cond;
     MUX_uxn_c_l82_c23_645e_iftrue <= VAR_MUX_uxn_c_l82_c23_645e_iftrue;
     MUX_uxn_c_l82_c23_645e_iffalse <= VAR_MUX_uxn_c_l82_c23_645e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_645e_return_output := MUX_uxn_c_l82_c23_645e_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_2ddb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_2ddb_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_8ca2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_8ca2_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_7b58] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_7b58_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_2866] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_2866_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_2326] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_2326_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_1f32] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_1f32_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_556f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_556f_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_ba99_return_output.device_ram_address;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_530e_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_8ca2_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_8ca2_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_7b58_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_1041_return_output;
     VAR_MUX_uxn_c_l100_c8_530e_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_4ee9_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_2866_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_2326_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_04bc_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_2ddb_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_556f_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_1f32_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_645e_return_output;
     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_a273_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_a273_cond;
     is_waiting_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_a273_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_a273_return_output := is_waiting_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output;

     -- MUX[uxn_c_l100_c8_530e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_530e_cond <= VAR_MUX_uxn_c_l100_c8_530e_cond;
     MUX_uxn_c_l100_c8_530e_iftrue <= VAR_MUX_uxn_c_l100_c8_530e_iftrue;
     MUX_uxn_c_l100_c8_530e_iffalse <= VAR_MUX_uxn_c_l100_c8_530e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_530e_return_output := MUX_uxn_c_l100_c8_530e_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_a273_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_cond;
     is_ins_done_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_return_output := is_ins_done_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_a273_iffalse := VAR_MUX_uxn_c_l100_c8_530e_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_a273_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_a273_return_output;
     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output;

     -- pc_MUX[uxn_c_l94_c7_a273] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_a273_cond <= VAR_pc_MUX_uxn_c_l94_c7_a273_cond;
     pc_MUX_uxn_c_l94_c7_a273_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_a273_iftrue;
     pc_MUX_uxn_c_l94_c7_a273_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_a273_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_a273_return_output := pc_MUX_uxn_c_l94_c7_a273_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output;

     -- is_ins_done_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_10dd_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_cond;
     is_ins_done_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output := is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_10dd_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_cond;
     is_waiting_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_return_output := is_waiting_MUX_uxn_c_l87_c2_10dd_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_10dd_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_right := VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_10dd_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_10dd_iffalse := VAR_pc_MUX_uxn_c_l94_c7_a273_return_output;
     -- pc_MUX[uxn_c_l87_c2_10dd] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_10dd_cond <= VAR_pc_MUX_uxn_c_l87_c2_10dd_cond;
     pc_MUX_uxn_c_l87_c2_10dd_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_10dd_iftrue;
     pc_MUX_uxn_c_l87_c2_10dd_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_10dd_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_10dd_return_output := pc_MUX_uxn_c_l87_c2_10dd_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232_uxn_c_l118_l63_DUPLICATE_3236 LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232_uxn_c_l118_l63_DUPLICATE_3236_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232(
     VAR_BIN_OP_AND_uxn_c_l79_c33_0ee4_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_10dd_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_10dd_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_10dd_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_10dd_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_10dd_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_10dd_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_10dd_return_output);

     -- BIN_OP_OR[uxn_c_l112_c6_41ce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_41ce_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_left;
     BIN_OP_OR_uxn_c_l112_c6_41ce_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_return_output := BIN_OP_OR_uxn_c_l112_c6_41ce_return_output;

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_41ce_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232_uxn_c_l118_l63_DUPLICATE_3236_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6232_uxn_c_l118_l63_DUPLICATE_3236_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_10dd_return_output;
     -- uint16_15_8[uxn_c_l115_c21_eebc] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_eebc_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_10dd_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_left := VAR_uint16_15_8_uxn_c_l115_c21_eebc_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_81ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_81ba_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_left;
     BIN_OP_EQ_uxn_c_l115_c21_81ba_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output := BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_9f3a_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_81ba_return_output;
     -- MUX[uxn_c_l115_c21_9f3a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_9f3a_cond <= VAR_MUX_uxn_c_l115_c21_9f3a_cond;
     MUX_uxn_c_l115_c21_9f3a_iftrue <= VAR_MUX_uxn_c_l115_c21_9f3a_iftrue;
     MUX_uxn_c_l115_c21_9f3a_iffalse <= VAR_MUX_uxn_c_l115_c21_9f3a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_9f3a_return_output := MUX_uxn_c_l115_c21_9f3a_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iffalse := VAR_MUX_uxn_c_l115_c21_9f3a_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_c7b1] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_c7b1_return_output;
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
