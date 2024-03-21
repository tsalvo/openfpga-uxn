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
-- Submodules: 73
entity deo2_0CLK_8faca1d2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_8faca1d2;
architecture arch of deo2_0CLK_8faca1d2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_deo_phase : unsigned(11 downto 0) := to_unsigned(0, 12);
signal is_second_deo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_3 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_4 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(11 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_is_phase_3 : unsigned(0 downto 0);
signal REG_COMB_is_phase_4 : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l540_c6_f240]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_218e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c2_47b5]
signal n8_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c2_47b5]
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l540_c2_47b5]
signal t8_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l540_c2_47b5]
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l540_c2_47b5]
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l540_c2_47b5]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l540_c2_47b5]
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l540_c2_47b5]
signal result_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : opcode_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_47b5]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(11 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c2_47b5]
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l540_c2_47b5]
signal l8_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l555_c11_f077]
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_fab7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l555_c7_218e]
signal n8_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l555_c7_218e]
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l555_c7_218e]
signal t8_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l555_c7_218e]
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l555_c7_218e]
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l555_c7_218e]
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l555_c7_218e]
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_218e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_218e]
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(11 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l555_c7_218e]
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l555_c7_218e]
signal l8_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l558_c11_a0c9]
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_8dad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l558_c7_fab7]
signal n8_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l558_c7_fab7]
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l558_c7_fab7]
signal t8_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l558_c7_fab7]
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l558_c7_fab7]
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l558_c7_fab7]
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l558_c7_fab7]
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_fab7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_fab7]
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(11 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l558_c7_fab7]
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l558_c7_fab7]
signal l8_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_ba93]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_3ce8]
signal MUX_uxn_opcodes_h_l563_c17_3ce8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_3ce8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_3ce8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_3ce8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l564_c17_edca]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c17_ba34]
signal MUX_uxn_opcodes_h_l564_c17_ba34_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_ba34_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_ba34_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_ba34_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_2af5]
signal MUX_uxn_opcodes_h_l565_c8_2af5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_2af5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_2af5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_2af5_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l566_c8_5e52]
signal MUX_uxn_opcodes_h_l566_c8_5e52_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_5e52_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_5e52_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_5e52_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_b1ab]
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_a305]
signal MUX_uxn_opcodes_h_l567_c16_a305_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_a305_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_a305_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_a305_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l568_c16_b68e]
signal MUX_uxn_opcodes_h_l568_c16_b68e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_b68e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_b68e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_b68e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l569_c43_5e9e]
signal sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l569_c30_e84e]
signal MUX_uxn_opcodes_h_l569_c30_e84e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_e84e_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_e84e_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_e84e_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l570_c23_4cb3]
signal device_out_uxn_opcodes_h_l570_c23_4cb3_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_4cb3_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_4cb3_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_4cb3_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_4cb3_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_4cb3_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_4cb3_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l577_c24_2b2e]
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c3_a9ad]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_a9ad]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_0713]
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output : unsigned(12 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_0773( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240
BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c2_47b5
n8_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
n8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
n8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5
device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c2_47b5
t8_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
t8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
t8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5
is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5
deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5
is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5
is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- result_MUX_uxn_opcodes_h_l540_c2_47b5
result_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5
deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c2_47b5
l8_MUX_uxn_opcodes_h_l540_c2_47b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c2_47b5_cond,
l8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue,
l8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse,
l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077
BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_left,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_right,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- n8_MUX_uxn_opcodes_h_l555_c7_218e
n8_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l555_c7_218e_cond,
n8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
n8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l555_c7_218e
device_out_result_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_cond,
device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- t8_MUX_uxn_opcodes_h_l555_c7_218e
t8_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l555_c7_218e_cond,
t8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
t8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e
is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_cond,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l555_c7_218e
deo_param1_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_cond,
deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e
is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_cond,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e
is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_cond,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e
result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e
result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l555_c7_218e
deo_param0_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_cond,
deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- l8_MUX_uxn_opcodes_h_l555_c7_218e
l8_MUX_uxn_opcodes_h_l555_c7_218e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l555_c7_218e_cond,
l8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue,
l8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse,
l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_left,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_right,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output);

-- n8_MUX_uxn_opcodes_h_l558_c7_fab7
n8_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
n8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
n8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7
device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- t8_MUX_uxn_opcodes_h_l558_c7_fab7
t8_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
t8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
t8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7
is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7
deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7
is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7
is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7
result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7
result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7
deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- l8_MUX_uxn_opcodes_h_l558_c7_fab7
l8_MUX_uxn_opcodes_h_l558_c7_fab7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l558_c7_fab7_cond,
l8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue,
l8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse,
l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93
BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output);

-- MUX_uxn_opcodes_h_l563_c17_3ce8
MUX_uxn_opcodes_h_l563_c17_3ce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_3ce8_cond,
MUX_uxn_opcodes_h_l563_c17_3ce8_iftrue,
MUX_uxn_opcodes_h_l563_c17_3ce8_iffalse,
MUX_uxn_opcodes_h_l563_c17_3ce8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca
BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output);

-- MUX_uxn_opcodes_h_l564_c17_ba34
MUX_uxn_opcodes_h_l564_c17_ba34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c17_ba34_cond,
MUX_uxn_opcodes_h_l564_c17_ba34_iftrue,
MUX_uxn_opcodes_h_l564_c17_ba34_iffalse,
MUX_uxn_opcodes_h_l564_c17_ba34_return_output);

-- MUX_uxn_opcodes_h_l565_c8_2af5
MUX_uxn_opcodes_h_l565_c8_2af5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_2af5_cond,
MUX_uxn_opcodes_h_l565_c8_2af5_iftrue,
MUX_uxn_opcodes_h_l565_c8_2af5_iffalse,
MUX_uxn_opcodes_h_l565_c8_2af5_return_output);

-- MUX_uxn_opcodes_h_l566_c8_5e52
MUX_uxn_opcodes_h_l566_c8_5e52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c8_5e52_cond,
MUX_uxn_opcodes_h_l566_c8_5e52_iftrue,
MUX_uxn_opcodes_h_l566_c8_5e52_iffalse,
MUX_uxn_opcodes_h_l566_c8_5e52_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_left,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_right,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output);

-- MUX_uxn_opcodes_h_l567_c16_a305
MUX_uxn_opcodes_h_l567_c16_a305 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_a305_cond,
MUX_uxn_opcodes_h_l567_c16_a305_iftrue,
MUX_uxn_opcodes_h_l567_c16_a305_iffalse,
MUX_uxn_opcodes_h_l567_c16_a305_return_output);

-- MUX_uxn_opcodes_h_l568_c16_b68e
MUX_uxn_opcodes_h_l568_c16_b68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c16_b68e_cond,
MUX_uxn_opcodes_h_l568_c16_b68e_iftrue,
MUX_uxn_opcodes_h_l568_c16_b68e_iffalse,
MUX_uxn_opcodes_h_l568_c16_b68e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e
sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_ins,
sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_x,
sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_y,
sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output);

-- MUX_uxn_opcodes_h_l569_c30_e84e
MUX_uxn_opcodes_h_l569_c30_e84e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l569_c30_e84e_cond,
MUX_uxn_opcodes_h_l569_c30_e84e_iftrue,
MUX_uxn_opcodes_h_l569_c30_e84e_iffalse,
MUX_uxn_opcodes_h_l569_c30_e84e_return_output);

-- device_out_uxn_opcodes_h_l570_c23_4cb3
device_out_uxn_opcodes_h_l570_c23_4cb3 : entity work.device_out_0CLK_f7f35190 port map (
clk,
device_out_uxn_opcodes_h_l570_c23_4cb3_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l570_c23_4cb3_device_address,
device_out_uxn_opcodes_h_l570_c23_4cb3_value,
device_out_uxn_opcodes_h_l570_c23_4cb3_phase,
device_out_uxn_opcodes_h_l570_c23_4cb3_previous_device_ram_read,
device_out_uxn_opcodes_h_l570_c23_4cb3_previous_ram_read,
device_out_uxn_opcodes_h_l570_c23_4cb3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e
BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_left,
BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_right,
BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad
is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_left,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_right,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 l8,
 deo_param0,
 deo_param1,
 current_deo_phase,
 is_second_deo,
 is_phase_3,
 is_phase_4,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output,
 n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output,
 MUX_uxn_opcodes_h_l563_c17_3ce8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output,
 MUX_uxn_opcodes_h_l564_c17_ba34_return_output,
 MUX_uxn_opcodes_h_l565_c8_2af5_return_output,
 MUX_uxn_opcodes_h_l566_c8_5e52_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output,
 MUX_uxn_opcodes_h_l567_c16_a305_return_output,
 MUX_uxn_opcodes_h_l568_c16_b68e_return_output,
 sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output,
 MUX_uxn_opcodes_h_l569_c30_e84e_return_output,
 device_out_uxn_opcodes_h_l570_c23_4cb3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_47b5_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0773_uxn_opcodes_h_l540_c2_47b5_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l553_c3_a031 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_74ac : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_4928 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_0b78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_1517 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_fab7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_ba34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_ba34_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_ba34_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_ba34_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2af5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2af5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2af5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2af5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5e52_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5e52_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5e52_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5e52_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a305_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a305_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a305_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a305_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_b68e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_b68e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_b68e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_b68e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_e84e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_e84e_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_e84e_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_e84e_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_3d54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_fa42_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_73e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_852d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_9826_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_5ea5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l579_c4_bc43 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l582_c4_fe58 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output : unsigned(12 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_226f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7b95_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ebfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ad18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_df70_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_d5a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7991_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_417c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_b7df_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(11 downto 0);
variable REG_VAR_is_second_deo : unsigned(0 downto 0);
variable REG_VAR_is_phase_3 : unsigned(0 downto 0);
variable REG_VAR_is_phase_4 : unsigned(0 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_deo_param0 := deo_param0;
  REG_VAR_deo_param1 := deo_param1;
  REG_VAR_current_deo_phase := current_deo_phase;
  REG_VAR_is_second_deo := is_second_deo;
  REG_VAR_is_phase_3 := is_phase_3;
  REG_VAR_is_phase_4 := is_phase_4;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_4928 := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l569_c30_e84e_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_0b78 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_0b78;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_74ac := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_1517 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_1517;
     VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l564_c17_ba34_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l564_c17_ba34_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l579_c4_bc43 := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l579_c4_bc43;
     VAR_current_deo_phase_uxn_opcodes_h_l553_c3_a031 := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l553_c3_a031;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_a305_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l568_c16_b68e_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l565_c8_2af5_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l566_c8_5e52_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_2af5_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l566_c8_5e52_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_left := t8;
     VAR_MUX_uxn_opcodes_h_l567_c16_a305_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l555_c11_f077] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_left;
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output := BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ad18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ad18_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7991 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7991_return_output := result.is_opc_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_47b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_74ac,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_4928,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_b1ab] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_left;
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output := BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_226f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_226f_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_d5a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_d5a4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c6_f240] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l558_c11_a0c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ebfc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ebfc_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_fab7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_0713] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_left;
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output := BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_417c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_417c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c17_edca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_df70 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_df70_return_output := result.device_ram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7b95 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7b95_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_ba93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l569_c43_5e9e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_ins;
     sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_x;
     sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output := sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_f240_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_f077_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a0c9_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_ba93_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c17_ba34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_edca_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_a305_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_b1ab_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l582_c4_fe58 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_0713_return_output, 12);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7b95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7b95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ebfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ebfc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ad18_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_ad18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_7991_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_417c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_417c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_226f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_226f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_df70_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_df70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_d5a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l558_l555_DUPLICATE_d5a4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_e84e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_5e9e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l582_c4_fe58;
     -- t8_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     t8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     t8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_3ce8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_3ce8_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_cond;
     MUX_uxn_opcodes_h_l563_c17_3ce8_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_iftrue;
     MUX_uxn_opcodes_h_l563_c17_3ce8_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_return_output := MUX_uxn_opcodes_h_l563_c17_3ce8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- MUX[uxn_opcodes_h_l564_c17_ba34] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c17_ba34_cond <= VAR_MUX_uxn_opcodes_h_l564_c17_ba34_cond;
     MUX_uxn_opcodes_h_l564_c17_ba34_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c17_ba34_iftrue;
     MUX_uxn_opcodes_h_l564_c17_ba34_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c17_ba34_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c17_ba34_return_output := MUX_uxn_opcodes_h_l564_c17_ba34_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_a305] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_a305_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_a305_cond;
     MUX_uxn_opcodes_h_l567_c16_a305_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_a305_iftrue;
     MUX_uxn_opcodes_h_l567_c16_a305_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_a305_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_a305_return_output := MUX_uxn_opcodes_h_l567_c16_a305_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_2af5_cond := VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_e84e_cond := VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_3ce8_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c8_5e52_cond := VAR_MUX_uxn_opcodes_h_l564_c17_ba34_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l564_c17_ba34_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_a305_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_device_address := VAR_MUX_uxn_opcodes_h_l567_c16_a305_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- MUX[uxn_opcodes_h_l566_c8_5e52] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c8_5e52_cond <= VAR_MUX_uxn_opcodes_h_l566_c8_5e52_cond;
     MUX_uxn_opcodes_h_l566_c8_5e52_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c8_5e52_iftrue;
     MUX_uxn_opcodes_h_l566_c8_5e52_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c8_5e52_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c8_5e52_return_output := MUX_uxn_opcodes_h_l566_c8_5e52_return_output;

     -- t8_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     t8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     t8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output := t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- MUX[uxn_opcodes_h_l569_c30_e84e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l569_c30_e84e_cond <= VAR_MUX_uxn_opcodes_h_l569_c30_e84e_cond;
     MUX_uxn_opcodes_h_l569_c30_e84e_iftrue <= VAR_MUX_uxn_opcodes_h_l569_c30_e84e_iftrue;
     MUX_uxn_opcodes_h_l569_c30_e84e_iffalse <= VAR_MUX_uxn_opcodes_h_l569_c30_e84e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l569_c30_e84e_return_output := MUX_uxn_opcodes_h_l569_c30_e84e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_2af5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_2af5_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_2af5_cond;
     MUX_uxn_opcodes_h_l565_c8_2af5_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_2af5_iftrue;
     MUX_uxn_opcodes_h_l565_c8_2af5_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_2af5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_2af5_return_output := MUX_uxn_opcodes_h_l565_c8_2af5_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_b68e_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_2af5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_2af5_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_b68e_iftrue := VAR_MUX_uxn_opcodes_h_l566_c8_5e52_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l566_c8_5e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l569_c30_e84e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     -- l8_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     l8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     l8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output := is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output := is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_8dad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output;

     -- n8_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     n8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     n8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output := deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- MUX[uxn_opcodes_h_l568_c16_b68e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c16_b68e_cond <= VAR_MUX_uxn_opcodes_h_l568_c16_b68e_cond;
     MUX_uxn_opcodes_h_l568_c16_b68e_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c16_b68e_iftrue;
     MUX_uxn_opcodes_h_l568_c16_b68e_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c16_b68e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c16_b68e_return_output := MUX_uxn_opcodes_h_l568_c16_b68e_return_output;

     -- t8_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     t8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_8dad_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_MUX_uxn_opcodes_h_l568_c16_b68e_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_value := VAR_MUX_uxn_opcodes_h_l568_c16_b68e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     -- l8_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     l8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     l8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output := l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- n8_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     n8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     n8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output := n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- device_out[uxn_opcodes_h_l570_c23_4cb3] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l570_c23_4cb3_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l570_c23_4cb3_device_address <= VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_device_address;
     device_out_uxn_opcodes_h_l570_c23_4cb3_value <= VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_value;
     device_out_uxn_opcodes_h_l570_c23_4cb3_phase <= VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_phase;
     device_out_uxn_opcodes_h_l570_c23_4cb3_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_previous_device_ram_read;
     device_out_uxn_opcodes_h_l570_c23_4cb3_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output := device_out_uxn_opcodes_h_l570_c23_4cb3_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l575_c22_9826] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_9826_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.u16_addr;

     -- l8_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     l8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l571_c32_3d54] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_3d54_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_b7df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_b7df_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l573_c26_73e8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_73e8_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l572_c31_fa42] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_fa42_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l574_c29_852d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_852d_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.vram_write_layer;

     -- deo_param1_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output := deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l576_c21_5ea5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_5ea5_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_4cb3_return_output.u8_value;

     -- n8_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     n8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_9826_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_b7df_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_b7df_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_b7df_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_3d54_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_73e8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_852d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_fa42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_5ea5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c3_a9ad] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l577_c24_2b2e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_left;
     BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output := BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_a9ad] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output := device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_2b2e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_a9ad_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_fab7] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output := current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_fab7_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l555_c7_218e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output := is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_218e_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0773[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0773_uxn_opcodes_h_l540_c2_47b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0773(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_218e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_218e_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0773_uxn_opcodes_h_l540_c2_47b5_return_output;
     -- result_MUX[uxn_opcodes_h_l540_c2_47b5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l540_c2_47b5_cond <= VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_cond;
     result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_iftrue;
     result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output := result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l540_c2_47b5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_deo_param0 <= REG_VAR_deo_param0;
REG_COMB_deo_param1 <= REG_VAR_deo_param1;
REG_COMB_current_deo_phase <= REG_VAR_current_deo_phase;
REG_COMB_is_second_deo <= REG_VAR_is_second_deo;
REG_COMB_is_phase_3 <= REG_VAR_is_phase_3;
REG_COMB_is_phase_4 <= REG_VAR_is_phase_4;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     deo_param0 <= REG_COMB_deo_param0;
     deo_param1 <= REG_COMB_deo_param1;
     current_deo_phase <= REG_COMB_current_deo_phase;
     is_second_deo <= REG_COMB_is_second_deo;
     is_phase_3 <= REG_COMB_is_phase_3;
     is_phase_4 <= REG_COMB_is_phase_4;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
