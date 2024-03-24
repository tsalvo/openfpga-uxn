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
entity step_cpu_0CLK_13f09cd4 is
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
end step_cpu_0CLK_13f09cd4;
architecture arch of step_cpu_0CLK_13f09cd4 is
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
-- BIN_OP_NEQ[uxn_c_l71_c6_8753]
signal BIN_OP_NEQ_uxn_c_l71_c6_8753_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_8753_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_9d03]
signal BIN_OP_NEQ_uxn_c_l71_c49_9d03_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_9d03_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_f129]
signal BIN_OP_AND_uxn_c_l71_c6_f129_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_f129_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_f129_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_f2d5]
signal pending_controller_MUX_uxn_c_l71_c2_f2d5_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_f2d5_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_f2d5_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_c1c4]
signal BIN_OP_EQ_uxn_c_l75_c22_c1c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_c1c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_985b]
signal MUX_uxn_c_l75_c22_985b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_985b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_985b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_985b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_d7e7]
signal BIN_OP_AND_uxn_c_l75_c6_d7e7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_d7e7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_4e2e]
signal pending_frame_MUX_uxn_c_l75_c2_4e2e_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_4e2e_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_4e2e_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_dc26]
signal BIN_OP_AND_uxn_c_l79_c33_dc26_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_dc26_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_dc26_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_c6e3]
signal MUX_uxn_c_l80_c54_c6e3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_c6e3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_c6e3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_c6e3_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_88e3]
signal MUX_uxn_c_l80_c21_88e3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_88e3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_88e3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_88e3_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_7426]
signal MUX_uxn_c_l80_c7_7426_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_7426_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_7426_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_7426_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_45f1]
signal BIN_OP_OR_uxn_c_l81_c15_45f1_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_45f1_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_45f1_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_f32e]
signal MUX_uxn_c_l81_c15_f32e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_f32e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_f32e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_f32e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_9941]
signal BIN_OP_EQ_uxn_c_l82_c23_9941_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_9941_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_9941_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_144e]
signal MUX_uxn_c_l82_c23_144e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_144e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_144e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_144e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_1d71]
signal BIN_OP_EQ_uxn_c_l87_c6_1d71_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_1d71_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_2c5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_4d71]
signal is_waiting_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(15 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(7 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_4d71]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l87_c2_4d71]
signal ins_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l87_c2_4d71]
signal pc_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_4d71]
signal is_ins_done_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_529d]
signal BIN_OP_EQ_uxn_c_l94_c11_529d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_529d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_529d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_9112]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_2c5e]
signal is_waiting_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(15 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(7 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_2c5e]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l94_c7_2c5e]
signal ins_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l94_c7_2c5e]
signal pc_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_2c5e]
signal is_ins_done_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_843e]
signal BIN_OP_PLUS_uxn_c_l95_c3_843e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_843e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_8016]
signal BIN_OP_EQ_uxn_c_l98_c9_8016_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_8016_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_8016_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_b0e1]
signal MUX_uxn_c_l98_c9_b0e1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_b0e1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_b0e1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_b0e1_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_a3e5]
signal BIN_OP_MINUS_uxn_c_l99_c64_a3e5_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_a3e5_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output : unsigned(11 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_1281]
signal eval_opcode_phased_uxn_c_l99_c45_1281_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_phase : unsigned(11 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1281_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_85af]
signal MUX_uxn_c_l100_c8_85af_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_85af_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_85af_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_85af_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_c1c9]
signal BIN_OP_OR_uxn_c_l112_c6_c1c9_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_c1c9_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_6725]
signal step_cpu_phase_MUX_uxn_c_l112_c2_6725_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_6725_iftrue : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_6725_iffalse : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_fb0b]
signal BIN_OP_EQ_uxn_c_l115_c21_fb0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_fb0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_a11c]
signal BIN_OP_PLUS_uxn_c_l115_c44_a11c_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_a11c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output : unsigned(12 downto 0);

-- MUX[uxn_c_l115_c21_f208]
signal MUX_uxn_c_l115_c21_f208_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_f208_iftrue : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_f208_iffalse : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_f208_return_output : unsigned(11 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182( ref_toks_0 : unsigned;
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
      base.u16_addr := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_8753
BIN_OP_NEQ_uxn_c_l71_c6_8753 : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_8753_left,
BIN_OP_NEQ_uxn_c_l71_c6_8753_right,
BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_9d03
BIN_OP_NEQ_uxn_c_l71_c49_9d03 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_9d03_left,
BIN_OP_NEQ_uxn_c_l71_c49_9d03_right,
BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_f129
BIN_OP_AND_uxn_c_l71_c6_f129 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_f129_left,
BIN_OP_AND_uxn_c_l71_c6_f129_right,
BIN_OP_AND_uxn_c_l71_c6_f129_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_f2d5
pending_controller_MUX_uxn_c_l71_c2_f2d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_f2d5_cond,
pending_controller_MUX_uxn_c_l71_c2_f2d5_iftrue,
pending_controller_MUX_uxn_c_l71_c2_f2d5_iffalse,
pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_c1c4
BIN_OP_EQ_uxn_c_l75_c22_c1c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_c1c4_left,
BIN_OP_EQ_uxn_c_l75_c22_c1c4_right,
BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output);

-- MUX_uxn_c_l75_c22_985b
MUX_uxn_c_l75_c22_985b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_985b_cond,
MUX_uxn_c_l75_c22_985b_iftrue,
MUX_uxn_c_l75_c22_985b_iffalse,
MUX_uxn_c_l75_c22_985b_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_d7e7
BIN_OP_AND_uxn_c_l75_c6_d7e7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_d7e7_left,
BIN_OP_AND_uxn_c_l75_c6_d7e7_right,
BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_4e2e
pending_frame_MUX_uxn_c_l75_c2_4e2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_4e2e_cond,
pending_frame_MUX_uxn_c_l75_c2_4e2e_iftrue,
pending_frame_MUX_uxn_c_l75_c2_4e2e_iffalse,
pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_dc26
BIN_OP_AND_uxn_c_l79_c33_dc26 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_dc26_left,
BIN_OP_AND_uxn_c_l79_c33_dc26_right,
BIN_OP_AND_uxn_c_l79_c33_dc26_return_output);

-- MUX_uxn_c_l80_c54_c6e3
MUX_uxn_c_l80_c54_c6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_c6e3_cond,
MUX_uxn_c_l80_c54_c6e3_iftrue,
MUX_uxn_c_l80_c54_c6e3_iffalse,
MUX_uxn_c_l80_c54_c6e3_return_output);

-- MUX_uxn_c_l80_c21_88e3
MUX_uxn_c_l80_c21_88e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_88e3_cond,
MUX_uxn_c_l80_c21_88e3_iftrue,
MUX_uxn_c_l80_c21_88e3_iffalse,
MUX_uxn_c_l80_c21_88e3_return_output);

-- MUX_uxn_c_l80_c7_7426
MUX_uxn_c_l80_c7_7426 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_7426_cond,
MUX_uxn_c_l80_c7_7426_iftrue,
MUX_uxn_c_l80_c7_7426_iffalse,
MUX_uxn_c_l80_c7_7426_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_45f1
BIN_OP_OR_uxn_c_l81_c15_45f1 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_45f1_left,
BIN_OP_OR_uxn_c_l81_c15_45f1_right,
BIN_OP_OR_uxn_c_l81_c15_45f1_return_output);

-- MUX_uxn_c_l81_c15_f32e
MUX_uxn_c_l81_c15_f32e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_f32e_cond,
MUX_uxn_c_l81_c15_f32e_iftrue,
MUX_uxn_c_l81_c15_f32e_iffalse,
MUX_uxn_c_l81_c15_f32e_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_9941
BIN_OP_EQ_uxn_c_l82_c23_9941 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_9941_left,
BIN_OP_EQ_uxn_c_l82_c23_9941_right,
BIN_OP_EQ_uxn_c_l82_c23_9941_return_output);

-- MUX_uxn_c_l82_c23_144e
MUX_uxn_c_l82_c23_144e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_144e_cond,
MUX_uxn_c_l82_c23_144e_iftrue,
MUX_uxn_c_l82_c23_144e_iffalse,
MUX_uxn_c_l82_c23_144e_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_1d71
BIN_OP_EQ_uxn_c_l87_c6_1d71 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_1d71_left,
BIN_OP_EQ_uxn_c_l87_c6_1d71_right,
BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_4d71
is_waiting_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_4d71_cond,
is_waiting_MUX_uxn_c_l87_c2_4d71_iftrue,
is_waiting_MUX_uxn_c_l87_c2_4d71_iffalse,
is_waiting_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output);

-- ins_MUX_uxn_c_l87_c2_4d71
ins_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_4d71_cond,
ins_MUX_uxn_c_l87_c2_4d71_iftrue,
ins_MUX_uxn_c_l87_c2_4d71_iffalse,
ins_MUX_uxn_c_l87_c2_4d71_return_output);

-- pc_MUX_uxn_c_l87_c2_4d71
pc_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_4d71_cond,
pc_MUX_uxn_c_l87_c2_4d71_iftrue,
pc_MUX_uxn_c_l87_c2_4d71_iffalse,
pc_MUX_uxn_c_l87_c2_4d71_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_4d71
is_ins_done_MUX_uxn_c_l87_c2_4d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_4d71_cond,
is_ins_done_MUX_uxn_c_l87_c2_4d71_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_4d71_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_529d
BIN_OP_EQ_uxn_c_l94_c11_529d : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_529d_left,
BIN_OP_EQ_uxn_c_l94_c11_529d_right,
BIN_OP_EQ_uxn_c_l94_c11_529d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_2c5e
is_waiting_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_2c5e_cond,
is_waiting_MUX_uxn_c_l94_c7_2c5e_iftrue,
is_waiting_MUX_uxn_c_l94_c7_2c5e_iffalse,
is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output);

-- ins_MUX_uxn_c_l94_c7_2c5e
ins_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_2c5e_cond,
ins_MUX_uxn_c_l94_c7_2c5e_iftrue,
ins_MUX_uxn_c_l94_c7_2c5e_iffalse,
ins_MUX_uxn_c_l94_c7_2c5e_return_output);

-- pc_MUX_uxn_c_l94_c7_2c5e
pc_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_2c5e_cond,
pc_MUX_uxn_c_l94_c7_2c5e_iftrue,
pc_MUX_uxn_c_l94_c7_2c5e_iffalse,
pc_MUX_uxn_c_l94_c7_2c5e_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_2c5e
is_ins_done_MUX_uxn_c_l94_c7_2c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_2c5e_cond,
is_ins_done_MUX_uxn_c_l94_c7_2c5e_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_2c5e_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_843e
BIN_OP_PLUS_uxn_c_l95_c3_843e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_843e_left,
BIN_OP_PLUS_uxn_c_l95_c3_843e_right,
BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_8016
BIN_OP_EQ_uxn_c_l98_c9_8016 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_8016_left,
BIN_OP_EQ_uxn_c_l98_c9_8016_right,
BIN_OP_EQ_uxn_c_l98_c9_8016_return_output);

-- MUX_uxn_c_l98_c9_b0e1
MUX_uxn_c_l98_c9_b0e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_b0e1_cond,
MUX_uxn_c_l98_c9_b0e1_iftrue,
MUX_uxn_c_l98_c9_b0e1_iffalse,
MUX_uxn_c_l98_c9_b0e1_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_a3e5
BIN_OP_MINUS_uxn_c_l99_c64_a3e5 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_a3e5_left,
BIN_OP_MINUS_uxn_c_l99_c64_a3e5_right,
BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_1281
eval_opcode_phased_uxn_c_l99_c45_1281 : entity work.eval_opcode_phased_0CLK_24b8744a port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_1281_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_1281_phase,
eval_opcode_phased_uxn_c_l99_c45_1281_ins,
eval_opcode_phased_uxn_c_l99_c45_1281_pc,
eval_opcode_phased_uxn_c_l99_c45_1281_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_1281_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_1281_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_1281_return_output);

-- MUX_uxn_c_l100_c8_85af
MUX_uxn_c_l100_c8_85af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_85af_cond,
MUX_uxn_c_l100_c8_85af_iftrue,
MUX_uxn_c_l100_c8_85af_iffalse,
MUX_uxn_c_l100_c8_85af_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_c1c9
BIN_OP_OR_uxn_c_l112_c6_c1c9 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_c1c9_left,
BIN_OP_OR_uxn_c_l112_c6_c1c9_right,
BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_6725
step_cpu_phase_MUX_uxn_c_l112_c2_6725 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_6725_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_6725_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_6725_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_fb0b
BIN_OP_EQ_uxn_c_l115_c21_fb0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_fb0b_left,
BIN_OP_EQ_uxn_c_l115_c21_fb0b_right,
BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_a11c
BIN_OP_PLUS_uxn_c_l115_c44_a11c : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_a11c_left,
BIN_OP_PLUS_uxn_c_l115_c44_a11c_right,
BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output);

-- MUX_uxn_c_l115_c21_f208
MUX_uxn_c_l115_c21_f208 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_f208_cond,
MUX_uxn_c_l115_c21_f208_iftrue,
MUX_uxn_c_l115_c21_f208_iffalse,
MUX_uxn_c_l115_c21_f208_return_output);



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
 BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output,
 BIN_OP_AND_uxn_c_l71_c6_f129_return_output,
 pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output,
 MUX_uxn_c_l75_c22_985b_return_output,
 BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output,
 pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output,
 BIN_OP_AND_uxn_c_l79_c33_dc26_return_output,
 MUX_uxn_c_l80_c54_c6e3_return_output,
 MUX_uxn_c_l80_c21_88e3_return_output,
 MUX_uxn_c_l80_c7_7426_return_output,
 BIN_OP_OR_uxn_c_l81_c15_45f1_return_output,
 MUX_uxn_c_l81_c15_f32e_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_9941_return_output,
 MUX_uxn_c_l82_c23_144e_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output,
 is_waiting_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output,
 ins_MUX_uxn_c_l87_c2_4d71_return_output,
 pc_MUX_uxn_c_l87_c2_4d71_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_529d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output,
 is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output,
 ins_MUX_uxn_c_l94_c7_2c5e_return_output,
 pc_MUX_uxn_c_l94_c7_2c5e_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_8016_return_output,
 MUX_uxn_c_l98_c9_b0e1_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output,
 eval_opcode_phased_uxn_c_l99_c45_1281_return_output,
 MUX_uxn_c_l100_c8_85af_return_output,
 BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output,
 MUX_uxn_c_l115_c21_f208_return_output)
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
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_f129_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_73e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_f129_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_f129_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_985b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_f378_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_985b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_985b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_985b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_7426_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_7426_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_7426_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_88e3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_88e3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_88e3_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_c6e3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_c6e3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_c6e3_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_c6e3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_88e3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_7426_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_f32e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_f32e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_f32e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_f32e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_144e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_144e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_144e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_144e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_2c5e_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_9647 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_b0e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_b0e1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_b0e1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_b0e1_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_phase : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_85af_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_d911_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_85af_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_85af_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_85af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_d5c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_b5d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_37ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_10f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_6cb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_77b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_e69d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_965b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_iftrue : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_6c84 : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_iffalse : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_f208_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_2b1b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_f208_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_f208_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_f208_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_b73b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_f369_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_3114_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l100_l102_DUPLICATE_baa0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182_uxn_c_l118_l63_DUPLICATE_476c_return_output : cpu_step_result_t;
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
     VAR_MUX_uxn_c_l81_c15_f32e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l82_c23_144e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l75_c22_985b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_right := to_unsigned(1, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_right := to_unsigned(1, 1);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_iffalse := pending_frame;
     VAR_step_cpu_phase_uxn_c_l113_c3_6c84 := resize(to_unsigned(0, 1), 12);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_6c84;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_right := to_unsigned(0, 1);
     VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_right := to_unsigned(2, 2);
     VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_right := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l75_c22_985b_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l115_c21_f208_iftrue := resize(to_unsigned(0, 1), 12);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_c6e3_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_b0e1_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_4d71_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_2c5e_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_7426_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_f32e_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_c6e3_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_7426_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_b0e1_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_88e3_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_left := step_cpu_phase;
     -- BIN_OP_MINUS[uxn_c_l99_c64_a3e5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_a3e5_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_left;
     BIN_OP_MINUS_uxn_c_l99_c64_a3e5_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output := BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_2c5e] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_2c5e_return_output := cpu_step_result.u16_addr;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_2c5e] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_2c5e_return_output := cpu_step_result.is_ram_write;

     -- BIN_OP_EQ[uxn_c_l87_c6_1d71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_1d71_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_left;
     BIN_OP_EQ_uxn_c_l87_c6_1d71_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output := BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;

     -- BIN_OP_EQ[uxn_c_l98_c9_8016] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_8016_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_left;
     BIN_OP_EQ_uxn_c_l98_c9_8016_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_return_output := BIN_OP_EQ_uxn_c_l98_c9_8016_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_b73b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_b73b_return_output := cpu_step_result.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_3114 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_3114_return_output := cpu_step_result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_f369 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_f369_return_output := cpu_step_result.device_ram_address;

     -- uint16_15_8[uxn_c_l71_c49_73e4] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_73e4_return_output := uint16_15_8(
     VAR_controller_vector);

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_2c5e] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_2c5e_return_output := cpu_step_result.is_vram_write;

     -- BIN_OP_NEQ[uxn_c_l71_c6_8753] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_8753_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_left;
     BIN_OP_NEQ_uxn_c_l71_c6_8753_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output := BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output;

     -- BIN_OP_PLUS[uxn_c_l115_c44_a11c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_a11c_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_left;
     BIN_OP_PLUS_uxn_c_l115_c44_a11c_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output := BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output;

     -- BIN_OP_EQ[uxn_c_l94_c11_529d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_529d_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_left;
     BIN_OP_EQ_uxn_c_l94_c11_529d_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output := BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;

     -- uint16_15_8[uxn_c_l75_c22_f378] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_f378_return_output := uint16_15_8(
     VAR_screen_vector);

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_2c5e] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_2c5e_return_output := cpu_step_result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_4d71_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_1d71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_2c5e_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_529d_return_output;
     VAR_MUX_uxn_c_l98_c9_b0e1_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_8016_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_a3e5_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_f129_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_8753_return_output;
     VAR_MUX_uxn_c_l115_c21_f208_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_a11c_return_output, 12);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_3114_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_3114_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_f369_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_f369_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_b73b_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l87_l94_DUPLICATE_b73b_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_2c5e_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_left := VAR_uint16_15_8_uxn_c_l71_c49_73e4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_left := VAR_uint16_15_8_uxn_c_l75_c22_f378_return_output;
     -- BIN_OP_NEQ[uxn_c_l71_c49_9d03] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_9d03_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_left;
     BIN_OP_NEQ_uxn_c_l71_c49_9d03_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output := BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_c1c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_c1c4_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_left;
     BIN_OP_EQ_uxn_c_l75_c22_c1c4_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output := BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output;

     -- MUX[uxn_c_l98_c9_b0e1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_b0e1_cond <= VAR_MUX_uxn_c_l98_c9_b0e1_cond;
     MUX_uxn_c_l98_c9_b0e1_iftrue <= VAR_MUX_uxn_c_l98_c9_b0e1_iftrue;
     MUX_uxn_c_l98_c9_b0e1_iffalse <= VAR_MUX_uxn_c_l98_c9_b0e1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_b0e1_return_output := MUX_uxn_c_l98_c9_b0e1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_985b_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_c1c4_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_f129_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_9d03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_ins := VAR_MUX_uxn_c_l98_c9_b0e1_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_MUX_uxn_c_l98_c9_b0e1_return_output;
     -- BIN_OP_AND[uxn_c_l71_c6_f129] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_f129_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_f129_left;
     BIN_OP_AND_uxn_c_l71_c6_f129_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_f129_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_f129_return_output := BIN_OP_AND_uxn_c_l71_c6_f129_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_9112] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output;

     -- MUX[uxn_c_l75_c22_985b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_985b_cond <= VAR_MUX_uxn_c_l75_c22_985b_cond;
     MUX_uxn_c_l75_c22_985b_iftrue <= VAR_MUX_uxn_c_l75_c22_985b_iftrue;
     MUX_uxn_c_l75_c22_985b_iffalse <= VAR_MUX_uxn_c_l75_c22_985b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_985b_return_output := MUX_uxn_c_l75_c22_985b_return_output;

     -- ins_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_ins_MUX_uxn_c_l94_c7_2c5e_cond;
     ins_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_2c5e_iftrue;
     ins_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_2c5e_return_output := ins_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_f129_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_9112_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_right := VAR_MUX_uxn_c_l75_c22_985b_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_ins_MUX_uxn_c_l94_c7_2c5e_return_output;
     -- pending_controller_MUX[uxn_c_l71_c2_f2d5] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_f2d5_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_cond;
     pending_controller_MUX_uxn_c_l71_c2_f2d5_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_f2d5_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output := pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output;

     -- BIN_OP_AND[uxn_c_l75_c6_d7e7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_d7e7_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_left;
     BIN_OP_AND_uxn_c_l75_c6_d7e7_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output := BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output;

     -- ins_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_4d71_cond <= VAR_ins_MUX_uxn_c_l87_c2_4d71_cond;
     ins_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_4d71_iftrue;
     ins_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_4d71_return_output := ins_MUX_uxn_c_l87_c2_4d71_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_d7e7_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_4d71_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_right := VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output;
     VAR_MUX_uxn_c_l80_c54_c6e3_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output;
     VAR_MUX_uxn_c_l82_c23_144e_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_f2d5_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_4e2e] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_4e2e_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_cond;
     pending_frame_MUX_uxn_c_l75_c2_4e2e_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_4e2e_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output := pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output;

     -- MUX[uxn_c_l80_c54_c6e3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_c6e3_cond <= VAR_MUX_uxn_c_l80_c54_c6e3_cond;
     MUX_uxn_c_l80_c54_c6e3_iftrue <= VAR_MUX_uxn_c_l80_c54_c6e3_iftrue;
     MUX_uxn_c_l80_c54_c6e3_iffalse <= VAR_MUX_uxn_c_l80_c54_c6e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_c6e3_return_output := MUX_uxn_c_l80_c54_c6e3_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_88e3_iffalse := VAR_MUX_uxn_c_l80_c54_c6e3_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_left := VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_left := VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output;
     VAR_MUX_uxn_c_l80_c21_88e3_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_4e2e_return_output;
     -- MUX[uxn_c_l80_c21_88e3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_88e3_cond <= VAR_MUX_uxn_c_l80_c21_88e3_cond;
     MUX_uxn_c_l80_c21_88e3_iftrue <= VAR_MUX_uxn_c_l80_c21_88e3_iftrue;
     MUX_uxn_c_l80_c21_88e3_iffalse <= VAR_MUX_uxn_c_l80_c21_88e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_88e3_return_output := MUX_uxn_c_l80_c21_88e3_return_output;

     -- BIN_OP_AND[uxn_c_l79_c33_dc26] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_dc26_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_left;
     BIN_OP_AND_uxn_c_l79_c33_dc26_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_return_output := BIN_OP_AND_uxn_c_l79_c33_dc26_return_output;

     -- BIN_OP_OR[uxn_c_l81_c15_45f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_45f1_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_left;
     BIN_OP_OR_uxn_c_l81_c15_45f1_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_return_output := BIN_OP_OR_uxn_c_l81_c15_45f1_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_f32e_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_45f1_return_output;
     VAR_MUX_uxn_c_l80_c7_7426_iftrue := VAR_MUX_uxn_c_l80_c21_88e3_return_output;
     -- MUX[uxn_c_l81_c15_f32e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_f32e_cond <= VAR_MUX_uxn_c_l81_c15_f32e_cond;
     MUX_uxn_c_l81_c15_f32e_iftrue <= VAR_MUX_uxn_c_l81_c15_f32e_iftrue;
     MUX_uxn_c_l81_c15_f32e_iffalse <= VAR_MUX_uxn_c_l81_c15_f32e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_f32e_return_output := MUX_uxn_c_l81_c15_f32e_return_output;

     -- MUX[uxn_c_l80_c7_7426] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_7426_cond <= VAR_MUX_uxn_c_l80_c7_7426_cond;
     MUX_uxn_c_l80_c7_7426_iftrue <= VAR_MUX_uxn_c_l80_c7_7426_iftrue;
     MUX_uxn_c_l80_c7_7426_iffalse <= VAR_MUX_uxn_c_l80_c7_7426_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_7426_return_output := MUX_uxn_c_l80_c7_7426_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_left := VAR_MUX_uxn_c_l80_c7_7426_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_left := VAR_MUX_uxn_c_l80_c7_7426_return_output;
     VAR_MUX_uxn_c_l100_c8_85af_iffalse := VAR_MUX_uxn_c_l80_c7_7426_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iftrue := VAR_MUX_uxn_c_l80_c7_7426_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_pc := VAR_MUX_uxn_c_l80_c7_7426_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_4d71_iftrue := VAR_MUX_uxn_c_l80_c7_7426_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_iftrue := VAR_MUX_uxn_c_l81_c15_f32e_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_MUX_uxn_c_l81_c15_f32e_return_output;
     -- eval_opcode_phased[uxn_c_l99_c45_1281] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_1281_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_1281_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_phase;
     eval_opcode_phased_uxn_c_l99_c45_1281_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_ins;
     eval_opcode_phased_uxn_c_l99_c45_1281_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_pc;
     eval_opcode_phased_uxn_c_l99_c45_1281_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_1281_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_1281_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_1281_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output := eval_opcode_phased_uxn_c_l99_c45_1281_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c23_9941] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_9941_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_left;
     BIN_OP_EQ_uxn_c_l82_c23_9941_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_return_output := BIN_OP_EQ_uxn_c_l82_c23_9941_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_843e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_843e_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_left;
     BIN_OP_PLUS_uxn_c_l95_c3_843e_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output := BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_144e_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_9941_return_output;
     VAR_pc_uxn_c_l95_c3_9647 := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_843e_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_2c5e_iftrue := VAR_pc_uxn_c_l95_c3_9647;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_d5c7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_d5c7_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_e69d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_e69d_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_d911] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_d911_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_b5d7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_b5d7_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_10f7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_10f7_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.device_ram_address;

     -- MUX[uxn_c_l82_c23_144e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_144e_cond <= VAR_MUX_uxn_c_l82_c23_144e_cond;
     MUX_uxn_c_l82_c23_144e_iftrue <= VAR_MUX_uxn_c_l82_c23_144e_iftrue;
     MUX_uxn_c_l82_c23_144e_iffalse <= VAR_MUX_uxn_c_l82_c23_144e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_144e_return_output := MUX_uxn_c_l82_c23_144e_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_965b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_965b_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l100_l102_DUPLICATE_baa0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l100_l102_DUPLICATE_baa0_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_37ab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_37ab_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_6cb4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_6cb4_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_77b2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_77b2_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1281_return_output.u8_value;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_85af_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l100_l102_DUPLICATE_baa0_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l100_l102_DUPLICATE_baa0_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_6cb4_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_965b_return_output;
     VAR_MUX_uxn_c_l100_c8_85af_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_d911_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_d5c7_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_b5d7_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_e69d_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_37ab_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_10f7_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_77b2_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_144e_return_output;
     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_cond;
     is_waiting_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output := is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- MUX[uxn_c_l100_c8_85af] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_85af_cond <= VAR_MUX_uxn_c_l100_c8_85af_cond;
     MUX_uxn_c_l100_c8_85af_iftrue <= VAR_MUX_uxn_c_l100_c8_85af_iftrue;
     MUX_uxn_c_l100_c8_85af_iffalse <= VAR_MUX_uxn_c_l100_c8_85af_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_85af_return_output := MUX_uxn_c_l100_c8_85af_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_cond;
     is_ins_done_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output := is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_2c5e_iffalse := VAR_MUX_uxn_c_l100_c8_85af_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_2c5e_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_2c5e_return_output;
     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_4d71_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_cond;
     is_waiting_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_return_output := is_waiting_MUX_uxn_c_l87_c2_4d71_return_output;

     -- is_ins_done_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_4d71_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_cond;
     is_ins_done_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output := is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output;

     -- pc_MUX[uxn_c_l94_c7_2c5e] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_2c5e_cond <= VAR_pc_MUX_uxn_c_l94_c7_2c5e_cond;
     pc_MUX_uxn_c_l94_c7_2c5e_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_2c5e_iftrue;
     pc_MUX_uxn_c_l94_c7_2c5e_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_2c5e_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_2c5e_return_output := pc_MUX_uxn_c_l94_c7_2c5e_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_4d71_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_right := VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_4d71_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_4d71_iffalse := VAR_pc_MUX_uxn_c_l94_c7_2c5e_return_output;
     -- BIN_OP_OR[uxn_c_l112_c6_c1c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_c1c9_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_left;
     BIN_OP_OR_uxn_c_l112_c6_c1c9_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output := BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output;

     -- pc_MUX[uxn_c_l87_c2_4d71] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_4d71_cond <= VAR_pc_MUX_uxn_c_l87_c2_4d71_cond;
     pc_MUX_uxn_c_l87_c2_4d71_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_4d71_iftrue;
     pc_MUX_uxn_c_l87_c2_4d71_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_4d71_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_4d71_return_output := pc_MUX_uxn_c_l87_c2_4d71_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182_uxn_c_l118_l63_DUPLICATE_476c LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182_uxn_c_l118_l63_DUPLICATE_476c_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182(
     VAR_BIN_OP_AND_uxn_c_l79_c33_dc26_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_4d71_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_4d71_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_4d71_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_4d71_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_4d71_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_4d71_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_4d71_return_output);

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_c1c9_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182_uxn_c_l118_l63_DUPLICATE_476c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b182_uxn_c_l118_l63_DUPLICATE_476c_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_4d71_return_output;
     -- uint16_15_8[uxn_c_l115_c21_2b1b] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_2b1b_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_4d71_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_left := VAR_uint16_15_8_uxn_c_l115_c21_2b1b_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_fb0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_fb0b_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_left;
     BIN_OP_EQ_uxn_c_l115_c21_fb0b_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output := BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_f208_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_fb0b_return_output;
     -- MUX[uxn_c_l115_c21_f208] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_f208_cond <= VAR_MUX_uxn_c_l115_c21_f208_cond;
     MUX_uxn_c_l115_c21_f208_iftrue <= VAR_MUX_uxn_c_l115_c21_f208_iftrue;
     MUX_uxn_c_l115_c21_f208_iffalse <= VAR_MUX_uxn_c_l115_c21_f208_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_f208_return_output := MUX_uxn_c_l115_c21_f208_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_iffalse := VAR_MUX_uxn_c_l115_c21_f208_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_6725] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_6725_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_6725_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_6725_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_6725_return_output;
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
