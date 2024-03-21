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
entity step_cpu_0CLK_3a9a679b is
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
end step_cpu_0CLK_3a9a679b;
architecture arch of step_cpu_0CLK_3a9a679b is
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
-- BIN_OP_NEQ[uxn_c_l71_c6_11bf]
signal BIN_OP_NEQ_uxn_c_l71_c6_11bf_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_11bf_right : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output : unsigned(0 downto 0);

-- BIN_OP_NEQ[uxn_c_l71_c49_edcb]
signal BIN_OP_NEQ_uxn_c_l71_c49_edcb_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_edcb_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l71_c6_b9a7]
signal BIN_OP_AND_uxn_c_l71_c6_b9a7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_b9a7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output : unsigned(0 downto 0);

-- pending_controller_MUX[uxn_c_l71_c2_5d42]
signal pending_controller_MUX_uxn_c_l71_c2_5d42_cond : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_5d42_iftrue : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_5d42_iffalse : unsigned(0 downto 0);
signal pending_controller_MUX_uxn_c_l71_c2_5d42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c22_8455]
signal BIN_OP_EQ_uxn_c_l75_c22_8455_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_8455_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c22_8455_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c22_6980]
signal MUX_uxn_c_l75_c22_6980_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_6980_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_6980_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c22_6980_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l75_c6_c020]
signal BIN_OP_AND_uxn_c_l75_c6_c020_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_c020_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l75_c6_c020_return_output : unsigned(0 downto 0);

-- pending_frame_MUX[uxn_c_l75_c2_4415]
signal pending_frame_MUX_uxn_c_l75_c2_4415_cond : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_4415_iftrue : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_4415_iffalse : unsigned(0 downto 0);
signal pending_frame_MUX_uxn_c_l75_c2_4415_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l79_c33_37ea]
signal BIN_OP_AND_uxn_c_l79_c33_37ea_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_37ea_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l79_c33_37ea_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l80_c54_fff2]
signal MUX_uxn_c_l80_c54_fff2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c54_fff2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_fff2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c54_fff2_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c21_c643]
signal MUX_uxn_c_l80_c21_c643_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c21_c643_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_c643_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c21_c643_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l80_c7_1f40]
signal MUX_uxn_c_l80_c7_1f40_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l80_c7_1f40_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_1f40_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l80_c7_1f40_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l81_c15_8c7d]
signal BIN_OP_OR_uxn_c_l81_c15_8c7d_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_8c7d_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c15_8d37]
signal MUX_uxn_c_l81_c15_8d37_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_8d37_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_8d37_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c15_8d37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c23_24cd]
signal BIN_OP_EQ_uxn_c_l82_c23_24cd_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_24cd_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l82_c23_da43]
signal MUX_uxn_c_l82_c23_da43_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_da43_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_da43_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c23_da43_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c6_3a1d]
signal BIN_OP_EQ_uxn_c_l87_c6_3a1d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_3a1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_4d22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l87_c2_31b2]
signal ins_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l87_c2_31b2]
signal is_ins_done_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(15 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_31b2]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l87_c2_31b2]
signal pc_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l87_c2_31b2]
signal is_waiting_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l94_c11_044c]
signal BIN_OP_EQ_uxn_c_l94_c11_044c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_044c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l94_c11_044c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_f78a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l94_c7_4d22]
signal ins_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l94_c7_4d22]
signal is_ins_done_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(15 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_4d22]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l94_c7_4d22]
signal pc_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l94_c7_4d22]
signal is_waiting_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_a2da]
signal BIN_OP_PLUS_uxn_c_l95_c3_a2da_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_a2da_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l98_c9_0aa2]
signal BIN_OP_EQ_uxn_c_l98_c9_0aa2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_0aa2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l98_c9_1561]
signal MUX_uxn_c_l98_c9_1561_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l98_c9_1561_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_1561_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l98_c9_1561_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l99_c64_c797]
signal BIN_OP_MINUS_uxn_c_l99_c64_c797_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_c797_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output : unsigned(11 downto 0);

-- eval_opcode_phased[uxn_c_l99_c45_1fea]
signal eval_opcode_phased_uxn_c_l99_c45_1fea_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_phase : unsigned(11 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_controller0_buttons : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l99_c45_1fea_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l100_c8_7fd1]
signal MUX_uxn_c_l100_c8_7fd1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l100_c8_7fd1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_7fd1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l100_c8_7fd1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l112_c6_f889]
signal BIN_OP_OR_uxn_c_l112_c6_f889_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_f889_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l112_c6_f889_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l112_c2_a5fa]
signal step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iftrue : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iffalse : unsigned(11 downto 0);
signal step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l115_c21_a153]
signal BIN_OP_EQ_uxn_c_l115_c21_a153_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_a153_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l115_c21_a153_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c44_b700]
signal BIN_OP_PLUS_uxn_c_l115_c44_b700_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_b700_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output : unsigned(12 downto 0);

-- MUX[uxn_c_l115_c21_8804]
signal MUX_uxn_c_l115_c21_8804_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l115_c21_8804_iftrue : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_8804_iffalse : unsigned(11 downto 0);
signal MUX_uxn_c_l115_c21_8804_return_output : unsigned(11 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff( ref_toks_0 : unsigned;
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
      base.u8_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_NEQ_uxn_c_l71_c6_11bf
BIN_OP_NEQ_uxn_c_l71_c6_11bf : entity work.BIN_OP_NEQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c6_11bf_left,
BIN_OP_NEQ_uxn_c_l71_c6_11bf_right,
BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output);

-- BIN_OP_NEQ_uxn_c_l71_c49_edcb
BIN_OP_NEQ_uxn_c_l71_c49_edcb : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l71_c49_edcb_left,
BIN_OP_NEQ_uxn_c_l71_c49_edcb_right,
BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output);

-- BIN_OP_AND_uxn_c_l71_c6_b9a7
BIN_OP_AND_uxn_c_l71_c6_b9a7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l71_c6_b9a7_left,
BIN_OP_AND_uxn_c_l71_c6_b9a7_right,
BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output);

-- pending_controller_MUX_uxn_c_l71_c2_5d42
pending_controller_MUX_uxn_c_l71_c2_5d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_controller_MUX_uxn_c_l71_c2_5d42_cond,
pending_controller_MUX_uxn_c_l71_c2_5d42_iftrue,
pending_controller_MUX_uxn_c_l71_c2_5d42_iffalse,
pending_controller_MUX_uxn_c_l71_c2_5d42_return_output);

-- BIN_OP_EQ_uxn_c_l75_c22_8455
BIN_OP_EQ_uxn_c_l75_c22_8455 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c22_8455_left,
BIN_OP_EQ_uxn_c_l75_c22_8455_right,
BIN_OP_EQ_uxn_c_l75_c22_8455_return_output);

-- MUX_uxn_c_l75_c22_6980
MUX_uxn_c_l75_c22_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c22_6980_cond,
MUX_uxn_c_l75_c22_6980_iftrue,
MUX_uxn_c_l75_c22_6980_iffalse,
MUX_uxn_c_l75_c22_6980_return_output);

-- BIN_OP_AND_uxn_c_l75_c6_c020
BIN_OP_AND_uxn_c_l75_c6_c020 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l75_c6_c020_left,
BIN_OP_AND_uxn_c_l75_c6_c020_right,
BIN_OP_AND_uxn_c_l75_c6_c020_return_output);

-- pending_frame_MUX_uxn_c_l75_c2_4415
pending_frame_MUX_uxn_c_l75_c2_4415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
pending_frame_MUX_uxn_c_l75_c2_4415_cond,
pending_frame_MUX_uxn_c_l75_c2_4415_iftrue,
pending_frame_MUX_uxn_c_l75_c2_4415_iffalse,
pending_frame_MUX_uxn_c_l75_c2_4415_return_output);

-- BIN_OP_AND_uxn_c_l79_c33_37ea
BIN_OP_AND_uxn_c_l79_c33_37ea : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l79_c33_37ea_left,
BIN_OP_AND_uxn_c_l79_c33_37ea_right,
BIN_OP_AND_uxn_c_l79_c33_37ea_return_output);

-- MUX_uxn_c_l80_c54_fff2
MUX_uxn_c_l80_c54_fff2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c54_fff2_cond,
MUX_uxn_c_l80_c54_fff2_iftrue,
MUX_uxn_c_l80_c54_fff2_iffalse,
MUX_uxn_c_l80_c54_fff2_return_output);

-- MUX_uxn_c_l80_c21_c643
MUX_uxn_c_l80_c21_c643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c21_c643_cond,
MUX_uxn_c_l80_c21_c643_iftrue,
MUX_uxn_c_l80_c21_c643_iffalse,
MUX_uxn_c_l80_c21_c643_return_output);

-- MUX_uxn_c_l80_c7_1f40
MUX_uxn_c_l80_c7_1f40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l80_c7_1f40_cond,
MUX_uxn_c_l80_c7_1f40_iftrue,
MUX_uxn_c_l80_c7_1f40_iffalse,
MUX_uxn_c_l80_c7_1f40_return_output);

-- BIN_OP_OR_uxn_c_l81_c15_8c7d
BIN_OP_OR_uxn_c_l81_c15_8c7d : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l81_c15_8c7d_left,
BIN_OP_OR_uxn_c_l81_c15_8c7d_right,
BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output);

-- MUX_uxn_c_l81_c15_8d37
MUX_uxn_c_l81_c15_8d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c15_8d37_cond,
MUX_uxn_c_l81_c15_8d37_iftrue,
MUX_uxn_c_l81_c15_8d37_iffalse,
MUX_uxn_c_l81_c15_8d37_return_output);

-- BIN_OP_EQ_uxn_c_l82_c23_24cd
BIN_OP_EQ_uxn_c_l82_c23_24cd : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c23_24cd_left,
BIN_OP_EQ_uxn_c_l82_c23_24cd_right,
BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output);

-- MUX_uxn_c_l82_c23_da43
MUX_uxn_c_l82_c23_da43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c23_da43_cond,
MUX_uxn_c_l82_c23_da43_iftrue,
MUX_uxn_c_l82_c23_da43_iffalse,
MUX_uxn_c_l82_c23_da43_return_output);

-- BIN_OP_EQ_uxn_c_l87_c6_3a1d
BIN_OP_EQ_uxn_c_l87_c6_3a1d : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c6_3a1d_left,
BIN_OP_EQ_uxn_c_l87_c6_3a1d_right,
BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output);

-- ins_MUX_uxn_c_l87_c2_31b2
ins_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l87_c2_31b2_cond,
ins_MUX_uxn_c_l87_c2_31b2_iftrue,
ins_MUX_uxn_c_l87_c2_31b2_iffalse,
ins_MUX_uxn_c_l87_c2_31b2_return_output);

-- is_ins_done_MUX_uxn_c_l87_c2_31b2
is_ins_done_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l87_c2_31b2_cond,
is_ins_done_MUX_uxn_c_l87_c2_31b2_iftrue,
is_ins_done_MUX_uxn_c_l87_c2_31b2_iffalse,
is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output);

-- pc_MUX_uxn_c_l87_c2_31b2
pc_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l87_c2_31b2_cond,
pc_MUX_uxn_c_l87_c2_31b2_iftrue,
pc_MUX_uxn_c_l87_c2_31b2_iffalse,
pc_MUX_uxn_c_l87_c2_31b2_return_output);

-- is_waiting_MUX_uxn_c_l87_c2_31b2
is_waiting_MUX_uxn_c_l87_c2_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l87_c2_31b2_cond,
is_waiting_MUX_uxn_c_l87_c2_31b2_iftrue,
is_waiting_MUX_uxn_c_l87_c2_31b2_iffalse,
is_waiting_MUX_uxn_c_l87_c2_31b2_return_output);

-- BIN_OP_EQ_uxn_c_l94_c11_044c
BIN_OP_EQ_uxn_c_l94_c11_044c : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l94_c11_044c_left,
BIN_OP_EQ_uxn_c_l94_c11_044c_right,
BIN_OP_EQ_uxn_c_l94_c11_044c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output);

-- ins_MUX_uxn_c_l94_c7_4d22
ins_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l94_c7_4d22_cond,
ins_MUX_uxn_c_l94_c7_4d22_iftrue,
ins_MUX_uxn_c_l94_c7_4d22_iffalse,
ins_MUX_uxn_c_l94_c7_4d22_return_output);

-- is_ins_done_MUX_uxn_c_l94_c7_4d22
is_ins_done_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l94_c7_4d22_cond,
is_ins_done_MUX_uxn_c_l94_c7_4d22_iftrue,
is_ins_done_MUX_uxn_c_l94_c7_4d22_iffalse,
is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output);

-- pc_MUX_uxn_c_l94_c7_4d22
pc_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l94_c7_4d22_cond,
pc_MUX_uxn_c_l94_c7_4d22_iftrue,
pc_MUX_uxn_c_l94_c7_4d22_iffalse,
pc_MUX_uxn_c_l94_c7_4d22_return_output);

-- is_waiting_MUX_uxn_c_l94_c7_4d22
is_waiting_MUX_uxn_c_l94_c7_4d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l94_c7_4d22_cond,
is_waiting_MUX_uxn_c_l94_c7_4d22_iftrue,
is_waiting_MUX_uxn_c_l94_c7_4d22_iffalse,
is_waiting_MUX_uxn_c_l94_c7_4d22_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_a2da
BIN_OP_PLUS_uxn_c_l95_c3_a2da : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_a2da_left,
BIN_OP_PLUS_uxn_c_l95_c3_a2da_right,
BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output);

-- BIN_OP_EQ_uxn_c_l98_c9_0aa2
BIN_OP_EQ_uxn_c_l98_c9_0aa2 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l98_c9_0aa2_left,
BIN_OP_EQ_uxn_c_l98_c9_0aa2_right,
BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output);

-- MUX_uxn_c_l98_c9_1561
MUX_uxn_c_l98_c9_1561 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l98_c9_1561_cond,
MUX_uxn_c_l98_c9_1561_iftrue,
MUX_uxn_c_l98_c9_1561_iffalse,
MUX_uxn_c_l98_c9_1561_return_output);

-- BIN_OP_MINUS_uxn_c_l99_c64_c797
BIN_OP_MINUS_uxn_c_l99_c64_c797 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l99_c64_c797_left,
BIN_OP_MINUS_uxn_c_l99_c64_c797_right,
BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output);

-- eval_opcode_phased_uxn_c_l99_c45_1fea
eval_opcode_phased_uxn_c_l99_c45_1fea : entity work.eval_opcode_phased_0CLK_77aa49b0 port map (
clk,
eval_opcode_phased_uxn_c_l99_c45_1fea_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l99_c45_1fea_phase,
eval_opcode_phased_uxn_c_l99_c45_1fea_ins,
eval_opcode_phased_uxn_c_l99_c45_1fea_pc,
eval_opcode_phased_uxn_c_l99_c45_1fea_controller0_buttons,
eval_opcode_phased_uxn_c_l99_c45_1fea_previous_ram_read,
eval_opcode_phased_uxn_c_l99_c45_1fea_previous_device_ram_read,
eval_opcode_phased_uxn_c_l99_c45_1fea_return_output);

-- MUX_uxn_c_l100_c8_7fd1
MUX_uxn_c_l100_c8_7fd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l100_c8_7fd1_cond,
MUX_uxn_c_l100_c8_7fd1_iftrue,
MUX_uxn_c_l100_c8_7fd1_iffalse,
MUX_uxn_c_l100_c8_7fd1_return_output);

-- BIN_OP_OR_uxn_c_l112_c6_f889
BIN_OP_OR_uxn_c_l112_c6_f889 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l112_c6_f889_left,
BIN_OP_OR_uxn_c_l112_c6_f889_right,
BIN_OP_OR_uxn_c_l112_c6_f889_return_output);

-- step_cpu_phase_MUX_uxn_c_l112_c2_a5fa
step_cpu_phase_MUX_uxn_c_l112_c2_a5fa : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_cond,
step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iftrue,
step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iffalse,
step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output);

-- BIN_OP_EQ_uxn_c_l115_c21_a153
BIN_OP_EQ_uxn_c_l115_c21_a153 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l115_c21_a153_left,
BIN_OP_EQ_uxn_c_l115_c21_a153_right,
BIN_OP_EQ_uxn_c_l115_c21_a153_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c44_b700
BIN_OP_PLUS_uxn_c_l115_c44_b700 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c44_b700_left,
BIN_OP_PLUS_uxn_c_l115_c44_b700_right,
BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output);

-- MUX_uxn_c_l115_c21_8804
MUX_uxn_c_l115_c21_8804 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_c_l115_c21_8804_cond,
MUX_uxn_c_l115_c21_8804_iftrue,
MUX_uxn_c_l115_c21_8804_iffalse,
MUX_uxn_c_l115_c21_8804_return_output);



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
 BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output,
 BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output,
 BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output,
 pending_controller_MUX_uxn_c_l71_c2_5d42_return_output,
 BIN_OP_EQ_uxn_c_l75_c22_8455_return_output,
 MUX_uxn_c_l75_c22_6980_return_output,
 BIN_OP_AND_uxn_c_l75_c6_c020_return_output,
 pending_frame_MUX_uxn_c_l75_c2_4415_return_output,
 BIN_OP_AND_uxn_c_l79_c33_37ea_return_output,
 MUX_uxn_c_l80_c54_fff2_return_output,
 MUX_uxn_c_l80_c21_c643_return_output,
 MUX_uxn_c_l80_c7_1f40_return_output,
 BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output,
 MUX_uxn_c_l81_c15_8d37_return_output,
 BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output,
 MUX_uxn_c_l82_c23_da43_return_output,
 BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output,
 ins_MUX_uxn_c_l87_c2_31b2_return_output,
 is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output,
 pc_MUX_uxn_c_l87_c2_31b2_return_output,
 is_waiting_MUX_uxn_c_l87_c2_31b2_return_output,
 BIN_OP_EQ_uxn_c_l94_c11_044c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output,
 ins_MUX_uxn_c_l94_c7_4d22_return_output,
 is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output,
 pc_MUX_uxn_c_l94_c7_4d22_return_output,
 is_waiting_MUX_uxn_c_l94_c7_4d22_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output,
 BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output,
 MUX_uxn_c_l98_c9_1561_return_output,
 BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output,
 eval_opcode_phased_uxn_c_l99_c45_1fea_return_output,
 MUX_uxn_c_l100_c8_7fd1_return_output,
 BIN_OP_OR_uxn_c_l112_c6_f889_return_output,
 step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output,
 BIN_OP_EQ_uxn_c_l115_c21_a153_return_output,
 BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output,
 MUX_uxn_c_l115_c21_8804_return_output)
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
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l71_c49_e1a9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_iftrue : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_iffalse : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_return_output : unsigned(0 downto 0);
 variable VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_c020_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_6980_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l75_c22_9f74_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_6980_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_6980_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c22_6980_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_c020_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l75_c6_c020_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4415_iftrue : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4415_iffalse : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4415_return_output : unsigned(0 downto 0);
 variable VAR_pending_frame_MUX_uxn_c_l75_c2_4415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_1f40_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_1f40_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_1f40_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_c643_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_c643_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_c643_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_fff2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_fff2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_fff2_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c54_fff2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c21_c643_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l80_c7_1f40_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_8d37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_8d37_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_8d37_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c15_8d37_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_da43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_da43_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_da43_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c23_da43_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_4d22_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_4d22_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l95_c3_10bf : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_1561_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_1561_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_1561_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l98_c9_1561_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_phase : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_controller0_buttons : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output : unsigned(11 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l100_c8_7fd1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_15dc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_7fd1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_7fd1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l100_c8_7fd1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_88fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_a499_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_c35f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_7b7d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_1f94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_0e44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_28d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_1b06_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_f889_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_f889_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l112_c6_f889_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iftrue : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l113_c3_adb2 : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iffalse : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output : unsigned(11 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_8804_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l115_c21_e99c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_8804_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_8804_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l115_c21_8804_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_e7aa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_1af8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_bc23_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_325e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff_uxn_c_l118_l63_DUPLICATE_22c9_return_output : cpu_step_result_t;
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
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_right := to_unsigned(1, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l75_c22_6980_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l75_c22_6980_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l113_c3_adb2 := resize(to_unsigned(0, 1), 12);
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iftrue := VAR_step_cpu_phase_uxn_c_l113_c3_adb2;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_right := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_right := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_4415_iftrue := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l81_c15_8d37_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l115_c21_8804_iftrue := resize(to_unsigned(0, 1), 12);
     VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_right := to_unsigned(2, 2);
     REG_VAR_pending_frame := to_unsigned(0, 1);
     VAR_pending_frame_MUX_uxn_c_l75_c2_4415_iffalse := pending_frame;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l82_c23_da43_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_left := VAR_controller0_buttons;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_controller0_buttons := VAR_controller0_buttons;
     REG_VAR_last_controller0 := VAR_controller0_buttons;
     VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_right := VAR_controller_vector;
     VAR_MUX_uxn_c_l80_c54_fff2_iftrue := VAR_controller_vector;
     VAR_MUX_uxn_c_l98_c9_1561_iffalse := ins;
     VAR_ins_MUX_uxn_c_l87_c2_31b2_iftrue := ins;
     VAR_ins_MUX_uxn_c_l94_c7_4d22_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l75_c6_c020_left := VAR_is_new_frame;
     VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_right := is_waiting;
     VAR_MUX_uxn_c_l80_c7_1f40_cond := is_waiting;
     VAR_MUX_uxn_c_l81_c15_8d37_iffalse := is_waiting;
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_right := last_controller0;
     VAR_MUX_uxn_c_l80_c54_fff2_iffalse := pc;
     VAR_MUX_uxn_c_l80_c7_1f40_iffalse := pc;
     VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_iffalse := pending_controller;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l98_c9_1561_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_previous_ram_read := VAR_previous_ram_read_value;
     VAR_MUX_uxn_c_l80_c21_c643_iftrue := VAR_screen_vector;
     VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_left := step_cpu_phase;
     -- BIN_OP_EQ[uxn_c_l87_c6_3a1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c6_3a1d_left <= VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_left;
     BIN_OP_EQ_uxn_c_l87_c6_3a1d_right <= VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output := BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;

     -- BIN_OP_NEQ[uxn_c_l71_c6_11bf] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c6_11bf_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_left;
     BIN_OP_NEQ_uxn_c_l71_c6_11bf_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output := BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l94_c7_4d22] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_4d22_return_output := cpu_step_result.is_ram_write;

     -- BIN_OP_MINUS[uxn_c_l99_c64_c797] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l99_c64_c797_left <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_left;
     BIN_OP_MINUS_uxn_c_l99_c64_c797_right <= VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output := BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output;

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l94_c7_4d22] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_4d22_return_output := cpu_step_result.is_device_ram_write;

     -- BIN_OP_PLUS[uxn_c_l115_c44_b700] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c44_b700_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_left;
     BIN_OP_PLUS_uxn_c_l115_c44_b700_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output := BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output;

     -- uint16_15_8[uxn_c_l75_c22_9f74] LATENCY=0
     VAR_uint16_15_8_uxn_c_l75_c22_9f74_return_output := uint16_15_8(
     VAR_screen_vector);

     -- BIN_OP_EQ[uxn_c_l94_c11_044c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l94_c11_044c_left <= VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_left;
     BIN_OP_EQ_uxn_c_l94_c11_044c_right <= VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output := BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_e7aa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_e7aa_return_output := cpu_step_result.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_bc23 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_bc23_return_output := cpu_step_result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_1af8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_1af8_return_output := cpu_step_result.u8_value;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l94_c7_4d22] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_4d22_return_output := cpu_step_result.is_vram_write;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l94_c7_4d22] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_4d22_return_output := cpu_step_result.u16_addr;

     -- BIN_OP_EQ[uxn_c_l98_c9_0aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l98_c9_0aa2_left <= VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_left;
     BIN_OP_EQ_uxn_c_l98_c9_0aa2_right <= VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output := BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output;

     -- uint16_15_8[uxn_c_l71_c49_e1a9] LATENCY=0
     VAR_uint16_15_8_uxn_c_l71_c49_e1a9_return_output := uint16_15_8(
     VAR_controller_vector);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_31b2_cond := VAR_BIN_OP_EQ_uxn_c_l87_c6_3a1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_pc_MUX_uxn_c_l94_c7_4d22_cond := VAR_BIN_OP_EQ_uxn_c_l94_c11_044c_return_output;
     VAR_MUX_uxn_c_l98_c9_1561_cond := VAR_BIN_OP_EQ_uxn_c_l98_c9_0aa2_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_phase := VAR_BIN_OP_MINUS_uxn_c_l99_c64_c797_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_left := VAR_BIN_OP_NEQ_uxn_c_l71_c6_11bf_return_output;
     VAR_MUX_uxn_c_l115_c21_8804_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c44_b700_return_output, 12);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_bc23_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l94_l87_DUPLICATE_bc23_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_e7aa_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l94_l87_DUPLICATE_e7aa_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_1af8_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l94_l87_DUPLICATE_1af8_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l94_c7_4d22_return_output;
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_left := VAR_uint16_15_8_uxn_c_l71_c49_e1a9_return_output;
     VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_left := VAR_uint16_15_8_uxn_c_l75_c22_9f74_return_output;
     -- BIN_OP_NEQ[uxn_c_l71_c49_edcb] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l71_c49_edcb_left <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_left;
     BIN_OP_NEQ_uxn_c_l71_c49_edcb_right <= VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output := BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output;

     -- MUX[uxn_c_l98_c9_1561] LATENCY=0
     -- Inputs
     MUX_uxn_c_l98_c9_1561_cond <= VAR_MUX_uxn_c_l98_c9_1561_cond;
     MUX_uxn_c_l98_c9_1561_iftrue <= VAR_MUX_uxn_c_l98_c9_1561_iftrue;
     MUX_uxn_c_l98_c9_1561_iffalse <= VAR_MUX_uxn_c_l98_c9_1561_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l98_c9_1561_return_output := MUX_uxn_c_l98_c9_1561_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c22_8455] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c22_8455_left <= VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_left;
     BIN_OP_EQ_uxn_c_l75_c22_8455_right <= VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_return_output := BIN_OP_EQ_uxn_c_l75_c22_8455_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l75_c22_6980_cond := VAR_BIN_OP_EQ_uxn_c_l75_c22_8455_return_output;
     VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_right := VAR_BIN_OP_NEQ_uxn_c_l71_c49_edcb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_ins := VAR_MUX_uxn_c_l98_c9_1561_return_output;
     VAR_ins_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_MUX_uxn_c_l98_c9_1561_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l97_c1_f78a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output;

     -- ins_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l94_c7_4d22_cond <= VAR_ins_MUX_uxn_c_l94_c7_4d22_cond;
     ins_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_ins_MUX_uxn_c_l94_c7_4d22_iftrue;
     ins_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_ins_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l94_c7_4d22_return_output := ins_MUX_uxn_c_l94_c7_4d22_return_output;

     -- BIN_OP_AND[uxn_c_l71_c6_b9a7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l71_c6_b9a7_left <= VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_left;
     BIN_OP_AND_uxn_c_l71_c6_b9a7_right <= VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output := BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output;

     -- MUX[uxn_c_l75_c22_6980] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c22_6980_cond <= VAR_MUX_uxn_c_l75_c22_6980_cond;
     MUX_uxn_c_l75_c22_6980_iftrue <= VAR_MUX_uxn_c_l75_c22_6980_iftrue;
     MUX_uxn_c_l75_c22_6980_iffalse <= VAR_MUX_uxn_c_l75_c22_6980_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c22_6980_return_output := MUX_uxn_c_l75_c22_6980_return_output;

     -- Submodule level 3
     VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_cond := VAR_BIN_OP_AND_uxn_c_l71_c6_b9a7_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l97_c1_f78a_return_output;
     VAR_BIN_OP_AND_uxn_c_l75_c6_c020_right := VAR_MUX_uxn_c_l75_c22_6980_return_output;
     VAR_ins_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_ins_MUX_uxn_c_l94_c7_4d22_return_output;
     -- BIN_OP_AND[uxn_c_l75_c6_c020] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l75_c6_c020_left <= VAR_BIN_OP_AND_uxn_c_l75_c6_c020_left;
     BIN_OP_AND_uxn_c_l75_c6_c020_right <= VAR_BIN_OP_AND_uxn_c_l75_c6_c020_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l75_c6_c020_return_output := BIN_OP_AND_uxn_c_l75_c6_c020_return_output;

     -- pending_controller_MUX[uxn_c_l71_c2_5d42] LATENCY=0
     -- Inputs
     pending_controller_MUX_uxn_c_l71_c2_5d42_cond <= VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_cond;
     pending_controller_MUX_uxn_c_l71_c2_5d42_iftrue <= VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_iftrue;
     pending_controller_MUX_uxn_c_l71_c2_5d42_iffalse <= VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_iffalse;
     -- Outputs
     VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_return_output := pending_controller_MUX_uxn_c_l71_c2_5d42_return_output;

     -- ins_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l87_c2_31b2_cond <= VAR_ins_MUX_uxn_c_l87_c2_31b2_cond;
     ins_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_ins_MUX_uxn_c_l87_c2_31b2_iftrue;
     ins_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_ins_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l87_c2_31b2_return_output := ins_MUX_uxn_c_l87_c2_31b2_return_output;

     -- Submodule level 4
     VAR_pending_frame_MUX_uxn_c_l75_c2_4415_cond := VAR_BIN_OP_AND_uxn_c_l75_c6_c020_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l87_c2_31b2_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_right := VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_return_output;
     VAR_MUX_uxn_c_l80_c54_fff2_cond := VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_return_output;
     VAR_MUX_uxn_c_l82_c23_da43_iffalse := VAR_pending_controller_MUX_uxn_c_l71_c2_5d42_return_output;
     -- pending_frame_MUX[uxn_c_l75_c2_4415] LATENCY=0
     -- Inputs
     pending_frame_MUX_uxn_c_l75_c2_4415_cond <= VAR_pending_frame_MUX_uxn_c_l75_c2_4415_cond;
     pending_frame_MUX_uxn_c_l75_c2_4415_iftrue <= VAR_pending_frame_MUX_uxn_c_l75_c2_4415_iftrue;
     pending_frame_MUX_uxn_c_l75_c2_4415_iffalse <= VAR_pending_frame_MUX_uxn_c_l75_c2_4415_iffalse;
     -- Outputs
     VAR_pending_frame_MUX_uxn_c_l75_c2_4415_return_output := pending_frame_MUX_uxn_c_l75_c2_4415_return_output;

     -- MUX[uxn_c_l80_c54_fff2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c54_fff2_cond <= VAR_MUX_uxn_c_l80_c54_fff2_cond;
     MUX_uxn_c_l80_c54_fff2_iftrue <= VAR_MUX_uxn_c_l80_c54_fff2_iftrue;
     MUX_uxn_c_l80_c54_fff2_iffalse <= VAR_MUX_uxn_c_l80_c54_fff2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c54_fff2_return_output := MUX_uxn_c_l80_c54_fff2_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_c_l80_c21_c643_iffalse := VAR_MUX_uxn_c_l80_c54_fff2_return_output;
     VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_left := VAR_pending_frame_MUX_uxn_c_l75_c2_4415_return_output;
     VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_left := VAR_pending_frame_MUX_uxn_c_l75_c2_4415_return_output;
     VAR_MUX_uxn_c_l80_c21_c643_cond := VAR_pending_frame_MUX_uxn_c_l75_c2_4415_return_output;
     -- MUX[uxn_c_l80_c21_c643] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c21_c643_cond <= VAR_MUX_uxn_c_l80_c21_c643_cond;
     MUX_uxn_c_l80_c21_c643_iftrue <= VAR_MUX_uxn_c_l80_c21_c643_iftrue;
     MUX_uxn_c_l80_c21_c643_iffalse <= VAR_MUX_uxn_c_l80_c21_c643_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c21_c643_return_output := MUX_uxn_c_l80_c21_c643_return_output;

     -- BIN_OP_OR[uxn_c_l81_c15_8c7d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l81_c15_8c7d_left <= VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_left;
     BIN_OP_OR_uxn_c_l81_c15_8c7d_right <= VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output := BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output;

     -- BIN_OP_AND[uxn_c_l79_c33_37ea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l79_c33_37ea_left <= VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_left;
     BIN_OP_AND_uxn_c_l79_c33_37ea_right <= VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_return_output := BIN_OP_AND_uxn_c_l79_c33_37ea_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l81_c15_8d37_cond := VAR_BIN_OP_OR_uxn_c_l81_c15_8c7d_return_output;
     VAR_MUX_uxn_c_l80_c7_1f40_iftrue := VAR_MUX_uxn_c_l80_c21_c643_return_output;
     -- MUX[uxn_c_l80_c7_1f40] LATENCY=0
     -- Inputs
     MUX_uxn_c_l80_c7_1f40_cond <= VAR_MUX_uxn_c_l80_c7_1f40_cond;
     MUX_uxn_c_l80_c7_1f40_iftrue <= VAR_MUX_uxn_c_l80_c7_1f40_iftrue;
     MUX_uxn_c_l80_c7_1f40_iffalse <= VAR_MUX_uxn_c_l80_c7_1f40_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l80_c7_1f40_return_output := MUX_uxn_c_l80_c7_1f40_return_output;

     -- MUX[uxn_c_l81_c15_8d37] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c15_8d37_cond <= VAR_MUX_uxn_c_l81_c15_8d37_cond;
     MUX_uxn_c_l81_c15_8d37_iftrue <= VAR_MUX_uxn_c_l81_c15_8d37_iftrue;
     MUX_uxn_c_l81_c15_8d37_iffalse <= VAR_MUX_uxn_c_l81_c15_8d37_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c15_8d37_return_output := MUX_uxn_c_l81_c15_8d37_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_left := VAR_MUX_uxn_c_l80_c7_1f40_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_left := VAR_MUX_uxn_c_l80_c7_1f40_return_output;
     VAR_MUX_uxn_c_l100_c8_7fd1_iffalse := VAR_MUX_uxn_c_l80_c7_1f40_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iftrue := VAR_MUX_uxn_c_l80_c7_1f40_return_output;
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_pc := VAR_MUX_uxn_c_l80_c7_1f40_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_31b2_iftrue := VAR_MUX_uxn_c_l80_c7_1f40_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_iftrue := VAR_MUX_uxn_c_l81_c15_8d37_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_MUX_uxn_c_l81_c15_8d37_return_output;
     -- BIN_OP_PLUS[uxn_c_l95_c3_a2da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_a2da_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_left;
     BIN_OP_PLUS_uxn_c_l95_c3_a2da_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output := BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output;

     -- eval_opcode_phased[uxn_c_l99_c45_1fea] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l99_c45_1fea_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l99_c45_1fea_phase <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_phase;
     eval_opcode_phased_uxn_c_l99_c45_1fea_ins <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_ins;
     eval_opcode_phased_uxn_c_l99_c45_1fea_pc <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_pc;
     eval_opcode_phased_uxn_c_l99_c45_1fea_controller0_buttons <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_controller0_buttons;
     eval_opcode_phased_uxn_c_l99_c45_1fea_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_previous_ram_read;
     eval_opcode_phased_uxn_c_l99_c45_1fea_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output := eval_opcode_phased_uxn_c_l99_c45_1fea_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c23_24cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c23_24cd_left <= VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_left;
     BIN_OP_EQ_uxn_c_l82_c23_24cd_right <= VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output := BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l82_c23_da43_cond := VAR_BIN_OP_EQ_uxn_c_l82_c23_24cd_return_output;
     VAR_pc_uxn_c_l95_c3_10bf := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_a2da_return_output, 16);
     VAR_pc_MUX_uxn_c_l94_c7_4d22_iftrue := VAR_pc_uxn_c_l95_c3_10bf;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l101_c34_88fb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_88fb_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_325e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_325e_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l104_c38_c35f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_c35f_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l103_c35_a499] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_a499_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.is_vram_write;

     -- MUX[uxn_c_l82_c23_da43] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c23_da43_cond <= VAR_MUX_uxn_c_l82_c23_da43_cond;
     MUX_uxn_c_l82_c23_da43_iftrue <= VAR_MUX_uxn_c_l82_c23_da43_iftrue;
     MUX_uxn_c_l82_c23_da43_iffalse <= VAR_MUX_uxn_c_l82_c23_da43_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c23_da43_return_output := MUX_uxn_c_l82_c23_da43_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l100_c8_15dc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_15dc_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l105_c40_7b7d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_7b7d_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l108_c16_28d1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_28d1_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l106_c41_1f94] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_1f94_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l107_c30_0e44] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_0e44_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l109_c17_1b06] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_1b06_return_output := VAR_eval_opcode_phased_uxn_c_l99_c45_1fea_return_output.is_opc_done;

     -- Submodule level 9
     VAR_MUX_uxn_c_l100_c8_7fd1_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_325e_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l102_l100_DUPLICATE_325e_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l106_c41_1f94_return_output;
     VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l109_c17_1b06_return_output;
     VAR_MUX_uxn_c_l100_c8_7fd1_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l100_c8_15dc_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l101_c34_88fb_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l103_c35_a499_return_output;
     VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l108_c16_28d1_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l104_c38_c35f_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l105_c40_7b7d_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l107_c30_0e44_return_output;
     REG_VAR_pending_controller := VAR_MUX_uxn_c_l82_c23_da43_return_output;
     -- MUX[uxn_c_l100_c8_7fd1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l100_c8_7fd1_cond <= VAR_MUX_uxn_c_l100_c8_7fd1_cond;
     MUX_uxn_c_l100_c8_7fd1_iftrue <= VAR_MUX_uxn_c_l100_c8_7fd1_iftrue;
     MUX_uxn_c_l100_c8_7fd1_iffalse <= VAR_MUX_uxn_c_l100_c8_7fd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l100_c8_7fd1_return_output := MUX_uxn_c_l100_c8_7fd1_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output;

     -- is_ins_done_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l94_c7_4d22_cond <= VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_cond;
     is_ins_done_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_iftrue;
     is_ins_done_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output := is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output;

     -- is_waiting_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l94_c7_4d22_cond <= VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_cond;
     is_waiting_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_iftrue;
     is_waiting_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_return_output := is_waiting_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output;

     -- Submodule level 10
     VAR_pc_MUX_uxn_c_l94_c7_4d22_iffalse := VAR_MUX_uxn_c_l100_c8_7fd1_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_is_ins_done_MUX_uxn_c_l94_c7_4d22_return_output;
     VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_is_waiting_MUX_uxn_c_l94_c7_4d22_return_output;
     -- is_ins_done_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l87_c2_31b2_cond <= VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_cond;
     is_ins_done_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_iftrue;
     is_ins_done_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output := is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output;

     -- pc_MUX[uxn_c_l94_c7_4d22] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l94_c7_4d22_cond <= VAR_pc_MUX_uxn_c_l94_c7_4d22_cond;
     pc_MUX_uxn_c_l94_c7_4d22_iftrue <= VAR_pc_MUX_uxn_c_l94_c7_4d22_iftrue;
     pc_MUX_uxn_c_l94_c7_4d22_iffalse <= VAR_pc_MUX_uxn_c_l94_c7_4d22_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l94_c7_4d22_return_output := pc_MUX_uxn_c_l94_c7_4d22_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output;

     -- is_waiting_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l87_c2_31b2_cond <= VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_cond;
     is_waiting_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_iftrue;
     is_waiting_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_return_output := is_waiting_MUX_uxn_c_l87_c2_31b2_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l112_c6_f889_left := VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l87_c2_31b2_return_output;
     VAR_BIN_OP_OR_uxn_c_l112_c6_f889_right := VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l87_c2_31b2_return_output;
     VAR_pc_MUX_uxn_c_l87_c2_31b2_iffalse := VAR_pc_MUX_uxn_c_l94_c7_4d22_return_output;
     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff_uxn_c_l118_l63_DUPLICATE_22c9 LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff_uxn_c_l118_l63_DUPLICATE_22c9_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff(
     VAR_BIN_OP_AND_uxn_c_l79_c33_37ea_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l87_c2_31b2_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l87_c2_31b2_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l87_c2_31b2_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l87_c2_31b2_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l87_c2_31b2_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l87_c2_31b2_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l87_c2_31b2_return_output);

     -- pc_MUX[uxn_c_l87_c2_31b2] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l87_c2_31b2_cond <= VAR_pc_MUX_uxn_c_l87_c2_31b2_cond;
     pc_MUX_uxn_c_l87_c2_31b2_iftrue <= VAR_pc_MUX_uxn_c_l87_c2_31b2_iftrue;
     pc_MUX_uxn_c_l87_c2_31b2_iffalse <= VAR_pc_MUX_uxn_c_l87_c2_31b2_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l87_c2_31b2_return_output := pc_MUX_uxn_c_l87_c2_31b2_return_output;

     -- BIN_OP_OR[uxn_c_l112_c6_f889] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l112_c6_f889_left <= VAR_BIN_OP_OR_uxn_c_l112_c6_f889_left;
     BIN_OP_OR_uxn_c_l112_c6_f889_right <= VAR_BIN_OP_OR_uxn_c_l112_c6_f889_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l112_c6_f889_return_output := BIN_OP_OR_uxn_c_l112_c6_f889_return_output;

     -- Submodule level 12
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_cond := VAR_BIN_OP_OR_uxn_c_l112_c6_f889_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff_uxn_c_l118_l63_DUPLICATE_22c9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_6bff_uxn_c_l118_l63_DUPLICATE_22c9_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l87_c2_31b2_return_output;
     -- uint16_15_8[uxn_c_l115_c21_e99c] LATENCY=0
     VAR_uint16_15_8_uxn_c_l115_c21_e99c_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l87_c2_31b2_return_output);

     -- Submodule level 13
     VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_left := VAR_uint16_15_8_uxn_c_l115_c21_e99c_return_output;
     -- BIN_OP_EQ[uxn_c_l115_c21_a153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l115_c21_a153_left <= VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_left;
     BIN_OP_EQ_uxn_c_l115_c21_a153_right <= VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_return_output := BIN_OP_EQ_uxn_c_l115_c21_a153_return_output;

     -- Submodule level 14
     VAR_MUX_uxn_c_l115_c21_8804_cond := VAR_BIN_OP_EQ_uxn_c_l115_c21_a153_return_output;
     -- MUX[uxn_c_l115_c21_8804] LATENCY=0
     -- Inputs
     MUX_uxn_c_l115_c21_8804_cond <= VAR_MUX_uxn_c_l115_c21_8804_cond;
     MUX_uxn_c_l115_c21_8804_iftrue <= VAR_MUX_uxn_c_l115_c21_8804_iftrue;
     MUX_uxn_c_l115_c21_8804_iffalse <= VAR_MUX_uxn_c_l115_c21_8804_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l115_c21_8804_return_output := MUX_uxn_c_l115_c21_8804_return_output;

     -- Submodule level 15
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iffalse := VAR_MUX_uxn_c_l115_c21_8804_return_output;
     -- step_cpu_phase_MUX[uxn_c_l112_c2_a5fa] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_cond <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_cond;
     step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iftrue;
     step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output := step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output;

     -- Submodule level 16
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l112_c2_a5fa_return_output;
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
