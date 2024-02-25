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
entity step_cpu_0CLK_1e2d679b is
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
end step_cpu_0CLK_1e2d679b;
architecture arch of step_cpu_0CLK_1e2d679b is
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
-- BIN_OP_NEQ[uxn_c_l71_c6_7f61]
signal BIN_OP_NEQ_uxn_c_l71_c6_7f61_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_7f61_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_78eb]
signal BIN_OP_NEQ_uxn_c_l71_c49_78eb_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_78eb_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_6b93]
signal BIN_OP_AND_uxn_c_l71_c6_6b93_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_6b93_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_6b93_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_ff7d]
signal pending_controller_MUX_uxn_c_l71_c2_ff7d_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_ff7d_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_ff7d_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_f47e]
signal BIN_OP_EQ_uxn_c_l75_c22_f47e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_f47e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_f61e]
signal MUX_uxn_c_l75_c22_f61e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_f61e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_f61e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_f61e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_34c8]
signal BIN_OP_AND_uxn_c_l75_c6_34c8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_34c8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_34c8_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_613d]
signal pending_frame_MUX_uxn_c_l75_c2_613d_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_613d_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_613d_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_613d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_4647]
signal BIN_OP_AND_uxn_c_l79_c33_4647_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_4647_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_4647_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_4c25]
signal MUX_uxn_c_l80_c54_4c25_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_4c25_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_4c25_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_4c25_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_2700]
signal MUX_uxn_c_l80_c21_2700_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_2700_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_2700_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_2700_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_3dad]
signal MUX_uxn_c_l80_c7_3dad_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_3dad_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_3dad_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_3dad_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_d7dd]
signal BIN_OP_OR_uxn_c_l81_c15_d7dd_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_d7dd_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_06f8]
signal MUX_uxn_c_l81_c15_06f8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_06f8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_06f8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_06f8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_fabb]
signal BIN_OP_EQ_uxn_c_l82_c23_fabb_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_fabb_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_76bb]
signal MUX_uxn_c_l82_c23_76bb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_76bb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_76bb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_76bb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_fdcc]
signal BIN_OP_EQ_uxn_c_l87_c6_fdcc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_fdcc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_b7c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_5de9]
signal is_ins_done_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(7 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_5de9]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l87_c2_5de9]
signal pc_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l87_c2_5de9]
signal ins_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_5de9]
signal is_waiting_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_461c]
signal BIN_OP_EQ_uxn_c_l94_c11_461c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_461c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_461c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_378f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_b7c5]
signal is_ins_done_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(7 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_b7c5]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l94_c7_b7c5]
signal pc_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l94_c7_b7c5]
signal ins_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_b7c5]
signal is_waiting_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_dc2e]
signal BIN_OP_PLUS_uxn_c_l95_c3_dc2e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_dc2e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_dc1d]
signal BIN_OP_EQ_uxn_c_l98_c9_dc1d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_dc1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_c255]
signal MUX_uxn_c_l98_c9_c255_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_c255_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_c255_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_c255_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_56d6]
signal BIN_OP_MINUS_uxn_c_l99_c64_56d6_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_56d6_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output : unsigned(11 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_1cc8]
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_phase : unsigned(11 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_bf37]
signal MUX_uxn_c_l100_c8_bf37_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_bf37_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_bf37_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_bf37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_8ce0]
signal BIN_OP_OR_uxn_c_l112_c6_8ce0_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_8ce0_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_7a2a]
signal step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iftrue : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iffalse : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_a618]
signal BIN_OP_EQ_uxn_c_l115_c21_a618_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_a618_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_a618_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_4853]
signal BIN_OP_PLUS_uxn_c_l115_c44_4853_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_4853_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output : unsigned(12 downto 0);

-- MUX[uxn_c_l115_c21_312a]
signal MUX_uxn_c_l115_c21_312a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_312a_iftrue : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_312a_iffalse : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_312a_return_output : unsigned(11 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8( ref_toks_0 : unsigned;
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
      base.is_vram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_7f61
BIN_OP_NEQ_uxn_c_l71_c6_7f61 : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_7f61_left,
BIN_OP_NEQ_uxn_c_l71_c6_7f61_right,
BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_78eb
BIN_OP_NEQ_uxn_c_l71_c49_78eb : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_78eb_left,
BIN_OP_NEQ_uxn_c_l71_c49_78eb_right,
BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_6b93
BIN_OP_AND_uxn_c_l71_c6_6b93 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_6b93_left,
BIN_OP_AND_uxn_c_l71_c6_6b93_right,
BIN_OP_AND_uxn_c_l71_c6_6b93_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_ff7d
pending_controller_MUX_uxn_c_l71_c2_ff7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_ff7d_cond,
pending_controller_MUX_uxn_c_l71_c2_ff7d_iftrue,
pending_controller_MUX_uxn_c_l71_c2_ff7d_iffalse,
pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_f47e
BIN_OP_EQ_uxn_c_l75_c22_f47e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_f47e_left,
BIN_OP_EQ_uxn_c_l75_c22_f47e_right,
BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output);

-- MUX_uxn_c_l75_c22_f61e
MUX_uxn_c_l75_c22_f61e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_f61e_cond,
MUX_uxn_c_l75_c22_f61e_iftrue,
MUX_uxn_c_l75_c22_f61e_iffalse,
MUX_uxn_c_l75_c22_f61e_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_34c8
BIN_OP_AND_uxn_c_l75_c6_34c8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_34c8_left,
BIN_OP_AND_uxn_c_l75_c6_34c8_right,
BIN_OP_AND_uxn_c_l75_c6_34c8_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_613d
pending_frame_MUX_uxn_c_l75_c2_613d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_613d_cond,
pending_frame_MUX_uxn_c_l75_c2_613d_iftrue,
pending_frame_MUX_uxn_c_l75_c2_613d_iffalse,
pending_frame_MUX_uxn_c_l75_c2_613d_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_4647
BIN_OP_AND_uxn_c_l79_c33_4647 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_4647_left,
BIN_OP_AND_uxn_c_l79_c33_4647_right,
BIN_OP_AND_uxn_c_l79_c33_4647_return_output);

-- MUX_uxn_c_l80_c54_4c25
MUX_uxn_c_l80_c54_4c25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_4c25_cond,
MUX_uxn_c_l80_c54_4c25_iftrue,
MUX_uxn_c_l80_c54_4c25_iffalse,
MUX_uxn_c_l80_c54_4c25_return_output);

-- MUX_uxn_c_l80_c21_2700
MUX_uxn_c_l80_c21_2700 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_2700_cond,
MUX_uxn_c_l80_c21_2700_iftrue,
MUX_uxn_c_l80_c21_2700_iffalse,
MUX_uxn_c_l80_c21_2700_return_output);

-- MUX_uxn_c_l80_c7_3dad
MUX_uxn_c_l80_c7_3dad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_3dad_cond,
MUX_uxn_c_l80_c7_3dad_iftrue,
MUX_uxn_c_l80_c7_3dad_iffalse,
MUX_uxn_c_l80_c7_3dad_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_d7dd
BIN_OP_OR_uxn_c_l81_c15_d7dd : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_d7dd_left,
BIN_OP_OR_uxn_c_l81_c15_d7dd_right,
BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output);

-- MUX_uxn_c_l81_c15_06f8
MUX_uxn_c_l81_c15_06f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_06f8_cond,
MUX_uxn_c_l81_c15_06f8_iftrue,
MUX_uxn_c_l81_c15_06f8_iffalse,
MUX_uxn_c_l81_c15_06f8_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_fabb
BIN_OP_EQ_uxn_c_l82_c23_fabb : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_fabb_left,
BIN_OP_EQ_uxn_c_l82_c23_fabb_right,
BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output);

-- MUX_uxn_c_l82_c23_76bb
MUX_uxn_c_l82_c23_76bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_76bb_cond,
MUX_uxn_c_l82_c23_76bb_iftrue,
MUX_uxn_c_l82_c23_76bb_iffalse,
MUX_uxn_c_l82_c23_76bb_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_fdcc
BIN_OP_EQ_uxn_c_l87_c6_fdcc : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_fdcc_left,
BIN_OP_EQ_uxn_c_l87_c6_fdcc_right,
BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_5de9
is_ins_done_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_5de9_cond,
is_ins_done_MUX_uxn_c_l87_c2_5de9_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_5de9_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output);

-- pc_MUX_uxn_c_l87_c2_5de9
pc_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_5de9_cond,
pc_MUX_uxn_c_l87_c2_5de9_iftrue,
pc_MUX_uxn_c_l87_c2_5de9_iffalse,
pc_MUX_uxn_c_l87_c2_5de9_return_output);

-- ins_MUX_uxn_c_l87_c2_5de9
ins_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_5de9_cond,
ins_MUX_uxn_c_l87_c2_5de9_iftrue,
ins_MUX_uxn_c_l87_c2_5de9_iffalse,
ins_MUX_uxn_c_l87_c2_5de9_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_5de9
is_waiting_MUX_uxn_c_l87_c2_5de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_5de9_cond,
is_waiting_MUX_uxn_c_l87_c2_5de9_iftrue,
is_waiting_MUX_uxn_c_l87_c2_5de9_iffalse,
is_waiting_MUX_uxn_c_l87_c2_5de9_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_461c
BIN_OP_EQ_uxn_c_l94_c11_461c : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_461c_left,
BIN_OP_EQ_uxn_c_l94_c11_461c_right,
BIN_OP_EQ_uxn_c_l94_c11_461c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_b7c5
is_ins_done_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_b7c5_cond,
is_ins_done_MUX_uxn_c_l94_c7_b7c5_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_b7c5_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output);

-- pc_MUX_uxn_c_l94_c7_b7c5
pc_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_b7c5_cond,
pc_MUX_uxn_c_l94_c7_b7c5_iftrue,
pc_MUX_uxn_c_l94_c7_b7c5_iffalse,
pc_MUX_uxn_c_l94_c7_b7c5_return_output);

-- ins_MUX_uxn_c_l94_c7_b7c5
ins_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_b7c5_cond,
ins_MUX_uxn_c_l94_c7_b7c5_iftrue,
ins_MUX_uxn_c_l94_c7_b7c5_iffalse,
ins_MUX_uxn_c_l94_c7_b7c5_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_b7c5
is_waiting_MUX_uxn_c_l94_c7_b7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_b7c5_cond,
is_waiting_MUX_uxn_c_l94_c7_b7c5_iftrue,
is_waiting_MUX_uxn_c_l94_c7_b7c5_iffalse,
is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_dc2e
BIN_OP_PLUS_uxn_c_l95_c3_dc2e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_dc2e_left,
BIN_OP_PLUS_uxn_c_l95_c3_dc2e_right,
BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_dc1d
BIN_OP_EQ_uxn_c_l98_c9_dc1d : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_dc1d_left,
BIN_OP_EQ_uxn_c_l98_c9_dc1d_right,
BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output);

-- MUX_uxn_c_l98_c9_c255
MUX_uxn_c_l98_c9_c255 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_c255_cond,
MUX_uxn_c_l98_c9_c255_iftrue,
MUX_uxn_c_l98_c9_c255_iffalse,
MUX_uxn_c_l98_c9_c255_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_56d6
BIN_OP_MINUS_uxn_c_l99_c64_56d6 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_56d6_left,
BIN_OP_MINUS_uxn_c_l99_c64_56d6_right,
BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_1cc8
eval_opcode_phased_uxn_c_l99_c45_1cc8 : entity work.eval_opcode_phased_0CLK_0f98f30e port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_1cc8_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_1cc8_phase,
eval_opcode_phased_uxn_c_l99_c45_1cc8_ins,
eval_opcode_phased_uxn_c_l99_c45_1cc8_pc,
eval_opcode_phased_uxn_c_l99_c45_1cc8_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output);

-- MUX_uxn_c_l100_c8_bf37
MUX_uxn_c_l100_c8_bf37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_bf37_cond,
MUX_uxn_c_l100_c8_bf37_iftrue,
MUX_uxn_c_l100_c8_bf37_iffalse,
MUX_uxn_c_l100_c8_bf37_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_8ce0
BIN_OP_OR_uxn_c_l112_c6_8ce0 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_8ce0_left,
BIN_OP_OR_uxn_c_l112_c6_8ce0_right,
BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_7a2a
step_cpu_phase_MUX_uxn_c_l112_c2_7a2a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_a618
BIN_OP_EQ_uxn_c_l115_c21_a618 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_a618_left,
BIN_OP_EQ_uxn_c_l115_c21_a618_right,
BIN_OP_EQ_uxn_c_l115_c21_a618_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_4853
BIN_OP_PLUS_uxn_c_l115_c44_4853 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_4853_left,
BIN_OP_PLUS_uxn_c_l115_c44_4853_right,
BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output);

-- MUX_uxn_c_l115_c21_312a
MUX_uxn_c_l115_c21_312a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_312a_cond,
MUX_uxn_c_l115_c21_312a_iftrue,
MUX_uxn_c_l115_c21_312a_iffalse,
MUX_uxn_c_l115_c21_312a_return_output);



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
 BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output,
 BIN_OP_AND_uxn_c_l71_c6_6b93_return_output,
 pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output,
 MUX_uxn_c_l75_c22_f61e_return_output,
 BIN_OP_AND_uxn_c_l75_c6_34c8_return_output,
 pending_frame_MUX_uxn_c_l75_c2_613d_return_output,
 BIN_OP_AND_uxn_c_l79_c33_4647_return_output,
 MUX_uxn_c_l80_c54_4c25_return_output,
 MUX_uxn_c_l80_c21_2700_return_output,
 MUX_uxn_c_l80_c7_3dad_return_output,
 BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output,
 MUX_uxn_c_l81_c15_06f8_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output,
 MUX_uxn_c_l82_c23_76bb_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output,
 pc_MUX_uxn_c_l87_c2_5de9_return_output,
 ins_MUX_uxn_c_l87_c2_5de9_return_output,
 is_waiting_MUX_uxn_c_l87_c2_5de9_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_461c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output,
 pc_MUX_uxn_c_l94_c7_b7c5_return_output,
 ins_MUX_uxn_c_l94_c7_b7c5_return_output,
 is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output,
 MUX_uxn_c_l98_c9_c255_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output,
 eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output,
 MUX_uxn_c_l100_c8_bf37_return_output,
 BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_a618_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output,
 MUX_uxn_c_l115_c21_312a_return_output)
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
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_1d0b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_f61e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_872b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_f61e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_f61e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_f61e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_613d_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_613d_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_613d_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_613d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_4647_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_4647_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_4647_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3dad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3dad_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3dad_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_2700_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_2700_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_2700_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_4c25_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_4c25_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_4c25_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_4c25_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_2700_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_3dad_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_06f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_06f8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_06f8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_06f8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_76bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_76bb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_76bb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_76bb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_b7c5_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_6895 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c255_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c255_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c255_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_c255_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_phase : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_bf37_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_8779_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_bf37_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_bf37_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_bf37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_5ebd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_5eaf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_dea4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_63e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_39ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_92bd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_f7a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_55e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iftrue : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_7389 : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iffalse : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_312a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_aa94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_312a_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_312a_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_312a_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_21b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_0b8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5c98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_4d3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8_uxn_c_l63_l118_DUPLICATE_f420_return_output : cpu_step_result_t;
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
     VAR_MUX_uxn_c_l82_c23_76bb_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l81_c15_06f8_iftrue := to_unsigned(0, 1);
     VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l75_c22_f61e_iftrue := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_613d_iftrue := to_unsigned(1, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l75_c22_f61e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l113_c3_7389 := resize(to_unsigned(0, 1), 12);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_7389;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_right := to_unsigned(1, 1);
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l115_c21_312a_iftrue := resize(to_unsigned(0, 1), 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iftrue := to_unsigned(0, 1);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_613d_iffalse := pending_frame;
     VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_4c25_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_c255_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_5de9_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_b7c5_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_4647_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_3dad_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_06f8_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_4c25_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_3dad_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_c255_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_2700_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_left := step_cpu_phase;
     -- BIN_OP_EQ[uxn_c_l94_c11_461c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_461c_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_left;
     BIN_OP_EQ_uxn_c_l94_c11_461c_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output := BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;

     -- BIN_OP_PLUS[uxn_c_l115_c44_4853] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_4853_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_left;
     BIN_OP_PLUS_uxn_c_l115_c44_4853_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output := BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_0b8c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_0b8c_return_output := cpu_step_result.u8_value;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_b7c5] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_b7c5_return_output := cpu_step_result.is_vram_write;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_b7c5] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_b7c5_return_output := cpu_step_result.u16_addr;

     -- BIN_OP_EQ[uxn_c_l98_c9_dc1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_dc1d_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_left;
     BIN_OP_EQ_uxn_c_l98_c9_dc1d_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output := BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c6_7f61] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_7f61_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_left;
     BIN_OP_NEQ_uxn_c_l71_c6_7f61_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output := BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output;

     -- BIN_OP_EQ[uxn_c_l87_c6_fdcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_fdcc_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_left;
     BIN_OP_EQ_uxn_c_l87_c6_fdcc_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output := BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_b7c5] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_b7c5_return_output := cpu_step_result.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_21b6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_21b6_return_output := cpu_step_result.device_ram_address;

     -- uint16_15_8[uxn_c_l71_c49_1d0b] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_1d0b_return_output := uint16_15_8(
     VAR_controller_vector);

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_b7c5] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_b7c5_return_output := cpu_step_result.is_device_ram_write;

     -- uint16_15_8[uxn_c_l75_c22_872b] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_872b_return_output := uint16_15_8(
     VAR_screen_vector);

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5c98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5c98_return_output := cpu_step_result.vram_write_layer;

     -- BIN_OP_MINUS[uxn_c_l99_c64_56d6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_56d6_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_left;
     BIN_OP_MINUS_uxn_c_l99_c64_56d6_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output := BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_5de9_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_fdcc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_b7c5_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_461c_return_output;
     VAR_MUX_uxn_c_l98_c9_c255_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_dc1d_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_56d6_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_7f61_return_output;
     VAR_MUX_uxn_c_l115_c21_312a_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_4853_return_output, 12);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5c98_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_5c98_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_21b6_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_21b6_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_0b8c_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_0b8c_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_b7c5_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_left := VAR_uint16_15_8_uxn_c_l71_c49_1d0b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_left := VAR_uint16_15_8_uxn_c_l75_c22_872b_return_output;
     -- MUX[uxn_c_l98_c9_c255] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_c255_cond <= VAR_MUX_uxn_c_l98_c9_c255_cond;
     MUX_uxn_c_l98_c9_c255_iftrue <= VAR_MUX_uxn_c_l98_c9_c255_iftrue;
     MUX_uxn_c_l98_c9_c255_iffalse <= VAR_MUX_uxn_c_l98_c9_c255_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_c255_return_output := MUX_uxn_c_l98_c9_c255_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_f47e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_f47e_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_left;
     BIN_OP_EQ_uxn_c_l75_c22_f47e_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output := BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c49_78eb] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_78eb_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_left;
     BIN_OP_NEQ_uxn_c_l71_c49_78eb_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output := BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_f61e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_f47e_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_78eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_ins := VAR_MUX_uxn_c_l98_c9_c255_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_MUX_uxn_c_l98_c9_c255_return_output;
     -- MUX[uxn_c_l75_c22_f61e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_f61e_cond <= VAR_MUX_uxn_c_l75_c22_f61e_cond;
     MUX_uxn_c_l75_c22_f61e_iftrue <= VAR_MUX_uxn_c_l75_c22_f61e_iftrue;
     MUX_uxn_c_l75_c22_f61e_iffalse <= VAR_MUX_uxn_c_l75_c22_f61e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_f61e_return_output := MUX_uxn_c_l75_c22_f61e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_378f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output;

     -- ins_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_ins_MUX_uxn_c_l94_c7_b7c5_cond;
     ins_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_b7c5_iftrue;
     ins_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_b7c5_return_output := ins_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- BIN_OP_AND[uxn_c_l71_c6_6b93] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_6b93_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_left;
     BIN_OP_AND_uxn_c_l71_c6_6b93_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_return_output := BIN_OP_AND_uxn_c_l71_c6_6b93_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_6b93_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_378f_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_right := VAR_MUX_uxn_c_l75_c22_f61e_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_ins_MUX_uxn_c_l94_c7_b7c5_return_output;
     -- ins_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_5de9_cond <= VAR_ins_MUX_uxn_c_l87_c2_5de9_cond;
     ins_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_5de9_iftrue;
     ins_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_5de9_return_output := ins_MUX_uxn_c_l87_c2_5de9_return_output;

     -- pending_controller_MUX[uxn_c_l71_c2_ff7d] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_ff7d_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_cond;
     pending_controller_MUX_uxn_c_l71_c2_ff7d_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_ff7d_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output := pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output;

     -- BIN_OP_AND[uxn_c_l75_c6_34c8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_34c8_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_left;
     BIN_OP_AND_uxn_c_l75_c6_34c8_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_return_output := BIN_OP_AND_uxn_c_l75_c6_34c8_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_613d_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_34c8_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_5de9_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_right := VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output;
     VAR_MUX_uxn_c_l80_c54_4c25_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output;
     VAR_MUX_uxn_c_l82_c23_76bb_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_ff7d_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_613d] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_613d_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_613d_cond;
     pending_frame_MUX_uxn_c_l75_c2_613d_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_613d_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_613d_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_613d_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_613d_return_output := pending_frame_MUX_uxn_c_l75_c2_613d_return_output;

     -- MUX[uxn_c_l80_c54_4c25] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_4c25_cond <= VAR_MUX_uxn_c_l80_c54_4c25_cond;
     MUX_uxn_c_l80_c54_4c25_iftrue <= VAR_MUX_uxn_c_l80_c54_4c25_iftrue;
     MUX_uxn_c_l80_c54_4c25_iffalse <= VAR_MUX_uxn_c_l80_c54_4c25_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_4c25_return_output := MUX_uxn_c_l80_c54_4c25_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_2700_iffalse := VAR_MUX_uxn_c_l80_c54_4c25_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_4647_left := VAR_pending_frame_MUX_uxn_c_l75_c2_613d_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_left := VAR_pending_frame_MUX_uxn_c_l75_c2_613d_return_output;
     VAR_MUX_uxn_c_l80_c21_2700_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_613d_return_output;
     -- MUX[uxn_c_l80_c21_2700] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_2700_cond <= VAR_MUX_uxn_c_l80_c21_2700_cond;
     MUX_uxn_c_l80_c21_2700_iftrue <= VAR_MUX_uxn_c_l80_c21_2700_iftrue;
     MUX_uxn_c_l80_c21_2700_iffalse <= VAR_MUX_uxn_c_l80_c21_2700_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_2700_return_output := MUX_uxn_c_l80_c21_2700_return_output;

     -- BIN_OP_OR[uxn_c_l81_c15_d7dd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_d7dd_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_left;
     BIN_OP_OR_uxn_c_l81_c15_d7dd_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output := BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output;

     -- BIN_OP_AND[uxn_c_l79_c33_4647] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_4647_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_4647_left;
     BIN_OP_AND_uxn_c_l79_c33_4647_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_4647_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_4647_return_output := BIN_OP_AND_uxn_c_l79_c33_4647_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_06f8_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_d7dd_return_output;
     VAR_MUX_uxn_c_l80_c7_3dad_iftrue := VAR_MUX_uxn_c_l80_c21_2700_return_output;
     -- MUX[uxn_c_l80_c7_3dad] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_3dad_cond <= VAR_MUX_uxn_c_l80_c7_3dad_cond;
     MUX_uxn_c_l80_c7_3dad_iftrue <= VAR_MUX_uxn_c_l80_c7_3dad_iftrue;
     MUX_uxn_c_l80_c7_3dad_iffalse <= VAR_MUX_uxn_c_l80_c7_3dad_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_3dad_return_output := MUX_uxn_c_l80_c7_3dad_return_output;

     -- MUX[uxn_c_l81_c15_06f8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_06f8_cond <= VAR_MUX_uxn_c_l81_c15_06f8_cond;
     MUX_uxn_c_l81_c15_06f8_iftrue <= VAR_MUX_uxn_c_l81_c15_06f8_iftrue;
     MUX_uxn_c_l81_c15_06f8_iffalse <= VAR_MUX_uxn_c_l81_c15_06f8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_06f8_return_output := MUX_uxn_c_l81_c15_06f8_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_left := VAR_MUX_uxn_c_l80_c7_3dad_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_left := VAR_MUX_uxn_c_l80_c7_3dad_return_output;
     VAR_MUX_uxn_c_l100_c8_bf37_iffalse := VAR_MUX_uxn_c_l80_c7_3dad_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iftrue := VAR_MUX_uxn_c_l80_c7_3dad_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_pc := VAR_MUX_uxn_c_l80_c7_3dad_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_5de9_iftrue := VAR_MUX_uxn_c_l80_c7_3dad_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_iftrue := VAR_MUX_uxn_c_l81_c15_06f8_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_MUX_uxn_c_l81_c15_06f8_return_output;
     -- BIN_OP_EQ[uxn_c_l82_c23_fabb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_fabb_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_left;
     BIN_OP_EQ_uxn_c_l82_c23_fabb_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output := BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_dc2e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_dc2e_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_left;
     BIN_OP_PLUS_uxn_c_l95_c3_dc2e_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output := BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output;

     -- eval_opcode_phased[uxn_c_l99_c45_1cc8] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_1cc8_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_1cc8_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_phase;
     eval_opcode_phased_uxn_c_l99_c45_1cc8_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_ins;
     eval_opcode_phased_uxn_c_l99_c45_1cc8_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_pc;
     eval_opcode_phased_uxn_c_l99_c45_1cc8_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output := eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_76bb_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_fabb_return_output;
     VAR_pc_uxn_c_l95_c3_6895 := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_dc2e_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_b7c5_iftrue := VAR_pc_uxn_c_l95_c3_6895;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_f7a1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_f7a1_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_8779] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_8779_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_39ec] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_39ec_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_5ebd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_5ebd_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_5eaf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_5eaf_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_63e4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_63e4_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.device_ram_address;

     -- MUX[uxn_c_l82_c23_76bb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_76bb_cond <= VAR_MUX_uxn_c_l82_c23_76bb_cond;
     MUX_uxn_c_l82_c23_76bb_iftrue <= VAR_MUX_uxn_c_l82_c23_76bb_iftrue;
     MUX_uxn_c_l82_c23_76bb_iffalse <= VAR_MUX_uxn_c_l82_c23_76bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_76bb_return_output := MUX_uxn_c_l82_c23_76bb_return_output;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_4d3d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_4d3d_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_dea4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_dea4_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_55e9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_55e9_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_92bd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_92bd_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1cc8_return_output.u8_value;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_bf37_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_4d3d_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_4d3d_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_39ec_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_55e9_return_output;
     VAR_MUX_uxn_c_l100_c8_bf37_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_8779_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_5ebd_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_5eaf_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_f7a1_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_dea4_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_63e4_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_92bd_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_76bb_return_output;
     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_cond;
     is_waiting_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output := is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- MUX[uxn_c_l100_c8_bf37] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_bf37_cond <= VAR_MUX_uxn_c_l100_c8_bf37_cond;
     MUX_uxn_c_l100_c8_bf37_iftrue <= VAR_MUX_uxn_c_l100_c8_bf37_iftrue;
     MUX_uxn_c_l100_c8_bf37_iffalse <= VAR_MUX_uxn_c_l100_c8_bf37_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_bf37_return_output := MUX_uxn_c_l100_c8_bf37_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_cond;
     is_ins_done_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output := is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_b7c5_iffalse := VAR_MUX_uxn_c_l100_c8_bf37_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_b7c5_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_b7c5_return_output;
     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_5de9_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_cond;
     is_waiting_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_return_output := is_waiting_MUX_uxn_c_l87_c2_5de9_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output;

     -- pc_MUX[uxn_c_l94_c7_b7c5] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_b7c5_cond <= VAR_pc_MUX_uxn_c_l94_c7_b7c5_cond;
     pc_MUX_uxn_c_l94_c7_b7c5_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_b7c5_iftrue;
     pc_MUX_uxn_c_l94_c7_b7c5_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_b7c5_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_b7c5_return_output := pc_MUX_uxn_c_l94_c7_b7c5_return_output;

     -- is_ins_done_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_5de9_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_cond;
     is_ins_done_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output := is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_5de9_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_right := VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_5de9_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_5de9_iffalse := VAR_pc_MUX_uxn_c_l94_c7_b7c5_return_output;
     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8_uxn_c_l63_l118_DUPLICATE_f420 LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8_uxn_c_l63_l118_DUPLICATE_f420_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8(
     VAR_BIN_OP_AND_uxn_c_l79_c33_4647_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_5de9_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_5de9_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_5de9_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_5de9_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_5de9_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_5de9_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_5de9_return_output);

     -- BIN_OP_OR[uxn_c_l112_c6_8ce0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_8ce0_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_left;
     BIN_OP_OR_uxn_c_l112_c6_8ce0_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output := BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output;

     -- pc_MUX[uxn_c_l87_c2_5de9] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_5de9_cond <= VAR_pc_MUX_uxn_c_l87_c2_5de9_cond;
     pc_MUX_uxn_c_l87_c2_5de9_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_5de9_iftrue;
     pc_MUX_uxn_c_l87_c2_5de9_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_5de9_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_5de9_return_output := pc_MUX_uxn_c_l87_c2_5de9_return_output;

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_8ce0_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8_uxn_c_l63_l118_DUPLICATE_f420_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_f1d8_uxn_c_l63_l118_DUPLICATE_f420_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_5de9_return_output;
     -- uint16_15_8[uxn_c_l115_c21_aa94] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_aa94_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_5de9_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_left := VAR_uint16_15_8_uxn_c_l115_c21_aa94_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_a618] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_a618_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_left;
     BIN_OP_EQ_uxn_c_l115_c21_a618_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_return_output := BIN_OP_EQ_uxn_c_l115_c21_a618_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_312a_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_a618_return_output;
     -- MUX[uxn_c_l115_c21_312a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_312a_cond <= VAR_MUX_uxn_c_l115_c21_312a_cond;
     MUX_uxn_c_l115_c21_312a_iftrue <= VAR_MUX_uxn_c_l115_c21_312a_iftrue;
     MUX_uxn_c_l115_c21_312a_iffalse <= VAR_MUX_uxn_c_l115_c21_312a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_312a_return_output := MUX_uxn_c_l115_c21_312a_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iffalse := VAR_MUX_uxn_c_l115_c21_312a_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_7a2a] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_7a2a_return_output;
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
