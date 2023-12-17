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
entity deo2_0CLK_4871c646 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_4871c646;
architecture arch of deo2_0CLK_4871c646 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_deo_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_second_deo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_3 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_4 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_is_phase_3 : unsigned(0 downto 0);
signal REG_COMB_is_phase_4 : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l561_c6_2bb2]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l576_c7_5f33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l561_c2_dd29]
signal n8_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l561_c2_dd29]
signal result_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : opcode_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l561_c2_dd29]
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l561_c2_dd29]
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l561_c2_dd29]
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l561_c2_dd29]
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l561_c2_dd29]
signal l8_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l561_c2_dd29]
signal t8_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l561_c2_dd29]
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l561_c2_dd29]
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l561_c2_dd29]
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l576_c11_e371]
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l579_c7_b085]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l576_c7_5f33]
signal n8_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l576_c7_5f33]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l576_c7_5f33]
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l576_c7_5f33]
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l576_c7_5f33]
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l576_c7_5f33]
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l576_c7_5f33]
signal l8_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l576_c7_5f33]
signal t8_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l576_c7_5f33]
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l576_c7_5f33]
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l576_c7_5f33]
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l579_c11_e5ae]
signal BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l583_c1_a7b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l579_c7_b085]
signal n8_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l579_c7_b085]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l579_c7_b085]
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l579_c7_b085]
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l579_c7_b085]
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l579_c7_b085]
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l579_c7_b085]
signal l8_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l579_c7_b085]
signal t8_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l579_c7_b085]
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l579_c7_b085]
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l579_c7_b085]
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l584_c17_ccbe]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l584_c17_814b]
signal MUX_uxn_opcodes_h_l584_c17_814b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c17_814b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c17_814b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c17_814b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l585_c17_0b62]
signal BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l585_c17_577e]
signal MUX_uxn_opcodes_h_l585_c17_577e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c17_577e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c17_577e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c17_577e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l586_c8_8ea6]
signal MUX_uxn_opcodes_h_l586_c8_8ea6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l586_c8_8ea6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l586_c8_8ea6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l586_c8_8ea6_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l587_c8_eff1]
signal MUX_uxn_opcodes_h_l587_c8_eff1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l587_c8_eff1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l587_c8_eff1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l587_c8_eff1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l588_c32_cc9d]
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l588_c16_8adc]
signal MUX_uxn_opcodes_h_l588_c16_8adc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l588_c16_8adc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l588_c16_8adc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l588_c16_8adc_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l589_c16_50a8]
signal MUX_uxn_opcodes_h_l589_c16_50a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l589_c16_50a8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l589_c16_50a8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l589_c16_50a8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l590_c43_7072]
signal sp_relative_shift_uxn_opcodes_h_l590_c43_7072_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l590_c43_7072_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l590_c43_7072_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l590_c30_39a8]
signal MUX_uxn_opcodes_h_l590_c30_39a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l590_c30_39a8_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l590_c30_39a8_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l590_c30_39a8_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l591_c23_3e32]
signal device_out_uxn_opcodes_h_l591_c23_3e32_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_3e32_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_3e32_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_3e32_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_3e32_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_3e32_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_3e32_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l598_c24_b06c]
signal BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l599_c3_787c]
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l599_c3_787c]
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l603_c4_af59]
signal BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6fac( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2
BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- n8_MUX_uxn_opcodes_h_l561_c2_dd29
n8_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
n8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
n8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- result_MUX_uxn_opcodes_h_l561_c2_dd29
result_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29
is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29
is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29
device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- l8_MUX_uxn_opcodes_h_l561_c2_dd29
l8_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
l8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
l8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- t8_MUX_uxn_opcodes_h_l561_c2_dd29
t8_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
t8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
t8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29
deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29
is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29
deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_cond,
deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue,
deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse,
deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371
BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_left,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_right,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- n8_MUX_uxn_opcodes_h_l576_c7_5f33
n8_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
n8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
n8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33
result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33
result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33
is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33
is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33
device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- l8_MUX_uxn_opcodes_h_l576_c7_5f33
l8_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
l8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
l8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- t8_MUX_uxn_opcodes_h_l576_c7_5f33
t8_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
t8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
t8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33
deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33
is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33
deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_cond,
deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue,
deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse,
deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae
BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_left,
BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_right,
BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output);

-- n8_MUX_uxn_opcodes_h_l579_c7_b085
n8_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l579_c7_b085_cond,
n8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
n8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085
result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085
result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085
is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_cond,
is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_cond,
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085
is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_cond,
is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l579_c7_b085
device_out_result_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_cond,
device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- l8_MUX_uxn_opcodes_h_l579_c7_b085
l8_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l579_c7_b085_cond,
l8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
l8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- t8_MUX_uxn_opcodes_h_l579_c7_b085
t8_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l579_c7_b085_cond,
t8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
t8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l579_c7_b085
deo_param0_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_cond,
deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085
is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_cond,
is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l579_c7_b085
deo_param1_MUX_uxn_opcodes_h_l579_c7_b085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_cond,
deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iftrue,
deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iffalse,
deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe
BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output);

-- MUX_uxn_opcodes_h_l584_c17_814b
MUX_uxn_opcodes_h_l584_c17_814b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l584_c17_814b_cond,
MUX_uxn_opcodes_h_l584_c17_814b_iftrue,
MUX_uxn_opcodes_h_l584_c17_814b_iffalse,
MUX_uxn_opcodes_h_l584_c17_814b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62
BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_left,
BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_right,
BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output);

-- MUX_uxn_opcodes_h_l585_c17_577e
MUX_uxn_opcodes_h_l585_c17_577e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l585_c17_577e_cond,
MUX_uxn_opcodes_h_l585_c17_577e_iftrue,
MUX_uxn_opcodes_h_l585_c17_577e_iffalse,
MUX_uxn_opcodes_h_l585_c17_577e_return_output);

-- MUX_uxn_opcodes_h_l586_c8_8ea6
MUX_uxn_opcodes_h_l586_c8_8ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l586_c8_8ea6_cond,
MUX_uxn_opcodes_h_l586_c8_8ea6_iftrue,
MUX_uxn_opcodes_h_l586_c8_8ea6_iffalse,
MUX_uxn_opcodes_h_l586_c8_8ea6_return_output);

-- MUX_uxn_opcodes_h_l587_c8_eff1
MUX_uxn_opcodes_h_l587_c8_eff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l587_c8_eff1_cond,
MUX_uxn_opcodes_h_l587_c8_eff1_iftrue,
MUX_uxn_opcodes_h_l587_c8_eff1_iffalse,
MUX_uxn_opcodes_h_l587_c8_eff1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_left,
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_right,
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output);

-- MUX_uxn_opcodes_h_l588_c16_8adc
MUX_uxn_opcodes_h_l588_c16_8adc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l588_c16_8adc_cond,
MUX_uxn_opcodes_h_l588_c16_8adc_iftrue,
MUX_uxn_opcodes_h_l588_c16_8adc_iffalse,
MUX_uxn_opcodes_h_l588_c16_8adc_return_output);

-- MUX_uxn_opcodes_h_l589_c16_50a8
MUX_uxn_opcodes_h_l589_c16_50a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l589_c16_50a8_cond,
MUX_uxn_opcodes_h_l589_c16_50a8_iftrue,
MUX_uxn_opcodes_h_l589_c16_50a8_iffalse,
MUX_uxn_opcodes_h_l589_c16_50a8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l590_c43_7072
sp_relative_shift_uxn_opcodes_h_l590_c43_7072 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l590_c43_7072_ins,
sp_relative_shift_uxn_opcodes_h_l590_c43_7072_x,
sp_relative_shift_uxn_opcodes_h_l590_c43_7072_y,
sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output);

-- MUX_uxn_opcodes_h_l590_c30_39a8
MUX_uxn_opcodes_h_l590_c30_39a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l590_c30_39a8_cond,
MUX_uxn_opcodes_h_l590_c30_39a8_iftrue,
MUX_uxn_opcodes_h_l590_c30_39a8_iffalse,
MUX_uxn_opcodes_h_l590_c30_39a8_return_output);

-- device_out_uxn_opcodes_h_l591_c23_3e32
device_out_uxn_opcodes_h_l591_c23_3e32 : entity work.device_out_0CLK_ae30f4b0 port map (
clk,
device_out_uxn_opcodes_h_l591_c23_3e32_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l591_c23_3e32_device_address,
device_out_uxn_opcodes_h_l591_c23_3e32_value,
device_out_uxn_opcodes_h_l591_c23_3e32_phase,
device_out_uxn_opcodes_h_l591_c23_3e32_previous_device_ram_read,
device_out_uxn_opcodes_h_l591_c23_3e32_previous_ram_read,
device_out_uxn_opcodes_h_l591_c23_3e32_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c
BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_left,
BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_right,
BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c
is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_cond,
is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_left,
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_right,
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output);



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
 current_deo_phase,
 deo_param0,
 deo_param1,
 is_second_deo,
 is_phase_3,
 is_phase_4,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output,
 n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output,
 MUX_uxn_opcodes_h_l584_c17_814b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output,
 MUX_uxn_opcodes_h_l585_c17_577e_return_output,
 MUX_uxn_opcodes_h_l586_c8_8ea6_return_output,
 MUX_uxn_opcodes_h_l587_c8_eff1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output,
 MUX_uxn_opcodes_h_l588_c16_8adc_return_output,
 MUX_uxn_opcodes_h_l589_c16_50a8_return_output,
 sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output,
 MUX_uxn_opcodes_h_l590_c30_39a8_return_output,
 device_out_uxn_opcodes_h_l591_c23_3e32_return_output,
 BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l561_c2_dd29_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac_uxn_opcodes_h_l561_c2_dd29_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l574_c3_1aa5 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l566_c3_9eff : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l571_c3_f202 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l577_c3_aa02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_f2b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l579_c7_b085_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_814b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_814b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_814b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_814b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_577e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_577e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_577e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_577e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_eff1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_eff1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_eff1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_eff1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_8adc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_8adc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_8adc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_8adc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_50a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_50a8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_50a8_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_50a8_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_39a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_39a8_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_39a8_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_39a8_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l592_c32_0d52_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l593_c31_5a44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_4d51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l595_c29_3474_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l596_c22_ee3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l597_c21_cff9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l600_c4_bff9 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l603_c4_c4c3 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_9d8c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_8365_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f437_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_b528_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f8a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_3162_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_1dc0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_fb92_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_174b_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
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
  REG_VAR_current_deo_phase := current_deo_phase;
  REG_VAR_deo_param0 := deo_param0;
  REG_VAR_deo_param1 := deo_param1;
  REG_VAR_is_second_deo := is_second_deo;
  REG_VAR_is_phase_3 := is_phase_3;
  REG_VAR_is_phase_4 := is_phase_4;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_y := resize(to_signed(-3, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l566_c3_9eff := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l574_c3_1aa5 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l574_c3_1aa5;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l600_c4_bff9 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l600_c4_bff9;
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l577_c3_aa02 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l577_c3_aa02;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l571_c3_f202 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_f2b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_f2b7;
     VAR_MUX_uxn_opcodes_h_l584_c17_814b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l585_c17_577e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l590_c30_39a8_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l584_c17_814b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l585_c17_577e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_right := to_unsigned(2, 2);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l588_c16_8adc_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l589_c16_50a8_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l587_c8_eff1_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l587_c8_eff1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_left := t8;
     VAR_MUX_uxn_opcodes_h_l588_c16_8adc_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_3162 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_3162_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l576_c11_e371] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_left;
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output := BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l579_c11_e5ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l585_c17_0b62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_left;
     BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output := BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l579_c7_b085_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_8365 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_8365_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c6_2bb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f437 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f437_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l603_c4_af59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_left;
     BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output := BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l590_c43_7072] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l590_c43_7072_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_ins;
     sp_relative_shift_uxn_opcodes_h_l590_c43_7072_x <= VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_x;
     sp_relative_shift_uxn_opcodes_h_l590_c43_7072_y <= VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output := sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l588_c32_cc9d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_b528 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_b528_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c17_ccbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_fb92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_fb92_return_output := result.is_device_ram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l561_c2_dd29_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l566_c3_9eff,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l571_c3_f202,
     to_unsigned(0, 1));

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_9d8c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_9d8c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f8a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f8a5_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_1dc0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_1dc0_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_2bb2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_e371_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_e5ae_return_output;
     VAR_MUX_uxn_opcodes_h_l584_c17_814b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_ccbe_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c17_577e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_0b62_return_output;
     VAR_MUX_uxn_opcodes_h_l588_c16_8adc_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cc9d_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l603_c4_c4c3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_af59_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_9d8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_9d8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_3162_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_3162_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_fb92_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_fb92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_1dc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_1dc0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_8365_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_8365_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_b528_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_b528_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f8a5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f8a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f437_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l576_l579_DUPLICATE_f437_return_output;
     VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_MUX_uxn_opcodes_h_l590_c30_39a8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_7072_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l603_c4_c4c3;
     -- MUX[uxn_opcodes_h_l584_c17_814b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l584_c17_814b_cond <= VAR_MUX_uxn_opcodes_h_l584_c17_814b_cond;
     MUX_uxn_opcodes_h_l584_c17_814b_iftrue <= VAR_MUX_uxn_opcodes_h_l584_c17_814b_iftrue;
     MUX_uxn_opcodes_h_l584_c17_814b_iffalse <= VAR_MUX_uxn_opcodes_h_l584_c17_814b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l584_c17_814b_return_output := MUX_uxn_opcodes_h_l584_c17_814b_return_output;

     -- MUX[uxn_opcodes_h_l588_c16_8adc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l588_c16_8adc_cond <= VAR_MUX_uxn_opcodes_h_l588_c16_8adc_cond;
     MUX_uxn_opcodes_h_l588_c16_8adc_iftrue <= VAR_MUX_uxn_opcodes_h_l588_c16_8adc_iftrue;
     MUX_uxn_opcodes_h_l588_c16_8adc_iffalse <= VAR_MUX_uxn_opcodes_h_l588_c16_8adc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l588_c16_8adc_return_output := MUX_uxn_opcodes_h_l588_c16_8adc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- t8_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     t8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     t8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output := t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- MUX[uxn_opcodes_h_l585_c17_577e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l585_c17_577e_cond <= VAR_MUX_uxn_opcodes_h_l585_c17_577e_cond;
     MUX_uxn_opcodes_h_l585_c17_577e_iftrue <= VAR_MUX_uxn_opcodes_h_l585_c17_577e_iftrue;
     MUX_uxn_opcodes_h_l585_c17_577e_iffalse <= VAR_MUX_uxn_opcodes_h_l585_c17_577e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l585_c17_577e_return_output := MUX_uxn_opcodes_h_l585_c17_577e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_cond := VAR_MUX_uxn_opcodes_h_l584_c17_814b_return_output;
     VAR_MUX_uxn_opcodes_h_l590_c30_39a8_cond := VAR_MUX_uxn_opcodes_h_l584_c17_814b_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l584_c17_814b_return_output;
     VAR_MUX_uxn_opcodes_h_l587_c8_eff1_cond := VAR_MUX_uxn_opcodes_h_l585_c17_577e_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l585_c17_577e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l588_c16_8adc_return_output;
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_device_address := VAR_MUX_uxn_opcodes_h_l588_c16_8adc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_t8_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     -- MUX[uxn_opcodes_h_l587_c8_eff1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l587_c8_eff1_cond <= VAR_MUX_uxn_opcodes_h_l587_c8_eff1_cond;
     MUX_uxn_opcodes_h_l587_c8_eff1_iftrue <= VAR_MUX_uxn_opcodes_h_l587_c8_eff1_iftrue;
     MUX_uxn_opcodes_h_l587_c8_eff1_iffalse <= VAR_MUX_uxn_opcodes_h_l587_c8_eff1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l587_c8_eff1_return_output := MUX_uxn_opcodes_h_l587_c8_eff1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output := is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- MUX[uxn_opcodes_h_l590_c30_39a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l590_c30_39a8_cond <= VAR_MUX_uxn_opcodes_h_l590_c30_39a8_cond;
     MUX_uxn_opcodes_h_l590_c30_39a8_iftrue <= VAR_MUX_uxn_opcodes_h_l590_c30_39a8_iftrue;
     MUX_uxn_opcodes_h_l590_c30_39a8_iffalse <= VAR_MUX_uxn_opcodes_h_l590_c30_39a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l590_c30_39a8_return_output := MUX_uxn_opcodes_h_l590_c30_39a8_return_output;

     -- MUX[uxn_opcodes_h_l586_c8_8ea6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l586_c8_8ea6_cond <= VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_cond;
     MUX_uxn_opcodes_h_l586_c8_8ea6_iftrue <= VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_iftrue;
     MUX_uxn_opcodes_h_l586_c8_8ea6_iffalse <= VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_return_output := MUX_uxn_opcodes_h_l586_c8_8ea6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- t8_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     t8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     t8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output := is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output := deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_MUX_uxn_opcodes_h_l589_c16_50a8_iffalse := VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l586_c8_8ea6_return_output;
     VAR_MUX_uxn_opcodes_h_l589_c16_50a8_iftrue := VAR_MUX_uxn_opcodes_h_l587_c8_eff1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l587_c8_eff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l590_c30_39a8_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_t8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     -- t8_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     t8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     t8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- MUX[uxn_opcodes_h_l589_c16_50a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l589_c16_50a8_cond <= VAR_MUX_uxn_opcodes_h_l589_c16_50a8_cond;
     MUX_uxn_opcodes_h_l589_c16_50a8_iftrue <= VAR_MUX_uxn_opcodes_h_l589_c16_50a8_iftrue;
     MUX_uxn_opcodes_h_l589_c16_50a8_iffalse <= VAR_MUX_uxn_opcodes_h_l589_c16_50a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l589_c16_50a8_return_output := MUX_uxn_opcodes_h_l589_c16_50a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l583_c1_a7b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output;

     -- l8_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     l8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     l8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output := l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- n8_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     n8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     n8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output := n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_a7b5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_MUX_uxn_opcodes_h_l589_c16_50a8_return_output;
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_value := VAR_MUX_uxn_opcodes_h_l589_c16_50a8_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_l8_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_n8_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- n8_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     n8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     n8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- l8_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     l8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     l8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output := deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- device_out[uxn_opcodes_h_l591_c23_3e32] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l591_c23_3e32_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l591_c23_3e32_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l591_c23_3e32_device_address <= VAR_device_out_uxn_opcodes_h_l591_c23_3e32_device_address;
     device_out_uxn_opcodes_h_l591_c23_3e32_value <= VAR_device_out_uxn_opcodes_h_l591_c23_3e32_value;
     device_out_uxn_opcodes_h_l591_c23_3e32_phase <= VAR_device_out_uxn_opcodes_h_l591_c23_3e32_phase;
     device_out_uxn_opcodes_h_l591_c23_3e32_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l591_c23_3e32_previous_device_ram_read;
     device_out_uxn_opcodes_h_l591_c23_3e32_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l591_c23_3e32_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output := device_out_uxn_opcodes_h_l591_c23_3e32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_l8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_n8_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l595_c29_3474] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l595_c29_3474_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.vram_write_layer;

     -- l8_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     l8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     l8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l594_c26_4d51] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_4d51_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l593_c31_5a44] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l593_c31_5a44_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.device_ram_address;

     -- deo_param1_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l597_c21_cff9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l597_c21_cff9_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l596_c22_ee3e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l596_c22_ee3e_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l592_c32_0d52] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l592_c32_0d52_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_174b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_174b_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_3e32_return_output.is_deo_done;

     -- n8_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     n8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     n8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output := device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l596_c22_ee3e_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_174b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_174b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_174b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l592_c32_0d52_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_4d51_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l595_c29_3474_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l593_c31_5a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l597_c21_cff9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l598_c24_b06c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_left;
     BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output := BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l599_c3_787c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output := is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l599_c3_787c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_b06c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_787c_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_787c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output := is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l579_c7_b085] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output := current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_b085_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l576_c7_5f33] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_cond;
     is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output := is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_5f33_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac_uxn_opcodes_h_l561_c2_dd29_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6fac(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_5f33_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_5f33_return_output);

     -- is_second_deo_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac_uxn_opcodes_h_l561_c2_dd29_return_output;
     -- result_MUX[uxn_opcodes_h_l561_c2_dd29] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l561_c2_dd29_cond <= VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_cond;
     result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue <= VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_iftrue;
     result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse <= VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output := result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l561_c2_dd29_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_current_deo_phase <= REG_VAR_current_deo_phase;
REG_COMB_deo_param0 <= REG_VAR_deo_param0;
REG_COMB_deo_param1 <= REG_VAR_deo_param1;
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
     current_deo_phase <= REG_COMB_current_deo_phase;
     deo_param0 <= REG_COMB_deo_param0;
     deo_param1 <= REG_COMB_deo_param1;
     is_second_deo <= REG_COMB_is_second_deo;
     is_phase_3 <= REG_COMB_is_phase_3;
     is_phase_4 <= REG_COMB_is_phase_4;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
