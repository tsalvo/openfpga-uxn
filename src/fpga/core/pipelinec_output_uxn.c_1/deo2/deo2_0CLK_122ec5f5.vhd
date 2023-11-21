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
-- Submodules: 82
entity deo2_0CLK_122ec5f5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 previous_device_ram_read : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_122ec5f5;
architecture arch of deo2_0CLK_122ec5f5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l521_c6_a039]
signal BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal n8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(23 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal l8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal t8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l521_c2_4f7b]
signal device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l531_c11_3404]
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1dac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal n8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(23 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal l8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal t8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l531_c7_e9b7]
signal device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l535_c11_dbd2]
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l541_c1_531b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l535_c7_1dac]
signal current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l535_c7_1dac]
signal deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l535_c7_1dac]
signal n8_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : signed(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(23 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l535_c7_1dac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l535_c7_1dac]
signal l8_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l535_c7_1dac]
signal is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l535_c7_1dac]
signal deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l535_c7_1dac]
signal t8_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l535_c7_1dac]
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : device_out_result_t;

-- CONST_SR_8[uxn_opcodes_h_l537_c18_291c]
signal CONST_SR_8_uxn_opcodes_h_l537_c18_291c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l538_c30_5d44]
signal sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l542_c9_408e]
signal BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l542_c9_c1f5]
signal MUX_uxn_opcodes_h_l542_c9_c1f5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l542_c9_c1f5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l542_c9_c1f5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l542_c9_c1f5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l543_c32_e3fe]
signal BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l543_c16_5bdc]
signal MUX_uxn_opcodes_h_l543_c16_5bdc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l543_c16_5bdc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l543_c16_5bdc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l543_c16_5bdc_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l544_c16_efc6]
signal MUX_uxn_opcodes_h_l544_c16_efc6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l544_c16_efc6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l544_c16_efc6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l544_c16_efc6_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l546_c23_249f]
signal device_out_uxn_opcodes_h_l546_c23_249f_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l546_c23_249f_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l546_c23_249f_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l546_c23_249f_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l546_c23_249f_previous_device_ram_read : unsigned(15 downto 0);
signal device_out_uxn_opcodes_h_l546_c23_249f_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l546_c23_249f_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l555_c24_0545]
signal BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l556_c3_7a5c]
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l556_c3_7a5c]
signal is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l560_c4_b50b]
signal BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output : unsigned(8 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_aff6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_16bit := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.vram_write_layer := ref_toks_10;
      base.vram_address := ref_toks_11;
      base.is_sp_shift := ref_toks_12;
      base.is_stack_operation_16bit := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039
BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_left,
BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_right,
BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b
current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b
deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- n8_MUX_uxn_opcodes_h_l521_c2_4f7b
n8_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b
result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b
result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b
result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b
result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b
result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b
result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b
result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b
result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b
result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- l8_MUX_uxn_opcodes_h_l521_c2_4f7b
l8_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b
is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b
deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- t8_MUX_uxn_opcodes_h_l521_c2_4f7b
t8_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b
device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_cond,
device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404
BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_left,
BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_right,
BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7
current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7
deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- n8_MUX_uxn_opcodes_h_l531_c7_e9b7
n8_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7
result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7
result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7
result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7
result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7
result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7
result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7
result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- l8_MUX_uxn_opcodes_h_l531_c7_e9b7
l8_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7
is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7
deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- t8_MUX_uxn_opcodes_h_l531_c7_e9b7
t8_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7
device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_cond,
device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue,
device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse,
device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2
BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_left,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_right,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac
current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac
deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- n8_MUX_uxn_opcodes_h_l535_c7_1dac
n8_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
n8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
n8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- l8_MUX_uxn_opcodes_h_l535_c7_1dac
l8_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
l8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
l8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac
is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac
deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- t8_MUX_uxn_opcodes_h_l535_c7_1dac
t8_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
t8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
t8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac
device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_cond,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output);

-- CONST_SR_8_uxn_opcodes_h_l537_c18_291c
CONST_SR_8_uxn_opcodes_h_l537_c18_291c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l537_c18_291c_x,
CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l538_c30_5d44
sp_relative_shift_uxn_opcodes_h_l538_c30_5d44 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_ins,
sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_x,
sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_y,
sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e
BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_left,
BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_right,
BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output);

-- MUX_uxn_opcodes_h_l542_c9_c1f5
MUX_uxn_opcodes_h_l542_c9_c1f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l542_c9_c1f5_cond,
MUX_uxn_opcodes_h_l542_c9_c1f5_iftrue,
MUX_uxn_opcodes_h_l542_c9_c1f5_iffalse,
MUX_uxn_opcodes_h_l542_c9_c1f5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe
BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_left,
BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_right,
BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output);

-- MUX_uxn_opcodes_h_l543_c16_5bdc
MUX_uxn_opcodes_h_l543_c16_5bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l543_c16_5bdc_cond,
MUX_uxn_opcodes_h_l543_c16_5bdc_iftrue,
MUX_uxn_opcodes_h_l543_c16_5bdc_iffalse,
MUX_uxn_opcodes_h_l543_c16_5bdc_return_output);

-- MUX_uxn_opcodes_h_l544_c16_efc6
MUX_uxn_opcodes_h_l544_c16_efc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l544_c16_efc6_cond,
MUX_uxn_opcodes_h_l544_c16_efc6_iftrue,
MUX_uxn_opcodes_h_l544_c16_efc6_iffalse,
MUX_uxn_opcodes_h_l544_c16_efc6_return_output);

-- device_out_uxn_opcodes_h_l546_c23_249f
device_out_uxn_opcodes_h_l546_c23_249f : entity work.device_out_0CLK_8af766d2 port map (
clk,
device_out_uxn_opcodes_h_l546_c23_249f_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l546_c23_249f_device_address,
device_out_uxn_opcodes_h_l546_c23_249f_value,
device_out_uxn_opcodes_h_l546_c23_249f_phase,
device_out_uxn_opcodes_h_l546_c23_249f_previous_device_ram_read,
device_out_uxn_opcodes_h_l546_c23_249f_previous_ram_read,
device_out_uxn_opcodes_h_l546_c23_249f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l555_c24_0545
BIN_OP_AND_uxn_opcodes_h_l555_c24_0545 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_left,
BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_right,
BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c
current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c
is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_cond,
is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b
BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_left,
BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_right,
BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output,
 CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output,
 sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output,
 MUX_uxn_opcodes_h_l542_c9_c1f5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output,
 MUX_uxn_opcodes_h_l543_c16_5bdc_return_output,
 MUX_uxn_opcodes_h_l544_c16_efc6_return_output,
 device_out_uxn_opcodes_h_l546_c23_249f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l529_c3_058a : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l526_c3_de2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_a7a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l531_c7_e9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l537_c18_291c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l537_c8_1bfb_return_output : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l544_c16_efc6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l544_c16_efc6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l544_c16_efc6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l544_c16_efc6_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l547_c32_dae2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l548_c32_d8eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_990e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_c26_e73c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l551_c29_6156_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l552_c25_dbd5_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_opcodes_h_l553_c22_d3bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l554_c21_d726_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l557_c4_8acd : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l560_c4_334e : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_399f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_1186_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_8246_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_9cac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_c27f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_87b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_a4ff_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_2556_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_b6eb_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l531_l521_DUPLICATE_7543_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l535_DUPLICATE_e1f6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l536_l542_DUPLICATE_231f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_l556_DUPLICATE_2339_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aff6_uxn_opcodes_h_l564_l515_DUPLICATE_4e92_return_output : opcode_result_t;
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
     VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l526_c3_de2e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l526_c3_de2e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_a7a1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_a7a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_right := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l557_c4_8acd := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l557_c4_8acd;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_right := to_unsigned(3, 2);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l529_c3_058a := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l529_c3_058a;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l544_c16_efc6_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l544_c16_efc6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_previous_ram_read := VAR_previous_ram_read;
     VAR_CONST_SR_8_uxn_opcodes_h_l537_c18_291c_x := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_left := t8;
     VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l543_c32_e3fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_left;
     BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output := BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l531_c7_e9b7_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_2556 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_2556_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l535_c11_dbd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_1186 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_1186_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_c27f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_c27f_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_a4ff LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_a4ff_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l521_c6_a039] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_left;
     BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output := BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l537_c18_291c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l537_c18_291c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l537_c18_291c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output := CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l531_c7_e9b7_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l538_c30_5d44] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_ins;
     sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_x <= VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_x;
     sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_y <= VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output := sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l560_c4_b50b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_9cac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_9cac_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_87b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_87b4_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_8246 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_8246_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_399f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_399f_return_output := result.is_device_ram_16bit;

     -- BIN_OP_EQ[uxn_opcodes_h_l542_c9_408e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_left;
     BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output := BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output;

     -- CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_b6eb LATENCY=0
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_b6eb_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l531_c11_3404] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_left;
     BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output := BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l536_l542_DUPLICATE_231f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l536_l542_DUPLICATE_231f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l531_l521_DUPLICATE_7543 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l531_l521_DUPLICATE_7543_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l535_DUPLICATE_e1f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l535_DUPLICATE_e1f6_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l521_c6_a039_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_3404_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_dbd2_return_output;
     VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c9_408e_return_output;
     VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l543_c32_e3fe_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l560_c4_334e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l560_c4_b50b_return_output, 8);
     VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l536_l542_DUPLICATE_231f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l536_l542_DUPLICATE_231f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_a4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_a4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_a4ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_9cac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_9cac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_9cac_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_399f_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_399f_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_399f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_c27f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_c27f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_c27f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l535_DUPLICATE_e1f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l531_l535_DUPLICATE_e1f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l531_l521_DUPLICATE_7543_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l531_l521_DUPLICATE_7543_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_8246_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_8246_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_8246_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_2556_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_2556_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_2556_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_b6eb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_b6eb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_b6eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_1186_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_1186_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_1186_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_87b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_87b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l531_l535_l521_DUPLICATE_87b4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l538_c30_5d44_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l560_c4_334e;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l537_c8_1bfb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l537_c8_1bfb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l537_c18_291c_return_output);

     -- MUX[uxn_opcodes_h_l543_c16_5bdc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l543_c16_5bdc_cond <= VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_cond;
     MUX_uxn_opcodes_h_l543_c16_5bdc_iftrue <= VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_iftrue;
     MUX_uxn_opcodes_h_l543_c16_5bdc_iffalse <= VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_return_output := MUX_uxn_opcodes_h_l543_c16_5bdc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- t8_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     t8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     t8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- MUX[uxn_opcodes_h_l542_c9_c1f5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l542_c9_c1f5_cond <= VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_cond;
     MUX_uxn_opcodes_h_l542_c9_c1f5_iftrue <= VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_iftrue;
     MUX_uxn_opcodes_h_l542_c9_c1f5_iffalse <= VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_return_output := MUX_uxn_opcodes_h_l542_c9_c1f5_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l537_c8_1bfb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_MUX_uxn_opcodes_h_l544_c16_efc6_iffalse := VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_MUX_uxn_opcodes_h_l542_c9_c1f5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_return_output;
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_device_address := VAR_MUX_uxn_opcodes_h_l543_c16_5bdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     -- n8_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     n8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     n8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- MUX[uxn_opcodes_h_l544_c16_efc6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l544_c16_efc6_cond <= VAR_MUX_uxn_opcodes_h_l544_c16_efc6_cond;
     MUX_uxn_opcodes_h_l544_c16_efc6_iftrue <= VAR_MUX_uxn_opcodes_h_l544_c16_efc6_iftrue;
     MUX_uxn_opcodes_h_l544_c16_efc6_iffalse <= VAR_MUX_uxn_opcodes_h_l544_c16_efc6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l544_c16_efc6_return_output := MUX_uxn_opcodes_h_l544_c16_efc6_return_output;

     -- t8_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- l8_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     l8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     l8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_MUX_uxn_opcodes_h_l544_c16_efc6_return_output;
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_value := VAR_MUX_uxn_opcodes_h_l544_c16_efc6_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_l8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     -- n8_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- t8_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l541_c1_531b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output;

     -- l8_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c1_531b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_l8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     -- l8_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- device_out[uxn_opcodes_h_l546_c23_249f] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l546_c23_249f_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l546_c23_249f_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l546_c23_249f_device_address <= VAR_device_out_uxn_opcodes_h_l546_c23_249f_device_address;
     device_out_uxn_opcodes_h_l546_c23_249f_value <= VAR_device_out_uxn_opcodes_h_l546_c23_249f_value;
     device_out_uxn_opcodes_h_l546_c23_249f_phase <= VAR_device_out_uxn_opcodes_h_l546_c23_249f_phase;
     device_out_uxn_opcodes_h_l546_c23_249f_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l546_c23_249f_previous_device_ram_read;
     device_out_uxn_opcodes_h_l546_c23_249f_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l546_c23_249f_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output := device_out_uxn_opcodes_h_l546_c23_249f_return_output;

     -- n8_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l547_c32_dae2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l547_c32_dae2_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l554_c21_d726] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l554_c21_d726_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d[uxn_opcodes_h_l548_c32_d8eb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l548_c32_d8eb_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.is_device_ram_16bit;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l550_c26_e73c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_c26_e73c_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.is_vram_write;

     -- deo_param1_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d[uxn_opcodes_h_l553_c22_d3bc] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_opcodes_h_l553_c22_d3bc_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l551_c29_6156] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l551_c29_6156_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l549_c31_990e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_990e_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.device_ram_address;

     -- CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l552_c25_dbd5] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l552_c25_dbd5_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_l556_DUPLICATE_2339 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_l556_DUPLICATE_2339_return_output := VAR_device_out_uxn_opcodes_h_l546_c23_249f_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_opcodes_h_l553_c22_d3bc_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_l556_DUPLICATE_2339_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_l556_DUPLICATE_2339_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l555_l556_DUPLICATE_2339_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l548_c32_d8eb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l547_c32_dae2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_c26_e73c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l551_c29_6156_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l552_c25_dbd5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l549_c31_990e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l554_c21_d726_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l556_c3_7a5c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output := is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l555_c24_0545] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_left;
     BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output := BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l556_c3_7a5c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l555_c24_0545_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c3_7a5c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l535_c7_1dac] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_cond;
     is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output := is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1dac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l531_c7_e9b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_e9b7_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l521_c2_4f7b] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output := current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_aff6_uxn_opcodes_h_l564_l515_DUPLICATE_4e92 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aff6_uxn_opcodes_h_l564_l515_DUPLICATE_4e92_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_aff6(
     result,
     VAR_result_is_device_ram_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l521_c2_4f7b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aff6_uxn_opcodes_h_l564_l515_DUPLICATE_4e92_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aff6_uxn_opcodes_h_l564_l515_DUPLICATE_4e92_return_output;
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
