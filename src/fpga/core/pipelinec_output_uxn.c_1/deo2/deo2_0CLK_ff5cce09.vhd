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
entity deo2_0CLK_ff5cce09 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_ff5cce09;
architecture arch of deo2_0CLK_ff5cce09 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l540_c6_1fbb]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_faf6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(11 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal n8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal l8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal t8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : opcode_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l540_c2_d6ab]
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l555_c11_47e3]
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l555_c7_faf6]
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_faf6]
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(11 downto 0);

-- n8_MUX[uxn_opcodes_h_l555_c7_faf6]
signal n8_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l555_c7_faf6]
signal l8_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l555_c7_faf6]
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l555_c7_faf6]
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l555_c7_faf6]
signal t8_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l555_c7_faf6]
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l555_c7_faf6]
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_faf6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l555_c7_faf6]
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l558_c11_a1e5]
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_5c70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(11 downto 0);

-- n8_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal n8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal l8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal t8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l558_c7_2bcf]
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_7899]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_b73b]
signal MUX_uxn_opcodes_h_l563_c17_b73b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_b73b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_b73b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_b73b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l564_c17_336b]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c17_53b9]
signal MUX_uxn_opcodes_h_l564_c17_53b9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_53b9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_53b9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_53b9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_0c73]
signal MUX_uxn_opcodes_h_l565_c8_0c73_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_0c73_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_0c73_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_0c73_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l566_c8_2066]
signal MUX_uxn_opcodes_h_l566_c8_2066_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_2066_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_2066_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_2066_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_8e0a]
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_1ac3]
signal MUX_uxn_opcodes_h_l567_c16_1ac3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_1ac3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_1ac3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_1ac3_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l568_c16_1e0c]
signal MUX_uxn_opcodes_h_l568_c16_1e0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_1e0c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_1e0c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_1e0c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l569_c43_11b2]
signal sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l569_c30_3082]
signal MUX_uxn_opcodes_h_l569_c30_3082_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_3082_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_3082_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_3082_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l570_c23_e59e]
signal device_out_uxn_opcodes_h_l570_c23_e59e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_e59e_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_e59e_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_e59e_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_e59e_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_e59e_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_e59e_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l577_c24_5735]
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_5d58]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output : unsigned(11 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c3_5d58]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_5ff5]
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output : unsigned(12 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d1d4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.device_ram_address := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb
BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab
is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c2_d6ab
n8_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c2_d6ab
l8_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab
deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab
deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c2_d6ab
t8_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab
device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab
is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- result_MUX_uxn_opcodes_h_l540_c2_d6ab
result_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab
is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_cond,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3
BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_left,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_right,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6
is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- n8_MUX_uxn_opcodes_h_l555_c7_faf6
n8_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
n8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
n8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- l8_MUX_uxn_opcodes_h_l555_c7_faf6
l8_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
l8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
l8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6
deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6
deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- t8_MUX_uxn_opcodes_h_l555_c7_faf6
t8_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
t8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
t8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6
device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6
is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6
result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6
result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6
is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_cond,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_left,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_right,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf
is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- n8_MUX_uxn_opcodes_h_l558_c7_2bcf
n8_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- l8_MUX_uxn_opcodes_h_l558_c7_2bcf
l8_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf
deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf
deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- t8_MUX_uxn_opcodes_h_l558_c7_2bcf
t8_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf
device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf
is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf
result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf
result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf
is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_cond,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output);

-- MUX_uxn_opcodes_h_l563_c17_b73b
MUX_uxn_opcodes_h_l563_c17_b73b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_b73b_cond,
MUX_uxn_opcodes_h_l563_c17_b73b_iftrue,
MUX_uxn_opcodes_h_l563_c17_b73b_iffalse,
MUX_uxn_opcodes_h_l563_c17_b73b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b
BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output);

-- MUX_uxn_opcodes_h_l564_c17_53b9
MUX_uxn_opcodes_h_l564_c17_53b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c17_53b9_cond,
MUX_uxn_opcodes_h_l564_c17_53b9_iftrue,
MUX_uxn_opcodes_h_l564_c17_53b9_iffalse,
MUX_uxn_opcodes_h_l564_c17_53b9_return_output);

-- MUX_uxn_opcodes_h_l565_c8_0c73
MUX_uxn_opcodes_h_l565_c8_0c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_0c73_cond,
MUX_uxn_opcodes_h_l565_c8_0c73_iftrue,
MUX_uxn_opcodes_h_l565_c8_0c73_iffalse,
MUX_uxn_opcodes_h_l565_c8_0c73_return_output);

-- MUX_uxn_opcodes_h_l566_c8_2066
MUX_uxn_opcodes_h_l566_c8_2066 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c8_2066_cond,
MUX_uxn_opcodes_h_l566_c8_2066_iftrue,
MUX_uxn_opcodes_h_l566_c8_2066_iffalse,
MUX_uxn_opcodes_h_l566_c8_2066_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_left,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_right,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output);

-- MUX_uxn_opcodes_h_l567_c16_1ac3
MUX_uxn_opcodes_h_l567_c16_1ac3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_1ac3_cond,
MUX_uxn_opcodes_h_l567_c16_1ac3_iftrue,
MUX_uxn_opcodes_h_l567_c16_1ac3_iffalse,
MUX_uxn_opcodes_h_l567_c16_1ac3_return_output);

-- MUX_uxn_opcodes_h_l568_c16_1e0c
MUX_uxn_opcodes_h_l568_c16_1e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c16_1e0c_cond,
MUX_uxn_opcodes_h_l568_c16_1e0c_iftrue,
MUX_uxn_opcodes_h_l568_c16_1e0c_iffalse,
MUX_uxn_opcodes_h_l568_c16_1e0c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l569_c43_11b2
sp_relative_shift_uxn_opcodes_h_l569_c43_11b2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_ins,
sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_x,
sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_y,
sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output);

-- MUX_uxn_opcodes_h_l569_c30_3082
MUX_uxn_opcodes_h_l569_c30_3082 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l569_c30_3082_cond,
MUX_uxn_opcodes_h_l569_c30_3082_iftrue,
MUX_uxn_opcodes_h_l569_c30_3082_iffalse,
MUX_uxn_opcodes_h_l569_c30_3082_return_output);

-- device_out_uxn_opcodes_h_l570_c23_e59e
device_out_uxn_opcodes_h_l570_c23_e59e : entity work.device_out_0CLK_415ef426 port map (
clk,
device_out_uxn_opcodes_h_l570_c23_e59e_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l570_c23_e59e_device_address,
device_out_uxn_opcodes_h_l570_c23_e59e_value,
device_out_uxn_opcodes_h_l570_c23_e59e_phase,
device_out_uxn_opcodes_h_l570_c23_e59e_previous_device_ram_read,
device_out_uxn_opcodes_h_l570_c23_e59e_previous_ram_read,
device_out_uxn_opcodes_h_l570_c23_e59e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l577_c24_5735
BIN_OP_AND_uxn_opcodes_h_l577_c24_5735 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_left,
BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_right,
BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58
is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_left,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_right,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output,
 MUX_uxn_opcodes_h_l563_c17_b73b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output,
 MUX_uxn_opcodes_h_l564_c17_53b9_return_output,
 MUX_uxn_opcodes_h_l565_c8_0c73_return_output,
 MUX_uxn_opcodes_h_l566_c8_2066_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output,
 MUX_uxn_opcodes_h_l567_c16_1ac3_return_output,
 MUX_uxn_opcodes_h_l568_c16_1e0c_return_output,
 sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output,
 MUX_uxn_opcodes_h_l569_c30_3082_return_output,
 device_out_uxn_opcodes_h_l570_c23_e59e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l553_c3_9915 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_d6ab_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_d1d4_uxn_opcodes_h_l540_c2_d6ab_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_8227 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_b142 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_6743 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_40f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_2bcf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_b73b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_b73b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_b73b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_b73b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_53b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_53b9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_53b9_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_53b9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0c73_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0c73_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0c73_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0c73_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_2066_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_2066_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_2066_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_2066_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_3082_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_3082_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_3082_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_3082_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_840e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_8581_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_d760_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_0f27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_c082_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_5914_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l579_c4_d463 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l582_c4_7a59 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output : unsigned(12 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_3ed8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_4255_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c105_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_327b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_822c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a7d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_7320_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_2c6a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_1b1f_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_6743 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_6743;
     VAR_MUX_uxn_opcodes_h_l563_c17_b73b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l564_c17_53b9_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l579_c4_d463 := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l579_c4_d463;
     VAR_MUX_uxn_opcodes_h_l569_c30_3082_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_40f9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_40f9;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_8227 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_b142 := resize(to_unsigned(1, 1), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_right := to_unsigned(3, 2);
     VAR_current_deo_phase_uxn_opcodes_h_l553_c3_9915 := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l553_c3_9915;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l563_c17_b73b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l564_c17_53b9_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l565_c8_0c73_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l566_c8_2066_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_0c73_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l566_c8_2066_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_left := t8;
     VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_3ed8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_3ed8_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c17_336b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a7d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a7d4_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_2bcf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_4255 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_4255_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l555_c11_47e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c6_1fbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_2c6a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_2c6a_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_d6ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_8227,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_b142,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_327b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_327b_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_7320 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_7320_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_8e0a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c105 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c105_return_output := result.is_device_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_5ff5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_822c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_822c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l558_c11_a1e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l569_c43_11b2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_ins;
     sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_x;
     sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output := sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_7899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_1fbb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_47e3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_a1e5_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_b73b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7899_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c17_53b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_336b_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_8e0a_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l582_c4_7a59 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_5ff5_return_output, 12);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_822c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_822c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_3ed8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_3ed8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c105_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c105_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_4255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_4255_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a7d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a7d4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_327b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_327b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_2c6a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_2c6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_7320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_7320_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_3082_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_11b2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l582_c4_7a59;
     -- t8_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- MUX[uxn_opcodes_h_l564_c17_53b9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c17_53b9_cond <= VAR_MUX_uxn_opcodes_h_l564_c17_53b9_cond;
     MUX_uxn_opcodes_h_l564_c17_53b9_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c17_53b9_iftrue;
     MUX_uxn_opcodes_h_l564_c17_53b9_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c17_53b9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c17_53b9_return_output := MUX_uxn_opcodes_h_l564_c17_53b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_b73b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_b73b_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_b73b_cond;
     MUX_uxn_opcodes_h_l563_c17_b73b_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_b73b_iftrue;
     MUX_uxn_opcodes_h_l563_c17_b73b_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_b73b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_b73b_return_output := MUX_uxn_opcodes_h_l563_c17_b73b_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_1ac3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_1ac3_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_cond;
     MUX_uxn_opcodes_h_l567_c16_1ac3_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_iftrue;
     MUX_uxn_opcodes_h_l567_c16_1ac3_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_return_output := MUX_uxn_opcodes_h_l567_c16_1ac3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_0c73_cond := VAR_MUX_uxn_opcodes_h_l563_c17_b73b_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_3082_cond := VAR_MUX_uxn_opcodes_h_l563_c17_b73b_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_b73b_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c8_2066_cond := VAR_MUX_uxn_opcodes_h_l564_c17_53b9_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l564_c17_53b9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_device_address := VAR_MUX_uxn_opcodes_h_l567_c16_1ac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_0c73] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_0c73_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_0c73_cond;
     MUX_uxn_opcodes_h_l565_c8_0c73_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_0c73_iftrue;
     MUX_uxn_opcodes_h_l565_c8_0c73_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_0c73_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_0c73_return_output := MUX_uxn_opcodes_h_l565_c8_0c73_return_output;

     -- MUX[uxn_opcodes_h_l566_c8_2066] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c8_2066_cond <= VAR_MUX_uxn_opcodes_h_l566_c8_2066_cond;
     MUX_uxn_opcodes_h_l566_c8_2066_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c8_2066_iftrue;
     MUX_uxn_opcodes_h_l566_c8_2066_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c8_2066_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c8_2066_return_output := MUX_uxn_opcodes_h_l566_c8_2066_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- MUX[uxn_opcodes_h_l569_c30_3082] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l569_c30_3082_cond <= VAR_MUX_uxn_opcodes_h_l569_c30_3082_cond;
     MUX_uxn_opcodes_h_l569_c30_3082_iftrue <= VAR_MUX_uxn_opcodes_h_l569_c30_3082_iftrue;
     MUX_uxn_opcodes_h_l569_c30_3082_iffalse <= VAR_MUX_uxn_opcodes_h_l569_c30_3082_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l569_c30_3082_return_output := MUX_uxn_opcodes_h_l569_c30_3082_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- t8_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     t8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     t8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_0c73_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_0c73_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_iftrue := VAR_MUX_uxn_opcodes_h_l566_c8_2066_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l566_c8_2066_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l569_c30_3082_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     -- l8_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- t8_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- MUX[uxn_opcodes_h_l568_c16_1e0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c16_1e0c_cond <= VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_cond;
     MUX_uxn_opcodes_h_l568_c16_1e0c_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_iftrue;
     MUX_uxn_opcodes_h_l568_c16_1e0c_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_return_output := MUX_uxn_opcodes_h_l568_c16_1e0c_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- n8_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_5c70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_5c70_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_value := VAR_MUX_uxn_opcodes_h_l568_c16_1e0c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_l8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- device_out[uxn_opcodes_h_l570_c23_e59e] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l570_c23_e59e_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l570_c23_e59e_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l570_c23_e59e_device_address <= VAR_device_out_uxn_opcodes_h_l570_c23_e59e_device_address;
     device_out_uxn_opcodes_h_l570_c23_e59e_value <= VAR_device_out_uxn_opcodes_h_l570_c23_e59e_value;
     device_out_uxn_opcodes_h_l570_c23_e59e_phase <= VAR_device_out_uxn_opcodes_h_l570_c23_e59e_phase;
     device_out_uxn_opcodes_h_l570_c23_e59e_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_e59e_previous_device_ram_read;
     device_out_uxn_opcodes_h_l570_c23_e59e_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_e59e_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output := device_out_uxn_opcodes_h_l570_c23_e59e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- n8_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     n8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     n8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- l8_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     l8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     l8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_l8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_n8_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l573_c26_d760] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_d760_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_1b1f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_1b1f_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l576_c21_5914] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_5914_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.u8_value;

     -- deo_param1_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l571_c32_840e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_840e_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l574_c29_0f27] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_0f27_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.vram_write_layer;

     -- l8_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- n8_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l575_c22_c082] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_c082_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.u16_addr;

     -- device_out_result_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l572_c31_8581] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_8581_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_e59e_return_output.device_ram_address;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_c082_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_1b1f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_1b1f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_1b1f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_840e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_d760_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_0f27_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_8581_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_5914_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c3_5d58] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l577_c24_5735] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_left;
     BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output := BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_5d58] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_5735_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_5d58_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_5d58_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_2bcf_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l555_c7_faf6] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_cond;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output := is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_faf6_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_d1d4[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_d1d4_uxn_opcodes_h_l540_c2_d6ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d1d4(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_faf6_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_faf6_return_output);

     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_d1d4_uxn_opcodes_h_l540_c2_d6ab_return_output;
     -- result_MUX[uxn_opcodes_h_l540_c2_d6ab] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond <= VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_cond;
     result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue <= VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iftrue;
     result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse <= VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output := result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l540_c2_d6ab_return_output;
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
