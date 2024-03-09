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
entity step_cpu_0CLK_6dbea706 is
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
end step_cpu_0CLK_6dbea706;
architecture arch of step_cpu_0CLK_6dbea706 is
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
-- BIN_OP_NEQ[uxn_c_l71_c6_31ca]
signal BIN_OP_NEQ_uxn_c_l71_c6_31ca_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_31ca_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_9008]
signal BIN_OP_NEQ_uxn_c_l71_c49_9008_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_9008_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_cff5]
signal BIN_OP_AND_uxn_c_l71_c6_cff5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_cff5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_cff5_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_893b]
signal pending_controller_MUX_uxn_c_l71_c2_893b_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_893b_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_893b_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_893b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_aa44]
signal BIN_OP_EQ_uxn_c_l75_c22_aa44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_aa44_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_337f]
signal MUX_uxn_c_l75_c22_337f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_337f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_337f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_337f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_6963]
signal BIN_OP_AND_uxn_c_l75_c6_6963_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_6963_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_6963_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_da99]
signal pending_frame_MUX_uxn_c_l75_c2_da99_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_da99_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_da99_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_da99_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_8252]
signal BIN_OP_AND_uxn_c_l79_c33_8252_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_8252_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_8252_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_ae7c]
signal MUX_uxn_c_l80_c54_ae7c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_ae7c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_ae7c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_ae7c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_9394]
signal MUX_uxn_c_l80_c21_9394_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_9394_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_9394_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_9394_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_30d5]
signal MUX_uxn_c_l80_c7_30d5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_30d5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_30d5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_30d5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_c691]
signal BIN_OP_OR_uxn_c_l81_c15_c691_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_c691_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_c691_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_13ad]
signal MUX_uxn_c_l81_c15_13ad_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_13ad_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_13ad_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_13ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_e764]
signal BIN_OP_EQ_uxn_c_l82_c23_e764_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_e764_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_e764_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_5ec4]
signal MUX_uxn_c_l82_c23_5ec4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_5ec4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_5ec4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_5ec4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_e13d]
signal BIN_OP_EQ_uxn_c_l87_c6_e13d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_e13d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_1cb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(15 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_ac3a]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l87_c2_ac3a]
signal ins_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_ac3a]
signal is_waiting_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_ac3a]
signal is_ins_done_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l87_c2_ac3a]
signal pc_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_9981]
signal BIN_OP_EQ_uxn_c_l94_c11_9981_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_9981_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_9981_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_730b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(15 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_1cb1]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l94_c7_1cb1]
signal ins_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_1cb1]
signal is_waiting_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_1cb1]
signal is_ins_done_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l94_c7_1cb1]
signal pc_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_945a]
signal BIN_OP_PLUS_uxn_c_l95_c3_945a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_945a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_204b]
signal BIN_OP_EQ_uxn_c_l98_c9_204b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_204b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_204b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_af1c]
signal MUX_uxn_c_l98_c9_af1c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_af1c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_af1c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_af1c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_602f]
signal BIN_OP_MINUS_uxn_c_l99_c64_602f_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_602f_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output : unsigned(11 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_3f3b]
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_phase : unsigned(11 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_3009]
signal MUX_uxn_c_l100_c8_3009_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_3009_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_3009_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_3009_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_f4c3]
signal BIN_OP_OR_uxn_c_l112_c6_f4c3_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_f4c3_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_5576]
signal step_cpu_phase_MUX_uxn_c_l112_c2_5576_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_5576_iftrue : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_5576_iffalse : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_b88e]
signal BIN_OP_EQ_uxn_c_l115_c21_b88e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_b88e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_a267]
signal BIN_OP_PLUS_uxn_c_l115_c44_a267_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_a267_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output : unsigned(12 downto 0);

-- MUX[uxn_c_l115_c21_c1cd]
signal MUX_uxn_c_l115_c21_c1cd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_c1cd_iftrue : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_c1cd_iffalse : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_c1cd_return_output : unsigned(11 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48( ref_toks_0 : unsigned;
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
      base.device_ram_address := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.is_vram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_31ca
BIN_OP_NEQ_uxn_c_l71_c6_31ca : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_31ca_left,
BIN_OP_NEQ_uxn_c_l71_c6_31ca_right,
BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_9008
BIN_OP_NEQ_uxn_c_l71_c49_9008 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_9008_left,
BIN_OP_NEQ_uxn_c_l71_c49_9008_right,
BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_cff5
BIN_OP_AND_uxn_c_l71_c6_cff5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_cff5_left,
BIN_OP_AND_uxn_c_l71_c6_cff5_right,
BIN_OP_AND_uxn_c_l71_c6_cff5_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_893b
pending_controller_MUX_uxn_c_l71_c2_893b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_893b_cond,
pending_controller_MUX_uxn_c_l71_c2_893b_iftrue,
pending_controller_MUX_uxn_c_l71_c2_893b_iffalse,
pending_controller_MUX_uxn_c_l71_c2_893b_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_aa44
BIN_OP_EQ_uxn_c_l75_c22_aa44 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_aa44_left,
BIN_OP_EQ_uxn_c_l75_c22_aa44_right,
BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output);

-- MUX_uxn_c_l75_c22_337f
MUX_uxn_c_l75_c22_337f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_337f_cond,
MUX_uxn_c_l75_c22_337f_iftrue,
MUX_uxn_c_l75_c22_337f_iffalse,
MUX_uxn_c_l75_c22_337f_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_6963
BIN_OP_AND_uxn_c_l75_c6_6963 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_6963_left,
BIN_OP_AND_uxn_c_l75_c6_6963_right,
BIN_OP_AND_uxn_c_l75_c6_6963_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_da99
pending_frame_MUX_uxn_c_l75_c2_da99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_da99_cond,
pending_frame_MUX_uxn_c_l75_c2_da99_iftrue,
pending_frame_MUX_uxn_c_l75_c2_da99_iffalse,
pending_frame_MUX_uxn_c_l75_c2_da99_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_8252
BIN_OP_AND_uxn_c_l79_c33_8252 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_8252_left,
BIN_OP_AND_uxn_c_l79_c33_8252_right,
BIN_OP_AND_uxn_c_l79_c33_8252_return_output);

-- MUX_uxn_c_l80_c54_ae7c
MUX_uxn_c_l80_c54_ae7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_ae7c_cond,
MUX_uxn_c_l80_c54_ae7c_iftrue,
MUX_uxn_c_l80_c54_ae7c_iffalse,
MUX_uxn_c_l80_c54_ae7c_return_output);

-- MUX_uxn_c_l80_c21_9394
MUX_uxn_c_l80_c21_9394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_9394_cond,
MUX_uxn_c_l80_c21_9394_iftrue,
MUX_uxn_c_l80_c21_9394_iffalse,
MUX_uxn_c_l80_c21_9394_return_output);

-- MUX_uxn_c_l80_c7_30d5
MUX_uxn_c_l80_c7_30d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_30d5_cond,
MUX_uxn_c_l80_c7_30d5_iftrue,
MUX_uxn_c_l80_c7_30d5_iffalse,
MUX_uxn_c_l80_c7_30d5_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_c691
BIN_OP_OR_uxn_c_l81_c15_c691 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_c691_left,
BIN_OP_OR_uxn_c_l81_c15_c691_right,
BIN_OP_OR_uxn_c_l81_c15_c691_return_output);

-- MUX_uxn_c_l81_c15_13ad
MUX_uxn_c_l81_c15_13ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_13ad_cond,
MUX_uxn_c_l81_c15_13ad_iftrue,
MUX_uxn_c_l81_c15_13ad_iffalse,
MUX_uxn_c_l81_c15_13ad_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_e764
BIN_OP_EQ_uxn_c_l82_c23_e764 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_e764_left,
BIN_OP_EQ_uxn_c_l82_c23_e764_right,
BIN_OP_EQ_uxn_c_l82_c23_e764_return_output);

-- MUX_uxn_c_l82_c23_5ec4
MUX_uxn_c_l82_c23_5ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_5ec4_cond,
MUX_uxn_c_l82_c23_5ec4_iftrue,
MUX_uxn_c_l82_c23_5ec4_iffalse,
MUX_uxn_c_l82_c23_5ec4_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_e13d
BIN_OP_EQ_uxn_c_l87_c6_e13d : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_e13d_left,
BIN_OP_EQ_uxn_c_l87_c6_e13d_right,
BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output);

-- ins_MUX_uxn_c_l87_c2_ac3a
ins_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_ac3a_cond,
ins_MUX_uxn_c_l87_c2_ac3a_iftrue,
ins_MUX_uxn_c_l87_c2_ac3a_iffalse,
ins_MUX_uxn_c_l87_c2_ac3a_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_ac3a
is_waiting_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_ac3a_cond,
is_waiting_MUX_uxn_c_l87_c2_ac3a_iftrue,
is_waiting_MUX_uxn_c_l87_c2_ac3a_iffalse,
is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_ac3a
is_ins_done_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_ac3a_cond,
is_ins_done_MUX_uxn_c_l87_c2_ac3a_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_ac3a_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output);

-- pc_MUX_uxn_c_l87_c2_ac3a
pc_MUX_uxn_c_l87_c2_ac3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_ac3a_cond,
pc_MUX_uxn_c_l87_c2_ac3a_iftrue,
pc_MUX_uxn_c_l87_c2_ac3a_iffalse,
pc_MUX_uxn_c_l87_c2_ac3a_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_9981
BIN_OP_EQ_uxn_c_l94_c11_9981 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_9981_left,
BIN_OP_EQ_uxn_c_l94_c11_9981_right,
BIN_OP_EQ_uxn_c_l94_c11_9981_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output);

-- ins_MUX_uxn_c_l94_c7_1cb1
ins_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_1cb1_cond,
ins_MUX_uxn_c_l94_c7_1cb1_iftrue,
ins_MUX_uxn_c_l94_c7_1cb1_iffalse,
ins_MUX_uxn_c_l94_c7_1cb1_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_1cb1
is_waiting_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_1cb1_cond,
is_waiting_MUX_uxn_c_l94_c7_1cb1_iftrue,
is_waiting_MUX_uxn_c_l94_c7_1cb1_iffalse,
is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_1cb1
is_ins_done_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_1cb1_cond,
is_ins_done_MUX_uxn_c_l94_c7_1cb1_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_1cb1_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output);

-- pc_MUX_uxn_c_l94_c7_1cb1
pc_MUX_uxn_c_l94_c7_1cb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_1cb1_cond,
pc_MUX_uxn_c_l94_c7_1cb1_iftrue,
pc_MUX_uxn_c_l94_c7_1cb1_iffalse,
pc_MUX_uxn_c_l94_c7_1cb1_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_945a
BIN_OP_PLUS_uxn_c_l95_c3_945a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_945a_left,
BIN_OP_PLUS_uxn_c_l95_c3_945a_right,
BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_204b
BIN_OP_EQ_uxn_c_l98_c9_204b : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_204b_left,
BIN_OP_EQ_uxn_c_l98_c9_204b_right,
BIN_OP_EQ_uxn_c_l98_c9_204b_return_output);

-- MUX_uxn_c_l98_c9_af1c
MUX_uxn_c_l98_c9_af1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_af1c_cond,
MUX_uxn_c_l98_c9_af1c_iftrue,
MUX_uxn_c_l98_c9_af1c_iffalse,
MUX_uxn_c_l98_c9_af1c_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_602f
BIN_OP_MINUS_uxn_c_l99_c64_602f : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_602f_left,
BIN_OP_MINUS_uxn_c_l99_c64_602f_right,
BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_3f3b
eval_opcode_phased_uxn_c_l99_c45_3f3b : entity work.eval_opcode_phased_0CLK_e95c269e port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_3f3b_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_3f3b_phase,
eval_opcode_phased_uxn_c_l99_c45_3f3b_ins,
eval_opcode_phased_uxn_c_l99_c45_3f3b_pc,
eval_opcode_phased_uxn_c_l99_c45_3f3b_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output);

-- MUX_uxn_c_l100_c8_3009
MUX_uxn_c_l100_c8_3009 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_3009_cond,
MUX_uxn_c_l100_c8_3009_iftrue,
MUX_uxn_c_l100_c8_3009_iffalse,
MUX_uxn_c_l100_c8_3009_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_f4c3
BIN_OP_OR_uxn_c_l112_c6_f4c3 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_f4c3_left,
BIN_OP_OR_uxn_c_l112_c6_f4c3_right,
BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_5576
step_cpu_phase_MUX_uxn_c_l112_c2_5576 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_5576_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_5576_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_5576_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_b88e
BIN_OP_EQ_uxn_c_l115_c21_b88e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_b88e_left,
BIN_OP_EQ_uxn_c_l115_c21_b88e_right,
BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_a267
BIN_OP_PLUS_uxn_c_l115_c44_a267 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_a267_left,
BIN_OP_PLUS_uxn_c_l115_c44_a267_right,
BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output);

-- MUX_uxn_c_l115_c21_c1cd
MUX_uxn_c_l115_c21_c1cd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_c1cd_cond,
MUX_uxn_c_l115_c21_c1cd_iftrue,
MUX_uxn_c_l115_c21_c1cd_iffalse,
MUX_uxn_c_l115_c21_c1cd_return_output);



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
 BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output,
 BIN_OP_AND_uxn_c_l71_c6_cff5_return_output,
 pending_controller_MUX_uxn_c_l71_c2_893b_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output,
 MUX_uxn_c_l75_c22_337f_return_output,
 BIN_OP_AND_uxn_c_l75_c6_6963_return_output,
 pending_frame_MUX_uxn_c_l75_c2_da99_return_output,
 BIN_OP_AND_uxn_c_l79_c33_8252_return_output,
 MUX_uxn_c_l80_c54_ae7c_return_output,
 MUX_uxn_c_l80_c21_9394_return_output,
 MUX_uxn_c_l80_c7_30d5_return_output,
 BIN_OP_OR_uxn_c_l81_c15_c691_return_output,
 MUX_uxn_c_l81_c15_13ad_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_e764_return_output,
 MUX_uxn_c_l82_c23_5ec4_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output,
 ins_MUX_uxn_c_l87_c2_ac3a_return_output,
 is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output,
 pc_MUX_uxn_c_l87_c2_ac3a_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_9981_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output,
 ins_MUX_uxn_c_l94_c7_1cb1_return_output,
 is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output,
 pc_MUX_uxn_c_l94_c7_1cb1_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_204b_return_output,
 MUX_uxn_c_l98_c9_af1c_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output,
 eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output,
 MUX_uxn_c_l100_c8_3009_return_output,
 BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output,
 MUX_uxn_c_l115_c21_c1cd_return_output)
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
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_611d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_893b_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_893b_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_893b_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_893b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_6963_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_337f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_8336_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_337f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_337f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_337f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_6963_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_6963_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_da99_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_da99_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_da99_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_da99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_8252_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_8252_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_8252_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_30d5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_30d5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_30d5_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_9394_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_9394_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_9394_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ae7c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ae7c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ae7c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_ae7c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_9394_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_30d5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_13ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_c691_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_c691_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_c691_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_13ad_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_13ad_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_13ad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_5ec4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_5ec4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_5ec4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_5ec4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_ac3a_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_ac3a_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_1cb1_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_ac3a_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_ac3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_1cb1_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_1cb1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_1cb1_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_b06a : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_1cb1_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_1cb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_af1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_af1c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_af1c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_af1c_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_phase : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_3009_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_fd60_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_3009_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_3009_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_3009_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_4718_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_c7c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_3929_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_0f5c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_c1e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_e1c1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_b085_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_7b43_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_iftrue : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_38ea : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_iffalse : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_c1cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_7ffa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_c1cd_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_c1cd_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_c1cd_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_7012_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_e8ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_5cdc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a26d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48_uxn_c_l118_l63_DUPLICATE_8274_return_output : cpu_step_result_t;
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
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l75_c22_337f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l82_c23_5ec4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l75_c22_337f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_right := to_unsigned(0, 1);
     VAR_pending_controller_MUX_uxn_c_l71_c2_893b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l115_c21_c1cd_iftrue := resize(to_unsigned(0, 1), 12);
     VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l81_c15_13ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_right := to_unsigned(2, 2);
     VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_iftrue := to_unsigned(0, 1);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_da99_iffalse := pending_frame;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_right := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_da99_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l113_c3_38ea := resize(to_unsigned(0, 1), 12);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_38ea;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_ae7c_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_af1c_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_ac3a_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_1cb1_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_6963_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_8252_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_30d5_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_13ad_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_ae7c_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_30d5_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_893b_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_af1c_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_9394_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_left := step_cpu_phase;
     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_1cb1] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_1cb1_return_output := cpu_step_result.is_vram_write;

     -- BIN_OP_EQ[uxn_c_l87_c6_e13d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_e13d_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_left;
     BIN_OP_EQ_uxn_c_l87_c6_e13d_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output := BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_1cb1] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_1cb1_return_output := cpu_step_result.u16_addr;

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_1cb1] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_1cb1_return_output := cpu_step_result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_c_l99_c64_602f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_602f_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_left;
     BIN_OP_MINUS_uxn_c_l99_c64_602f_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output := BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_7012 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_7012_return_output := cpu_step_result.device_ram_address;

     -- BIN_OP_PLUS[uxn_c_l115_c44_a267] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_a267_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_left;
     BIN_OP_PLUS_uxn_c_l115_c44_a267_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output := BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output;

     -- BIN_OP_EQ[uxn_c_l98_c9_204b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_204b_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_left;
     BIN_OP_EQ_uxn_c_l98_c9_204b_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_return_output := BIN_OP_EQ_uxn_c_l98_c9_204b_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c6_31ca] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_31ca_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_left;
     BIN_OP_NEQ_uxn_c_l71_c6_31ca_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output := BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_1cb1] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_1cb1_return_output := cpu_step_result.is_ram_write;

     -- uint16_15_8[uxn_c_l75_c22_8336] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_8336_return_output := uint16_15_8(
     VAR_screen_vector);

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_5cdc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_5cdc_return_output := cpu_step_result.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_e8ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_e8ff_return_output := cpu_step_result.vram_write_layer;

     -- BIN_OP_EQ[uxn_c_l94_c11_9981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_9981_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_left;
     BIN_OP_EQ_uxn_c_l94_c11_9981_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output := BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;

     -- uint16_15_8[uxn_c_l71_c49_611d] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_611d_return_output := uint16_15_8(
     VAR_controller_vector);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_ac3a_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_e13d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_1cb1_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_9981_return_output;
     VAR_MUX_uxn_c_l98_c9_af1c_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_204b_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_602f_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_31ca_return_output;
     VAR_MUX_uxn_c_l115_c21_c1cd_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_a267_return_output, 12);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_e8ff_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l87_l94_DUPLICATE_e8ff_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_7012_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_7012_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_5cdc_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_5cdc_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_1cb1_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_left := VAR_uint16_15_8_uxn_c_l71_c49_611d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_left := VAR_uint16_15_8_uxn_c_l75_c22_8336_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_aa44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_aa44_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_left;
     BIN_OP_EQ_uxn_c_l75_c22_aa44_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output := BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output;

     -- MUX[uxn_c_l98_c9_af1c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_af1c_cond <= VAR_MUX_uxn_c_l98_c9_af1c_cond;
     MUX_uxn_c_l98_c9_af1c_iftrue <= VAR_MUX_uxn_c_l98_c9_af1c_iftrue;
     MUX_uxn_c_l98_c9_af1c_iffalse <= VAR_MUX_uxn_c_l98_c9_af1c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_af1c_return_output := MUX_uxn_c_l98_c9_af1c_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c49_9008] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_9008_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_left;
     BIN_OP_NEQ_uxn_c_l71_c49_9008_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output := BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_337f_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_aa44_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_9008_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_ins := VAR_MUX_uxn_c_l98_c9_af1c_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_MUX_uxn_c_l98_c9_af1c_return_output;
     -- BIN_OP_AND[uxn_c_l71_c6_cff5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_cff5_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_left;
     BIN_OP_AND_uxn_c_l71_c6_cff5_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_return_output := BIN_OP_AND_uxn_c_l71_c6_cff5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_730b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output;

     -- MUX[uxn_c_l75_c22_337f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_337f_cond <= VAR_MUX_uxn_c_l75_c22_337f_cond;
     MUX_uxn_c_l75_c22_337f_iftrue <= VAR_MUX_uxn_c_l75_c22_337f_iftrue;
     MUX_uxn_c_l75_c22_337f_iffalse <= VAR_MUX_uxn_c_l75_c22_337f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_337f_return_output := MUX_uxn_c_l75_c22_337f_return_output;

     -- ins_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_ins_MUX_uxn_c_l94_c7_1cb1_cond;
     ins_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_1cb1_iftrue;
     ins_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_1cb1_return_output := ins_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_893b_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_cff5_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_730b_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_6963_right := VAR_MUX_uxn_c_l75_c22_337f_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_ins_MUX_uxn_c_l94_c7_1cb1_return_output;
     -- BIN_OP_AND[uxn_c_l75_c6_6963] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_6963_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_6963_left;
     BIN_OP_AND_uxn_c_l75_c6_6963_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_6963_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_6963_return_output := BIN_OP_AND_uxn_c_l75_c6_6963_return_output;

     -- pending_controller_MUX[uxn_c_l71_c2_893b] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_893b_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_893b_cond;
     pending_controller_MUX_uxn_c_l71_c2_893b_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_893b_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_893b_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_893b_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_893b_return_output := pending_controller_MUX_uxn_c_l71_c2_893b_return_output;

     -- ins_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_ins_MUX_uxn_c_l87_c2_ac3a_cond;
     ins_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_ac3a_iftrue;
     ins_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_ac3a_return_output := ins_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_da99_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_6963_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_ac3a_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_c691_right := VAR_pending_controller_MUX_uxn_c_l71_c2_893b_return_output;
     VAR_MUX_uxn_c_l80_c54_ae7c_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_893b_return_output;
     VAR_MUX_uxn_c_l82_c23_5ec4_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_893b_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_da99] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_da99_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_da99_cond;
     pending_frame_MUX_uxn_c_l75_c2_da99_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_da99_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_da99_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_da99_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_da99_return_output := pending_frame_MUX_uxn_c_l75_c2_da99_return_output;

     -- MUX[uxn_c_l80_c54_ae7c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_ae7c_cond <= VAR_MUX_uxn_c_l80_c54_ae7c_cond;
     MUX_uxn_c_l80_c54_ae7c_iftrue <= VAR_MUX_uxn_c_l80_c54_ae7c_iftrue;
     MUX_uxn_c_l80_c54_ae7c_iffalse <= VAR_MUX_uxn_c_l80_c54_ae7c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_ae7c_return_output := MUX_uxn_c_l80_c54_ae7c_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_9394_iffalse := VAR_MUX_uxn_c_l80_c54_ae7c_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_8252_left := VAR_pending_frame_MUX_uxn_c_l75_c2_da99_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_c691_left := VAR_pending_frame_MUX_uxn_c_l75_c2_da99_return_output;
     VAR_MUX_uxn_c_l80_c21_9394_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_da99_return_output;
     -- BIN_OP_AND[uxn_c_l79_c33_8252] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_8252_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_8252_left;
     BIN_OP_AND_uxn_c_l79_c33_8252_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_8252_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_8252_return_output := BIN_OP_AND_uxn_c_l79_c33_8252_return_output;

     -- MUX[uxn_c_l80_c21_9394] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_9394_cond <= VAR_MUX_uxn_c_l80_c21_9394_cond;
     MUX_uxn_c_l80_c21_9394_iftrue <= VAR_MUX_uxn_c_l80_c21_9394_iftrue;
     MUX_uxn_c_l80_c21_9394_iffalse <= VAR_MUX_uxn_c_l80_c21_9394_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_9394_return_output := MUX_uxn_c_l80_c21_9394_return_output;

     -- BIN_OP_OR[uxn_c_l81_c15_c691] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_c691_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_c691_left;
     BIN_OP_OR_uxn_c_l81_c15_c691_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_c691_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_c691_return_output := BIN_OP_OR_uxn_c_l81_c15_c691_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_13ad_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_c691_return_output;
     VAR_MUX_uxn_c_l80_c7_30d5_iftrue := VAR_MUX_uxn_c_l80_c21_9394_return_output;
     -- MUX[uxn_c_l80_c7_30d5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_30d5_cond <= VAR_MUX_uxn_c_l80_c7_30d5_cond;
     MUX_uxn_c_l80_c7_30d5_iftrue <= VAR_MUX_uxn_c_l80_c7_30d5_iftrue;
     MUX_uxn_c_l80_c7_30d5_iffalse <= VAR_MUX_uxn_c_l80_c7_30d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_30d5_return_output := MUX_uxn_c_l80_c7_30d5_return_output;

     -- MUX[uxn_c_l81_c15_13ad] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_13ad_cond <= VAR_MUX_uxn_c_l81_c15_13ad_cond;
     MUX_uxn_c_l81_c15_13ad_iftrue <= VAR_MUX_uxn_c_l81_c15_13ad_iftrue;
     MUX_uxn_c_l81_c15_13ad_iffalse <= VAR_MUX_uxn_c_l81_c15_13ad_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_13ad_return_output := MUX_uxn_c_l81_c15_13ad_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_left := VAR_MUX_uxn_c_l80_c7_30d5_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_left := VAR_MUX_uxn_c_l80_c7_30d5_return_output;
     VAR_MUX_uxn_c_l100_c8_3009_iffalse := VAR_MUX_uxn_c_l80_c7_30d5_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iftrue := VAR_MUX_uxn_c_l80_c7_30d5_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_pc := VAR_MUX_uxn_c_l80_c7_30d5_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_ac3a_iftrue := VAR_MUX_uxn_c_l80_c7_30d5_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_iftrue := VAR_MUX_uxn_c_l81_c15_13ad_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_MUX_uxn_c_l81_c15_13ad_return_output;
     -- eval_opcode_phased[uxn_c_l99_c45_3f3b] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_3f3b_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_3f3b_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_phase;
     eval_opcode_phased_uxn_c_l99_c45_3f3b_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_ins;
     eval_opcode_phased_uxn_c_l99_c45_3f3b_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_pc;
     eval_opcode_phased_uxn_c_l99_c45_3f3b_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output := eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c23_e764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_e764_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_left;
     BIN_OP_EQ_uxn_c_l82_c23_e764_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_return_output := BIN_OP_EQ_uxn_c_l82_c23_e764_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_945a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_945a_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_left;
     BIN_OP_PLUS_uxn_c_l95_c3_945a_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output := BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_5ec4_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_e764_return_output;
     VAR_pc_uxn_c_l95_c3_b06a := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_945a_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_1cb1_iftrue := VAR_pc_uxn_c_l95_c3_b06a;
     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a26d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a26d_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_4718] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_4718_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_b085] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_b085_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_c7c6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_c7c6_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_e1c1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_e1c1_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.u8_value;

     -- MUX[uxn_c_l82_c23_5ec4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_5ec4_cond <= VAR_MUX_uxn_c_l82_c23_5ec4_cond;
     MUX_uxn_c_l82_c23_5ec4_iftrue <= VAR_MUX_uxn_c_l82_c23_5ec4_iftrue;
     MUX_uxn_c_l82_c23_5ec4_iffalse <= VAR_MUX_uxn_c_l82_c23_5ec4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_5ec4_return_output := MUX_uxn_c_l82_c23_5ec4_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_3929] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_3929_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_0f5c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_0f5c_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_fd60] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_fd60_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_c1e7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_c1e7_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_7b43] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_7b43_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_3f3b_return_output.is_opc_done;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_3009_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a26d_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_a26d_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_c1e7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_7b43_return_output;
     VAR_MUX_uxn_c_l100_c8_3009_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_fd60_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_4718_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_c7c6_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_b085_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_3929_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_0f5c_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_e1c1_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_5ec4_return_output;
     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_cond;
     is_ins_done_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output := is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- MUX[uxn_c_l100_c8_3009] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_3009_cond <= VAR_MUX_uxn_c_l100_c8_3009_cond;
     MUX_uxn_c_l100_c8_3009_iftrue <= VAR_MUX_uxn_c_l100_c8_3009_iftrue;
     MUX_uxn_c_l100_c8_3009_iffalse <= VAR_MUX_uxn_c_l100_c8_3009_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_3009_return_output := MUX_uxn_c_l100_c8_3009_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_cond;
     is_waiting_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output := is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_1cb1_iffalse := VAR_MUX_uxn_c_l100_c8_3009_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_1cb1_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_1cb1_return_output;
     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_cond;
     is_waiting_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output := is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- pc_MUX[uxn_c_l94_c7_1cb1] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_1cb1_cond <= VAR_pc_MUX_uxn_c_l94_c7_1cb1_cond;
     pc_MUX_uxn_c_l94_c7_1cb1_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_1cb1_iftrue;
     pc_MUX_uxn_c_l94_c7_1cb1_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_1cb1_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_1cb1_return_output := pc_MUX_uxn_c_l94_c7_1cb1_return_output;

     -- is_ins_done_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_cond;
     is_ins_done_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output := is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_ac3a_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_right := VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_ac3a_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_ac3a_iffalse := VAR_pc_MUX_uxn_c_l94_c7_1cb1_return_output;
     -- pc_MUX[uxn_c_l87_c2_ac3a] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_ac3a_cond <= VAR_pc_MUX_uxn_c_l87_c2_ac3a_cond;
     pc_MUX_uxn_c_l87_c2_ac3a_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_ac3a_iftrue;
     pc_MUX_uxn_c_l87_c2_ac3a_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_ac3a_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_ac3a_return_output := pc_MUX_uxn_c_l87_c2_ac3a_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48_uxn_c_l118_l63_DUPLICATE_8274 LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48_uxn_c_l118_l63_DUPLICATE_8274_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48(
     VAR_BIN_OP_AND_uxn_c_l79_c33_8252_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_ac3a_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_ac3a_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_ac3a_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_ac3a_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_ac3a_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_ac3a_return_output);

     -- BIN_OP_OR[uxn_c_l112_c6_f4c3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_f4c3_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_left;
     BIN_OP_OR_uxn_c_l112_c6_f4c3_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output := BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output;

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_f4c3_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48_uxn_c_l118_l63_DUPLICATE_8274_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6e48_uxn_c_l118_l63_DUPLICATE_8274_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_ac3a_return_output;
     -- uint16_15_8[uxn_c_l115_c21_7ffa] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_7ffa_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_ac3a_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_left := VAR_uint16_15_8_uxn_c_l115_c21_7ffa_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_b88e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_b88e_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_left;
     BIN_OP_EQ_uxn_c_l115_c21_b88e_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output := BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_c1cd_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_b88e_return_output;
     -- MUX[uxn_c_l115_c21_c1cd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_c1cd_cond <= VAR_MUX_uxn_c_l115_c21_c1cd_cond;
     MUX_uxn_c_l115_c21_c1cd_iftrue <= VAR_MUX_uxn_c_l115_c21_c1cd_iftrue;
     MUX_uxn_c_l115_c21_c1cd_iffalse <= VAR_MUX_uxn_c_l115_c21_c1cd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_c1cd_return_output := MUX_uxn_c_l115_c21_c1cd_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_iffalse := VAR_MUX_uxn_c_l115_c21_c1cd_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_5576] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_5576_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_5576_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_5576_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_5576_return_output;
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
