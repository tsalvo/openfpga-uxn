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
-- Submodules: 153
entity deo2_0CLK_f86d7e2d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_f86d7e2d;
architecture arch of deo2_0CLK_f86d7e2d is
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
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l568_c6_48e2]
signal BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l568_c1_8c8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l575_c7_e93b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l568_c2_b44a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l568_c2_b44a]
signal current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l568_c2_b44a]
signal deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l568_c2_b44a]
signal n8_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l568_c2_b44a]
signal l8_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l568_c2_b44a]
signal is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l568_c2_b44a]
signal device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l568_c2_b44a]
signal deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l568_c2_b44a]
signal t8_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l569_c3_f953[uxn_opcodes_h_l569_c3_f953]
signal printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l575_c11_22d8]
signal BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_a19e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l575_c7_e93b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l575_c7_e93b]
signal current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l575_c7_e93b]
signal deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l575_c7_e93b]
signal n8_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l575_c7_e93b]
signal l8_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l575_c7_e93b]
signal is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l575_c7_e93b]
signal device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l575_c7_e93b]
signal deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l575_c7_e93b]
signal t8_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l578_c11_5392]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_a19e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c7_a19e]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l578_c7_a19e]
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l578_c7_a19e]
signal n8_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l578_c7_a19e]
signal l8_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c7_a19e]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l578_c7_a19e]
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l578_c7_a19e]
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l578_c7_a19e]
signal t8_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l582_c11_4c5b]
signal BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal n8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal l8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l582_c7_b6c4]
signal deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l585_c11_ab02]
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l589_c7_f618]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal n8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal l8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l585_c7_f4ee]
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l589_c11_b25b]
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l592_c7_0740]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l589_c7_f618]
signal result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l589_c7_f618]
signal current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l589_c7_f618]
signal deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l589_c7_f618]
signal l8_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l589_c7_f618]
signal is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l589_c7_f618]
signal device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l589_c7_f618]
signal deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l592_c11_54a7]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l598_c1_3f22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l592_c7_0740]
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l592_c7_0740]
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l592_c7_0740]
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l592_c7_0740]
signal l8_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l592_c7_0740]
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l592_c7_0740]
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l592_c7_0740]
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l596_c30_b36e]
signal sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l600_c32_c1ff]
signal BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l600_c16_aac4]
signal MUX_uxn_opcodes_h_l600_c16_aac4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_aac4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_aac4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_aac4_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l601_c16_57eb]
signal MUX_uxn_opcodes_h_l601_c16_57eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l601_c16_57eb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l601_c16_57eb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l601_c16_57eb_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l602_c23_a422]
signal device_out_uxn_opcodes_h_l602_c23_a422_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l602_c23_a422_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l602_c23_a422_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l602_c23_a422_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l602_c23_a422_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l602_c23_a422_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l602_c23_a422_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l610_c24_6874]
signal BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l611_c3_8051]
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l611_c3_8051]
signal is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l615_c4_25e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_87ba( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.is_vram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2
BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_left,
BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_right,
BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a
result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a
result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a
result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a
result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a
result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a
result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a
result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a
result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a
current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a
deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- n8_MUX_uxn_opcodes_h_l568_c2_b44a
n8_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
n8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
n8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- l8_MUX_uxn_opcodes_h_l568_c2_b44a
l8_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
l8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
l8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a
is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a
device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a
deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- t8_MUX_uxn_opcodes_h_l568_c2_b44a
t8_MUX_uxn_opcodes_h_l568_c2_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l568_c2_b44a_cond,
t8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue,
t8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse,
t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

-- printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953
printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953 : entity work.printf_uxn_opcodes_h_l569_c3_f953_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8
BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_left,
BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_right,
BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b
result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b
result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b
result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b
result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b
result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b
result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b
result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b
current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b
deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- n8_MUX_uxn_opcodes_h_l575_c7_e93b
n8_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
n8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
n8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- l8_MUX_uxn_opcodes_h_l575_c7_e93b
l8_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
l8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
l8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b
is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b
device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b
deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- t8_MUX_uxn_opcodes_h_l575_c7_e93b
t8_MUX_uxn_opcodes_h_l575_c7_e93b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l575_c7_e93b_cond,
t8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue,
t8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse,
t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392
BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e
result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e
deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- n8_MUX_uxn_opcodes_h_l578_c7_a19e
n8_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
n8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
n8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- l8_MUX_uxn_opcodes_h_l578_c7_a19e
l8_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
l8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
l8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e
device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e
deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- t8_MUX_uxn_opcodes_h_l578_c7_a19e
t8_MUX_uxn_opcodes_h_l578_c7_a19e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l578_c7_a19e_cond,
t8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue,
t8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse,
t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b
BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_left,
BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_right,
BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4
result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4
result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4
result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4
result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4
result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4
result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4
result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4
result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4
result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4
current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4
deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- n8_MUX_uxn_opcodes_h_l582_c7_b6c4
n8_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- l8_MUX_uxn_opcodes_h_l582_c7_b6c4
l8_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4
is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4
device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4
deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_cond,
deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02
BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_left,
BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_right,
BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee
result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee
deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- n8_MUX_uxn_opcodes_h_l585_c7_f4ee
n8_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- l8_MUX_uxn_opcodes_h_l585_c7_f4ee
l8_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee
device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee
deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_cond,
deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue,
deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse,
deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b
BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_left,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_right,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618
result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618
result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618
result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618
result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618
result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618
result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618
result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618
current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_cond,
current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l589_c7_f618
deo_param0_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_cond,
deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- l8_MUX_uxn_opcodes_h_l589_c7_f618
l8_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l589_c7_f618_cond,
l8_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
l8_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618
is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_cond,
is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l589_c7_f618
device_out_result_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_cond,
device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l589_c7_f618
deo_param1_MUX_uxn_opcodes_h_l589_c7_f618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_cond,
deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iftrue,
deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iffalse,
deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7
BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740
result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740
result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740
result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740
result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_cond,
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l592_c7_0740
deo_param0_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_cond,
deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- l8_MUX_uxn_opcodes_h_l592_c7_0740
l8_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l592_c7_0740_cond,
l8_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
l8_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740
is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_cond,
is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l592_c7_0740
device_out_result_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_cond,
device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l592_c7_0740
deo_param1_MUX_uxn_opcodes_h_l592_c7_0740 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_cond,
deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iftrue,
deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iffalse,
deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output);

-- sp_relative_shift_uxn_opcodes_h_l596_c30_b36e
sp_relative_shift_uxn_opcodes_h_l596_c30_b36e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_ins,
sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_x,
sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_y,
sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff
BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_left,
BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_right,
BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output);

-- MUX_uxn_opcodes_h_l600_c16_aac4
MUX_uxn_opcodes_h_l600_c16_aac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l600_c16_aac4_cond,
MUX_uxn_opcodes_h_l600_c16_aac4_iftrue,
MUX_uxn_opcodes_h_l600_c16_aac4_iffalse,
MUX_uxn_opcodes_h_l600_c16_aac4_return_output);

-- MUX_uxn_opcodes_h_l601_c16_57eb
MUX_uxn_opcodes_h_l601_c16_57eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l601_c16_57eb_cond,
MUX_uxn_opcodes_h_l601_c16_57eb_iftrue,
MUX_uxn_opcodes_h_l601_c16_57eb_iffalse,
MUX_uxn_opcodes_h_l601_c16_57eb_return_output);

-- device_out_uxn_opcodes_h_l602_c23_a422
device_out_uxn_opcodes_h_l602_c23_a422 : entity work.device_out_0CLK_388fdae8 port map (
clk,
device_out_uxn_opcodes_h_l602_c23_a422_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l602_c23_a422_device_address,
device_out_uxn_opcodes_h_l602_c23_a422_value,
device_out_uxn_opcodes_h_l602_c23_a422_phase,
device_out_uxn_opcodes_h_l602_c23_a422_previous_device_ram_read,
device_out_uxn_opcodes_h_l602_c23_a422_previous_ram_read,
device_out_uxn_opcodes_h_l602_c23_a422_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l610_c24_6874
BIN_OP_AND_uxn_opcodes_h_l610_c24_6874 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_left,
BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_right,
BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051
current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_cond,
current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051
is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_cond,
is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0
BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output);



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
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output,
 sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output,
 MUX_uxn_opcodes_h_l600_c16_aac4_return_output,
 MUX_uxn_opcodes_h_l601_c16_57eb_return_output,
 device_out_uxn_opcodes_h_l602_c23_a422_return_output,
 BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l570_c3_e2b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l573_c3_f233 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_777a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_f735 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_1354 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l587_c3_2401 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_2e9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l594_c3_af91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l592_c7_0740_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_aac4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_aac4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_aac4_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_aac4_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l601_c16_57eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l601_c16_57eb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l601_c16_57eb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l601_c16_57eb_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l603_c32_0968_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_c31_4f46_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l605_c26_e04b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l606_c29_46f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l607_c25_0458_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l608_c22_31a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l609_c21_92a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l612_c4_0146 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l615_c4_77bd : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l610_l611_DUPLICATE_aa28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l561_l619_DUPLICATE_0fec_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
variable REG_VAR_is_second_deo : unsigned(0 downto 0);
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
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l612_c4_0146 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l612_c4_0146;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_f735 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_f735;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l570_c3_e2b1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l570_c3_e2b1;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_2e9f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_2e9f;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_1354 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_1354;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l587_c3_2401 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l587_c3_2401;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_777a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_777a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l573_c3_f233 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l573_c3_f233;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l594_c3_af91 := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l594_c3_af91;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_right := to_unsigned(6, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l600_c16_aac4_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l601_c16_57eb_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l601_c16_57eb_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l601_c16_57eb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_previous_ram_read := VAR_previous_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_left := t8;
     VAR_MUX_uxn_opcodes_h_l600_c16_aac4_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l568_c6_48e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l582_c11_4c5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l596_c30_b36e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_ins;
     sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_x;
     sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output := sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l600_c32_c1ff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_left;
     BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output := BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c11_5392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l592_c7_0740_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l585_c11_ab02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_left;
     BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output := BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output := result.vram_address;

     -- MUX[uxn_opcodes_h_l601_c16_57eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l601_c16_57eb_cond <= VAR_MUX_uxn_opcodes_h_l601_c16_57eb_cond;
     MUX_uxn_opcodes_h_l601_c16_57eb_iftrue <= VAR_MUX_uxn_opcodes_h_l601_c16_57eb_iftrue;
     MUX_uxn_opcodes_h_l601_c16_57eb_iffalse <= VAR_MUX_uxn_opcodes_h_l601_c16_57eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l601_c16_57eb_return_output := MUX_uxn_opcodes_h_l601_c16_57eb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l575_c11_22d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l615_c4_25e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c11_54a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l589_c11_b25b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_left;
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output := BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c6_48e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_22d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_5392_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l582_c11_4c5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_ab02_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_b25b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_54a7_return_output;
     VAR_MUX_uxn_opcodes_h_l600_c16_aac4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l600_c32_c1ff_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l615_c4_77bd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l615_c4_25e0_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_478b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_02ee_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_fccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l582_l578_l575_l592_l589_l585_DUPLICATE_9875_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l582_l578_l575_l568_l589_l585_DUPLICATE_4724_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_a508_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_498a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_7303_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_1d66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l582_l578_l575_l568_l592_l589_l585_DUPLICATE_592f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_MUX_uxn_opcodes_h_l601_c16_57eb_return_output;
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_value := VAR_MUX_uxn_opcodes_h_l601_c16_57eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l596_c30_b36e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l615_c4_77bd;
     -- deo_param1_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output := deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- t8_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     t8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     t8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- l8_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     l8_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     l8_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output := l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- MUX[uxn_opcodes_h_l600_c16_aac4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l600_c16_aac4_cond <= VAR_MUX_uxn_opcodes_h_l600_c16_aac4_cond;
     MUX_uxn_opcodes_h_l600_c16_aac4_iftrue <= VAR_MUX_uxn_opcodes_h_l600_c16_aac4_iftrue;
     MUX_uxn_opcodes_h_l600_c16_aac4_iffalse <= VAR_MUX_uxn_opcodes_h_l600_c16_aac4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l600_c16_aac4_return_output := MUX_uxn_opcodes_h_l600_c16_aac4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l568_c1_8c8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- n8_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_MUX_uxn_opcodes_h_l600_c16_aac4_return_output;
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_device_address := VAR_MUX_uxn_opcodes_h_l600_c16_aac4_return_output;
     VAR_printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l568_c1_8c8e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_l8_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     -- printf_uxn_opcodes_h_l569_c3_f953[uxn_opcodes_h_l569_c3_f953] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l569_c3_f953_uxn_opcodes_h_l569_c3_f953_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- deo_param0_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output := deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- n8_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- t8_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     t8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     t8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- l8_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     l8_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     l8_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output := l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output := deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_l8_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output := deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- l8_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     n8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     n8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- t8_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     t8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     t8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- l8_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     n8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     n8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- n8_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     n8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     n8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- l8_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     l8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     l8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_l8_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- l8_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     l8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     l8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l598_c1_3f22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- l8_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     l8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     l8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l598_c1_3f22_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- device_out[uxn_opcodes_h_l602_c23_a422] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l602_c23_a422_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l602_c23_a422_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l602_c23_a422_device_address <= VAR_device_out_uxn_opcodes_h_l602_c23_a422_device_address;
     device_out_uxn_opcodes_h_l602_c23_a422_value <= VAR_device_out_uxn_opcodes_h_l602_c23_a422_value;
     device_out_uxn_opcodes_h_l602_c23_a422_phase <= VAR_device_out_uxn_opcodes_h_l602_c23_a422_phase;
     device_out_uxn_opcodes_h_l602_c23_a422_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l602_c23_a422_previous_device_ram_read;
     device_out_uxn_opcodes_h_l602_c23_a422_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l602_c23_a422_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output := device_out_uxn_opcodes_h_l602_c23_a422_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output := device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l608_c22_31a1] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l608_c22_31a1_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l606_c29_46f5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l606_c29_46f5_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l605_c26_e04b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l605_c26_e04b_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l609_c21_92a8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l609_c21_92a8_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.u8_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l607_c25_0458] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l607_c25_0458_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l604_c31_4f46] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_c31_4f46_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l603_c32_0968] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l603_c32_0968_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l610_l611_DUPLICATE_aa28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l610_l611_DUPLICATE_aa28_return_output := VAR_device_out_uxn_opcodes_h_l602_c23_a422_return_output.is_deo_done;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l608_c22_31a1_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l610_l611_DUPLICATE_aa28_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l610_l611_DUPLICATE_aa28_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l610_l611_DUPLICATE_aa28_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l603_c32_0968_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l605_c26_e04b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l606_c29_46f5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l607_c25_0458_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l604_c31_4f46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l609_c21_92a8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l610_c24_6874] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_left;
     BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output := BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l611_c3_8051] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_cond;
     is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output := is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l611_c3_8051] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output := current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output := device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l610_c24_6874_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l611_c3_8051_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l611_c3_8051_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output := current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output := is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_0740] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_0740_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output := is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output := current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_f618] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_f618_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l585_c7_f4ee] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output := current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f4ee_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l582_c7_b6c4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output := is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l582_c7_b6c4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_a19e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a19e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l575_c7_e93b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e93b_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l568_c2_b44a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output := is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l568_c2_b44a_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l561_l619_DUPLICATE_0fec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l561_l619_DUPLICATE_0fec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_87ba(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c2_b44a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l568_c2_b44a_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l561_l619_DUPLICATE_0fec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_87ba_uxn_opcodes_h_l561_l619_DUPLICATE_0fec_return_output;
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
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
