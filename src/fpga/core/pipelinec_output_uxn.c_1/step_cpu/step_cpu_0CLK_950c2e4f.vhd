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
entity step_cpu_0CLK_950c2e4f is
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
end step_cpu_0CLK_950c2e4f;
architecture arch of step_cpu_0CLK_950c2e4f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal pc : unsigned(15 downto 0) := to_unsigned(256, 16);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal step_cpu_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
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
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_is_waiting : unsigned(0 downto 0);
signal REG_COMB_pending_controller : unsigned(0 downto 0);
signal REG_COMB_pending_frame : unsigned(0 downto 0);
signal REG_COMB_last_controller0 : unsigned(7 downto 0);
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_NEQ[uxn_c_l71_c6_386f]
signal BIN_OP_NEQ_uxn_c_l71_c6_386f_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_386f_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_c584]
signal BIN_OP_NEQ_uxn_c_l71_c49_c584_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_c584_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_d4b3]
signal BIN_OP_AND_uxn_c_l71_c6_d4b3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_d4b3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_ebbc]
signal pending_controller_MUX_uxn_c_l71_c2_ebbc_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_ebbc_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_ebbc_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_3e54]
signal BIN_OP_EQ_uxn_c_l75_c22_3e54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_3e54_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_3d17]
signal MUX_uxn_c_l75_c22_3d17_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_3d17_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_3d17_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_3d17_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_214a]
signal BIN_OP_AND_uxn_c_l75_c6_214a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_214a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_214a_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_afe4]
signal pending_frame_MUX_uxn_c_l75_c2_afe4_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_afe4_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_afe4_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_afe4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_f2ba]
signal BIN_OP_AND_uxn_c_l79_c33_f2ba_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_f2ba_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_badf]
signal MUX_uxn_c_l80_c54_badf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_badf_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_badf_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_badf_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_ea6e]
signal MUX_uxn_c_l80_c21_ea6e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_ea6e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_ea6e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_ea6e_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_3c89]
signal MUX_uxn_c_l80_c7_3c89_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_3c89_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_3c89_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_3c89_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_6869]
signal BIN_OP_OR_uxn_c_l81_c15_6869_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_6869_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_6869_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_542b]
signal MUX_uxn_c_l81_c15_542b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_542b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_542b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_542b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_77e3]
signal BIN_OP_EQ_uxn_c_l82_c23_77e3_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_77e3_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_7ac0]
signal MUX_uxn_c_l82_c23_7ac0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_7ac0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_7ac0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_7ac0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_c5e8]
signal BIN_OP_EQ_uxn_c_l87_c6_c5e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_c5e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_7799]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_2ee9]
signal is_ins_done_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l87_c2_2ee9]
signal ins_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l87_c2_2ee9]
signal pc_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_2ee9]
signal is_waiting_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(15 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(7 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_2ee9]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_34c0]
signal BIN_OP_EQ_uxn_c_l94_c11_34c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_34c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_835f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_7799]
signal is_ins_done_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l94_c7_7799]
signal ins_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_7799_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l94_c7_7799]
signal pc_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_7799_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_7799]
signal is_waiting_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output : unsigned(15 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output : unsigned(7 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_7799]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_b535]
signal BIN_OP_PLUS_uxn_c_l95_c3_b535_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_b535_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_4472]
signal BIN_OP_EQ_uxn_c_l98_c9_4472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_4472_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_4472_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_c7bf]
signal MUX_uxn_c_l98_c9_c7bf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_c7bf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_c7bf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_c7bf_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_e95f]
signal BIN_OP_MINUS_uxn_c_l99_c64_e95f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_e95f_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_6485]
signal eval_opcode_phased_uxn_c_l99_c45_6485_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_6485_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_90cf]
signal MUX_uxn_c_l100_c8_90cf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_90cf_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_90cf_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_90cf_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_fc65]
signal BIN_OP_OR_uxn_c_l112_c6_fc65_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_fc65_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_fc65_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_1c4a]
signal step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_5fc5]
signal BIN_OP_EQ_uxn_c_l115_c21_5fc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_5fc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_bd6a]
signal BIN_OP_PLUS_uxn_c_l115_c44_bd6a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_bd6a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l115_c21_d734]
signal MUX_uxn_c_l115_c21_d734_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_d734_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l115_c21_d734_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l115_c21_d734_return_output : unsigned(7 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb( ref_toks_0 : unsigned;
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
      base.u16_addr := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_386f
BIN_OP_NEQ_uxn_c_l71_c6_386f : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_386f_left,
BIN_OP_NEQ_uxn_c_l71_c6_386f_right,
BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_c584
BIN_OP_NEQ_uxn_c_l71_c49_c584 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_c584_left,
BIN_OP_NEQ_uxn_c_l71_c49_c584_right,
BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_d4b3
BIN_OP_AND_uxn_c_l71_c6_d4b3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_d4b3_left,
BIN_OP_AND_uxn_c_l71_c6_d4b3_right,
BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_ebbc
pending_controller_MUX_uxn_c_l71_c2_ebbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_ebbc_cond,
pending_controller_MUX_uxn_c_l71_c2_ebbc_iftrue,
pending_controller_MUX_uxn_c_l71_c2_ebbc_iffalse,
pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_3e54
BIN_OP_EQ_uxn_c_l75_c22_3e54 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_3e54_left,
BIN_OP_EQ_uxn_c_l75_c22_3e54_right,
BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output);

-- MUX_uxn_c_l75_c22_3d17
MUX_uxn_c_l75_c22_3d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_3d17_cond,
MUX_uxn_c_l75_c22_3d17_iftrue,
MUX_uxn_c_l75_c22_3d17_iffalse,
MUX_uxn_c_l75_c22_3d17_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_214a
BIN_OP_AND_uxn_c_l75_c6_214a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_214a_left,
BIN_OP_AND_uxn_c_l75_c6_214a_right,
BIN_OP_AND_uxn_c_l75_c6_214a_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_afe4
pending_frame_MUX_uxn_c_l75_c2_afe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_afe4_cond,
pending_frame_MUX_uxn_c_l75_c2_afe4_iftrue,
pending_frame_MUX_uxn_c_l75_c2_afe4_iffalse,
pending_frame_MUX_uxn_c_l75_c2_afe4_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_f2ba
BIN_OP_AND_uxn_c_l79_c33_f2ba : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_f2ba_left,
BIN_OP_AND_uxn_c_l79_c33_f2ba_right,
BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output);

-- MUX_uxn_c_l80_c54_badf
MUX_uxn_c_l80_c54_badf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_badf_cond,
MUX_uxn_c_l80_c54_badf_iftrue,
MUX_uxn_c_l80_c54_badf_iffalse,
MUX_uxn_c_l80_c54_badf_return_output);

-- MUX_uxn_c_l80_c21_ea6e
MUX_uxn_c_l80_c21_ea6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_ea6e_cond,
MUX_uxn_c_l80_c21_ea6e_iftrue,
MUX_uxn_c_l80_c21_ea6e_iffalse,
MUX_uxn_c_l80_c21_ea6e_return_output);

-- MUX_uxn_c_l80_c7_3c89
MUX_uxn_c_l80_c7_3c89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_3c89_cond,
MUX_uxn_c_l80_c7_3c89_iftrue,
MUX_uxn_c_l80_c7_3c89_iffalse,
MUX_uxn_c_l80_c7_3c89_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_6869
BIN_OP_OR_uxn_c_l81_c15_6869 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_6869_left,
BIN_OP_OR_uxn_c_l81_c15_6869_right,
BIN_OP_OR_uxn_c_l81_c15_6869_return_output);

-- MUX_uxn_c_l81_c15_542b
MUX_uxn_c_l81_c15_542b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_542b_cond,
MUX_uxn_c_l81_c15_542b_iftrue,
MUX_uxn_c_l81_c15_542b_iffalse,
MUX_uxn_c_l81_c15_542b_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_77e3
BIN_OP_EQ_uxn_c_l82_c23_77e3 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_77e3_left,
BIN_OP_EQ_uxn_c_l82_c23_77e3_right,
BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output);

-- MUX_uxn_c_l82_c23_7ac0
MUX_uxn_c_l82_c23_7ac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_7ac0_cond,
MUX_uxn_c_l82_c23_7ac0_iftrue,
MUX_uxn_c_l82_c23_7ac0_iffalse,
MUX_uxn_c_l82_c23_7ac0_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_c5e8
BIN_OP_EQ_uxn_c_l87_c6_c5e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_c5e8_left,
BIN_OP_EQ_uxn_c_l87_c6_c5e8_right,
BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_2ee9
is_ins_done_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_2ee9_cond,
is_ins_done_MUX_uxn_c_l87_c2_2ee9_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_2ee9_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output);

-- ins_MUX_uxn_c_l87_c2_2ee9
ins_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_2ee9_cond,
ins_MUX_uxn_c_l87_c2_2ee9_iftrue,
ins_MUX_uxn_c_l87_c2_2ee9_iffalse,
ins_MUX_uxn_c_l87_c2_2ee9_return_output);

-- pc_MUX_uxn_c_l87_c2_2ee9
pc_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_2ee9_cond,
pc_MUX_uxn_c_l87_c2_2ee9_iftrue,
pc_MUX_uxn_c_l87_c2_2ee9_iffalse,
pc_MUX_uxn_c_l87_c2_2ee9_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_2ee9
is_waiting_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_2ee9_cond,
is_waiting_MUX_uxn_c_l87_c2_2ee9_iftrue,
is_waiting_MUX_uxn_c_l87_c2_2ee9_iffalse,
is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_34c0
BIN_OP_EQ_uxn_c_l94_c11_34c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_34c0_left,
BIN_OP_EQ_uxn_c_l94_c11_34c0_right,
BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_7799
is_ins_done_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_7799_cond,
is_ins_done_MUX_uxn_c_l94_c7_7799_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_7799_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_7799_return_output);

-- ins_MUX_uxn_c_l94_c7_7799
ins_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_7799_cond,
ins_MUX_uxn_c_l94_c7_7799_iftrue,
ins_MUX_uxn_c_l94_c7_7799_iffalse,
ins_MUX_uxn_c_l94_c7_7799_return_output);

-- pc_MUX_uxn_c_l94_c7_7799
pc_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_7799_cond,
pc_MUX_uxn_c_l94_c7_7799_iftrue,
pc_MUX_uxn_c_l94_c7_7799_iffalse,
pc_MUX_uxn_c_l94_c7_7799_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_7799
is_waiting_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_7799_cond,
is_waiting_MUX_uxn_c_l94_c7_7799_iftrue,
is_waiting_MUX_uxn_c_l94_c7_7799_iffalse,
is_waiting_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_b535
BIN_OP_PLUS_uxn_c_l95_c3_b535 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_b535_left,
BIN_OP_PLUS_uxn_c_l95_c3_b535_right,
BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_4472
BIN_OP_EQ_uxn_c_l98_c9_4472 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_4472_left,
BIN_OP_EQ_uxn_c_l98_c9_4472_right,
BIN_OP_EQ_uxn_c_l98_c9_4472_return_output);

-- MUX_uxn_c_l98_c9_c7bf
MUX_uxn_c_l98_c9_c7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_c7bf_cond,
MUX_uxn_c_l98_c9_c7bf_iftrue,
MUX_uxn_c_l98_c9_c7bf_iffalse,
MUX_uxn_c_l98_c9_c7bf_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_e95f
BIN_OP_MINUS_uxn_c_l99_c64_e95f : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_e95f_left,
BIN_OP_MINUS_uxn_c_l99_c64_e95f_right,
BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_6485
eval_opcode_phased_uxn_c_l99_c45_6485 : entity work.eval_opcode_phased_0CLK_2c5e0aa0 port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_6485_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_6485_phase,
eval_opcode_phased_uxn_c_l99_c45_6485_ins,
eval_opcode_phased_uxn_c_l99_c45_6485_pc,
eval_opcode_phased_uxn_c_l99_c45_6485_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_6485_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_6485_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_6485_return_output);

-- MUX_uxn_c_l100_c8_90cf
MUX_uxn_c_l100_c8_90cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_90cf_cond,
MUX_uxn_c_l100_c8_90cf_iftrue,
MUX_uxn_c_l100_c8_90cf_iffalse,
MUX_uxn_c_l100_c8_90cf_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_fc65
BIN_OP_OR_uxn_c_l112_c6_fc65 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_fc65_left,
BIN_OP_OR_uxn_c_l112_c6_fc65_right,
BIN_OP_OR_uxn_c_l112_c6_fc65_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_1c4a
step_cpu_phase_MUX_uxn_c_l112_c2_1c4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_5fc5
BIN_OP_EQ_uxn_c_l115_c21_5fc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_5fc5_left,
BIN_OP_EQ_uxn_c_l115_c21_5fc5_right,
BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_bd6a
BIN_OP_PLUS_uxn_c_l115_c44_bd6a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_bd6a_left,
BIN_OP_PLUS_uxn_c_l115_c44_bd6a_right,
BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output);

-- MUX_uxn_c_l115_c21_d734
MUX_uxn_c_l115_c21_d734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_d734_cond,
MUX_uxn_c_l115_c21_d734_iftrue,
MUX_uxn_c_l115_c21_d734_iffalse,
MUX_uxn_c_l115_c21_d734_return_output);



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
 BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output,
 BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output,
 pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output,
 MUX_uxn_c_l75_c22_3d17_return_output,
 BIN_OP_AND_uxn_c_l75_c6_214a_return_output,
 pending_frame_MUX_uxn_c_l75_c2_afe4_return_output,
 BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output,
 MUX_uxn_c_l80_c54_badf_return_output,
 MUX_uxn_c_l80_c21_ea6e_return_output,
 MUX_uxn_c_l80_c7_3c89_return_output,
 BIN_OP_OR_uxn_c_l81_c15_6869_return_output,
 MUX_uxn_c_l81_c15_542b_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output,
 MUX_uxn_c_l82_c23_7ac0_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output,
 ins_MUX_uxn_c_l87_c2_2ee9_return_output,
 pc_MUX_uxn_c_l87_c2_2ee9_return_output,
 is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_7799_return_output,
 ins_MUX_uxn_c_l94_c7_7799_return_output,
 pc_MUX_uxn_c_l94_c7_7799_return_output,
 is_waiting_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_4472_return_output,
 MUX_uxn_c_l98_c9_c7bf_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output,
 eval_opcode_phased_uxn_c_l99_c45_6485_return_output,
 MUX_uxn_c_l100_c8_90cf_return_output,
 BIN_OP_OR_uxn_c_l112_c6_fc65_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output,
 MUX_uxn_c_l115_c21_d734_return_output)
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
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_aca6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_214a_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_3d17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_bfdf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_3d17_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_3d17_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_3d17_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_214a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_214a_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3c89_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3c89_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3c89_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_ea6e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_ea6e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_ea6e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_badf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_badf_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_badf_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_badf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_ea6e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3c89_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_542b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_6869_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_6869_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_6869_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_542b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_542b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_542b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_7ac0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_7ac0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_7ac0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_7ac0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_7799_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_7799_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_0dd2 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_7799_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c7bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c7bf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c7bf_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c7bf_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_90cf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_1a71_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_90cf_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_90cf_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_90cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_a69a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_8b88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_697a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_93ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_d54e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_8947_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_f096_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_e68a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_3737 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_d734_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_a910_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_d734_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_d734_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_d734_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5cc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_c537_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_0522_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_6376_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb_uxn_c_l118_l63_DUPLICATE_04d5_return_output : cpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_step_cpu_phase : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l82_c23_7ac0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l81_c15_542b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_right := to_unsigned(1, 1);
     VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l115_c21_d734_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_right := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iftrue := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l75_c22_3d17_iffalse := to_unsigned(1, 1);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_iffalse := pending_frame;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_right := to_unsigned(2, 2);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l113_c3_3737 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_3737;
     VAR_MUX_uxn_c_l75_c22_3d17_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_badf_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_c7bf_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_2ee9_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_7799_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_214a_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_3c89_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_542b_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_badf_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_3c89_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_c7bf_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_ea6e_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_left := step_cpu_phase;
     -- BIN_OP_MINUS[uxn_c_l99_c64_e95f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_e95f_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_left;
     BIN_OP_MINUS_uxn_c_l99_c64_e95f_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output := BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_0522 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_0522_return_output := cpu_step_result.u8_value;

     -- BIN_OP_EQ[uxn_c_l87_c6_c5e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_c5e8_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_left;
     BIN_OP_EQ_uxn_c_l87_c6_c5e8_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output := BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5cc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5cc3_return_output := cpu_step_result.vram_write_layer;

     -- BIN_OP_PLUS[uxn_c_l115_c44_bd6a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_bd6a_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_left;
     BIN_OP_PLUS_uxn_c_l115_c44_bd6a_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output := BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_7799] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_7799_return_output := cpu_step_result.u16_addr;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_7799] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_7799_return_output := cpu_step_result.is_ram_write;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_7799] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_7799_return_output := cpu_step_result.is_vram_write;

     -- uint16_15_8[uxn_c_l75_c22_bfdf] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_bfdf_return_output := uint16_15_8(
     VAR_screen_vector);

     -- BIN_OP_EQ[uxn_c_l98_c9_4472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_4472_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_left;
     BIN_OP_EQ_uxn_c_l98_c9_4472_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_return_output := BIN_OP_EQ_uxn_c_l98_c9_4472_return_output;

     -- uint16_15_8[uxn_c_l71_c49_aca6] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_aca6_return_output := uint16_15_8(
     VAR_controller_vector);

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_7799] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_7799_return_output := cpu_step_result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_c537 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_c537_return_output := cpu_step_result.device_ram_address;

     -- BIN_OP_EQ[uxn_c_l94_c11_34c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_34c0_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_left;
     BIN_OP_EQ_uxn_c_l94_c11_34c0_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output := BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c6_386f] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_386f_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_left;
     BIN_OP_NEQ_uxn_c_l71_c6_386f_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output := BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_2ee9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_c5e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_7799_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_34c0_return_output;
     VAR_MUX_uxn_c_l98_c9_c7bf_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_4472_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_e95f_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_386f_return_output;
     VAR_MUX_uxn_c_l115_c21_d734_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_bd6a_return_output, 8);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5cc3_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5cc3_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_c537_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_c537_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_0522_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_0522_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_7799_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_left := VAR_uint16_15_8_uxn_c_l71_c49_aca6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_left := VAR_uint16_15_8_uxn_c_l75_c22_bfdf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c49_c584] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_c584_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_left;
     BIN_OP_NEQ_uxn_c_l71_c49_c584_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output := BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_3e54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_3e54_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_left;
     BIN_OP_EQ_uxn_c_l75_c22_3e54_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output := BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output;

     -- MUX[uxn_c_l98_c9_c7bf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_c7bf_cond <= VAR_MUX_uxn_c_l98_c9_c7bf_cond;
     MUX_uxn_c_l98_c9_c7bf_iftrue <= VAR_MUX_uxn_c_l98_c9_c7bf_iftrue;
     MUX_uxn_c_l98_c9_c7bf_iffalse <= VAR_MUX_uxn_c_l98_c9_c7bf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_c7bf_return_output := MUX_uxn_c_l98_c9_c7bf_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_3d17_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_3e54_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_c584_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_ins := VAR_MUX_uxn_c_l98_c9_c7bf_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_7799_iffalse := VAR_MUX_uxn_c_l98_c9_c7bf_return_output;
     -- BIN_OP_AND[uxn_c_l71_c6_d4b3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_d4b3_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_left;
     BIN_OP_AND_uxn_c_l71_c6_d4b3_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output := BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output;

     -- ins_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_7799_cond <= VAR_ins_MUX_uxn_c_l94_c7_7799_cond;
     ins_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_7799_iftrue;
     ins_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_7799_return_output := ins_MUX_uxn_c_l94_c7_7799_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_835f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output;

     -- MUX[uxn_c_l75_c22_3d17] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_3d17_cond <= VAR_MUX_uxn_c_l75_c22_3d17_cond;
     MUX_uxn_c_l75_c22_3d17_iftrue <= VAR_MUX_uxn_c_l75_c22_3d17_iftrue;
     MUX_uxn_c_l75_c22_3d17_iffalse <= VAR_MUX_uxn_c_l75_c22_3d17_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_3d17_return_output := MUX_uxn_c_l75_c22_3d17_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_d4b3_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_835f_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_214a_right := VAR_MUX_uxn_c_l75_c22_3d17_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_ins_MUX_uxn_c_l94_c7_7799_return_output;
     -- ins_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_ins_MUX_uxn_c_l87_c2_2ee9_cond;
     ins_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_2ee9_iftrue;
     ins_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_2ee9_return_output := ins_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- pending_controller_MUX[uxn_c_l71_c2_ebbc] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_ebbc_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_cond;
     pending_controller_MUX_uxn_c_l71_c2_ebbc_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_ebbc_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output := pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output;

     -- BIN_OP_AND[uxn_c_l75_c6_214a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_214a_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_214a_left;
     BIN_OP_AND_uxn_c_l75_c6_214a_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_214a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_214a_return_output := BIN_OP_AND_uxn_c_l75_c6_214a_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_214a_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_2ee9_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_6869_right := VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output;
     VAR_MUX_uxn_c_l80_c54_badf_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output;
     VAR_MUX_uxn_c_l82_c23_7ac0_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_ebbc_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_afe4] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_afe4_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_cond;
     pending_frame_MUX_uxn_c_l75_c2_afe4_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_afe4_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_return_output := pending_frame_MUX_uxn_c_l75_c2_afe4_return_output;

     -- MUX[uxn_c_l80_c54_badf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_badf_cond <= VAR_MUX_uxn_c_l80_c54_badf_cond;
     MUX_uxn_c_l80_c54_badf_iftrue <= VAR_MUX_uxn_c_l80_c54_badf_iftrue;
     MUX_uxn_c_l80_c54_badf_iffalse <= VAR_MUX_uxn_c_l80_c54_badf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_badf_return_output := MUX_uxn_c_l80_c54_badf_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_ea6e_iffalse := VAR_MUX_uxn_c_l80_c54_badf_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_left := VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_6869_left := VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_return_output;
     VAR_MUX_uxn_c_l80_c21_ea6e_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_afe4_return_output;
     -- BIN_OP_OR[uxn_c_l81_c15_6869] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_6869_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_6869_left;
     BIN_OP_OR_uxn_c_l81_c15_6869_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_6869_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_6869_return_output := BIN_OP_OR_uxn_c_l81_c15_6869_return_output;

     -- BIN_OP_AND[uxn_c_l79_c33_f2ba] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_f2ba_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_left;
     BIN_OP_AND_uxn_c_l79_c33_f2ba_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output := BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output;

     -- MUX[uxn_c_l80_c21_ea6e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_ea6e_cond <= VAR_MUX_uxn_c_l80_c21_ea6e_cond;
     MUX_uxn_c_l80_c21_ea6e_iftrue <= VAR_MUX_uxn_c_l80_c21_ea6e_iftrue;
     MUX_uxn_c_l80_c21_ea6e_iffalse <= VAR_MUX_uxn_c_l80_c21_ea6e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_ea6e_return_output := MUX_uxn_c_l80_c21_ea6e_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_542b_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_6869_return_output;
     VAR_MUX_uxn_c_l80_c7_3c89_iftrue := VAR_MUX_uxn_c_l80_c21_ea6e_return_output;
     -- MUX[uxn_c_l81_c15_542b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_542b_cond <= VAR_MUX_uxn_c_l81_c15_542b_cond;
     MUX_uxn_c_l81_c15_542b_iftrue <= VAR_MUX_uxn_c_l81_c15_542b_iftrue;
     MUX_uxn_c_l81_c15_542b_iffalse <= VAR_MUX_uxn_c_l81_c15_542b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_542b_return_output := MUX_uxn_c_l81_c15_542b_return_output;

     -- MUX[uxn_c_l80_c7_3c89] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_3c89_cond <= VAR_MUX_uxn_c_l80_c7_3c89_cond;
     MUX_uxn_c_l80_c7_3c89_iftrue <= VAR_MUX_uxn_c_l80_c7_3c89_iftrue;
     MUX_uxn_c_l80_c7_3c89_iffalse <= VAR_MUX_uxn_c_l80_c7_3c89_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_3c89_return_output := MUX_uxn_c_l80_c7_3c89_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_left := VAR_MUX_uxn_c_l80_c7_3c89_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_left := VAR_MUX_uxn_c_l80_c7_3c89_return_output;
     VAR_MUX_uxn_c_l100_c8_90cf_iffalse := VAR_MUX_uxn_c_l80_c7_3c89_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iftrue := VAR_MUX_uxn_c_l80_c7_3c89_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_pc := VAR_MUX_uxn_c_l80_c7_3c89_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_2ee9_iftrue := VAR_MUX_uxn_c_l80_c7_3c89_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_iftrue := VAR_MUX_uxn_c_l81_c15_542b_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_7799_iftrue := VAR_MUX_uxn_c_l81_c15_542b_return_output;
     -- BIN_OP_EQ[uxn_c_l82_c23_77e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_77e3_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_left;
     BIN_OP_EQ_uxn_c_l82_c23_77e3_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output := BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_b535] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_b535_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_left;
     BIN_OP_PLUS_uxn_c_l95_c3_b535_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output := BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output;

     -- eval_opcode_phased[uxn_c_l99_c45_6485] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_6485_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_6485_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_phase;
     eval_opcode_phased_uxn_c_l99_c45_6485_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_ins;
     eval_opcode_phased_uxn_c_l99_c45_6485_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_pc;
     eval_opcode_phased_uxn_c_l99_c45_6485_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_6485_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_6485_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_6485_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output := eval_opcode_phased_uxn_c_l99_c45_6485_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_7ac0_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_77e3_return_output;
     VAR_pc_uxn_c_l95_c3_0dd2 := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_b535_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_7799_iftrue := VAR_pc_uxn_c_l95_c3_0dd2;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_e68a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_e68a_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_6376 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_6376_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.u16_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_93ff] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_93ff_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.device_ram_address;

     -- MUX[uxn_c_l82_c23_7ac0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_7ac0_cond <= VAR_MUX_uxn_c_l82_c23_7ac0_cond;
     MUX_uxn_c_l82_c23_7ac0_iftrue <= VAR_MUX_uxn_c_l82_c23_7ac0_iftrue;
     MUX_uxn_c_l82_c23_7ac0_iffalse <= VAR_MUX_uxn_c_l82_c23_7ac0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_7ac0_return_output := MUX_uxn_c_l82_c23_7ac0_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_1a71] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_1a71_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_8947] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_8947_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_8b88] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_8b88_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_f096] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_f096_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_697a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_697a_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_a69a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_a69a_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_d54e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_d54e_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_6485_return_output.is_device_ram_write;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_90cf_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_6376_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_6376_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_d54e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_e68a_return_output;
     VAR_MUX_uxn_c_l100_c8_90cf_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_1a71_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_a69a_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_8b88_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_f096_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_697a_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_93ff_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_8947_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_7ac0_return_output;
     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output;

     -- MUX[uxn_c_l100_c8_90cf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_90cf_cond <= VAR_MUX_uxn_c_l100_c8_90cf_cond;
     MUX_uxn_c_l100_c8_90cf_iftrue <= VAR_MUX_uxn_c_l100_c8_90cf_iftrue;
     MUX_uxn_c_l100_c8_90cf_iffalse <= VAR_MUX_uxn_c_l100_c8_90cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_90cf_return_output := MUX_uxn_c_l100_c8_90cf_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_7799_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_cond;
     is_ins_done_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_return_output := is_ins_done_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_7799_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_7799_cond;
     is_waiting_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_7799_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_7799_return_output := is_waiting_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_7799_iffalse := VAR_MUX_uxn_c_l100_c8_90cf_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_7799_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_7799_return_output;
     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- is_ins_done_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_cond;
     is_ins_done_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output := is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- pc_MUX[uxn_c_l94_c7_7799] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_7799_cond <= VAR_pc_MUX_uxn_c_l94_c7_7799_cond;
     pc_MUX_uxn_c_l94_c7_7799_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_7799_iftrue;
     pc_MUX_uxn_c_l94_c7_7799_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_7799_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_7799_return_output := pc_MUX_uxn_c_l94_c7_7799_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_cond;
     is_waiting_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output := is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_2ee9_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_right := VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_2ee9_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_2ee9_iffalse := VAR_pc_MUX_uxn_c_l94_c7_7799_return_output;
     -- pc_MUX[uxn_c_l87_c2_2ee9] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_2ee9_cond <= VAR_pc_MUX_uxn_c_l87_c2_2ee9_cond;
     pc_MUX_uxn_c_l87_c2_2ee9_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_2ee9_iftrue;
     pc_MUX_uxn_c_l87_c2_2ee9_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_2ee9_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_2ee9_return_output := pc_MUX_uxn_c_l87_c2_2ee9_return_output;

     -- BIN_OP_OR[uxn_c_l112_c6_fc65] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_fc65_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_left;
     BIN_OP_OR_uxn_c_l112_c6_fc65_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_return_output := BIN_OP_OR_uxn_c_l112_c6_fc65_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb_uxn_c_l118_l63_DUPLICATE_04d5 LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb_uxn_c_l118_l63_DUPLICATE_04d5_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb(
     VAR_BIN_OP_AND_uxn_c_l79_c33_f2ba_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_2ee9_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_2ee9_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_2ee9_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_2ee9_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_2ee9_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_2ee9_return_output);

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_fc65_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb_uxn_c_l118_l63_DUPLICATE_04d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_63bb_uxn_c_l118_l63_DUPLICATE_04d5_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_2ee9_return_output;
     -- uint16_15_8[uxn_c_l115_c21_a910] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_a910_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_2ee9_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_left := VAR_uint16_15_8_uxn_c_l115_c21_a910_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_5fc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_5fc5_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_left;
     BIN_OP_EQ_uxn_c_l115_c21_5fc5_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output := BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_d734_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_5fc5_return_output;
     -- MUX[uxn_c_l115_c21_d734] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_d734_cond <= VAR_MUX_uxn_c_l115_c21_d734_cond;
     MUX_uxn_c_l115_c21_d734_iftrue <= VAR_MUX_uxn_c_l115_c21_d734_iftrue;
     MUX_uxn_c_l115_c21_d734_iffalse <= VAR_MUX_uxn_c_l115_c21_d734_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_d734_return_output := MUX_uxn_c_l115_c21_d734_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iffalse := VAR_MUX_uxn_c_l115_c21_d734_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_1c4a] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_1c4a_return_output;
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
