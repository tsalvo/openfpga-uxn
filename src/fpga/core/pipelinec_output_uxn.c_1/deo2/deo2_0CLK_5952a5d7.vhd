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
entity deo2_0CLK_5952a5d7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_5952a5d7;
architecture arch of deo2_0CLK_5952a5d7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l556_c6_ac04]
signal BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_f904]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l556_c2_2e48]
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l556_c2_2e48]
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : device_out_result_t;

-- result_MUX[uxn_opcodes_h_l556_c2_2e48]
signal result_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : opcode_result_t;

-- l8_MUX[uxn_opcodes_h_l556_c2_2e48]
signal l8_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l556_c2_2e48]
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l556_c2_2e48]
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l556_c2_2e48]
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l556_c2_2e48]
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l556_c2_2e48]
signal n8_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l556_c2_2e48]
signal t8_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l556_c2_2e48]
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l571_c11_55b3]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l571_c7_f904]
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l571_c7_f904]
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output : device_out_result_t;

-- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_f904]
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l571_c7_f904]
signal l8_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l571_c7_f904]
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l571_c7_f904]
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l571_c7_f904]
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_f904]
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l571_c7_f904]
signal n8_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l571_c7_f904]
signal t8_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l571_c7_f904]
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_922e]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_efa0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : device_out_result_t;

-- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal l8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal n8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal t8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l574_c7_3ea1]
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l579_c17_283d]
signal BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l579_c17_6798]
signal MUX_uxn_opcodes_h_l579_c17_6798_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l579_c17_6798_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l579_c17_6798_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l579_c17_6798_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l580_c17_a735]
signal BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l580_c17_4c93]
signal MUX_uxn_opcodes_h_l580_c17_4c93_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l580_c17_4c93_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l580_c17_4c93_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l580_c17_4c93_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l581_c8_c1d3]
signal MUX_uxn_opcodes_h_l581_c8_c1d3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l581_c8_c1d3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l581_c8_c1d3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l581_c8_c1d3_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l582_c8_359e]
signal MUX_uxn_opcodes_h_l582_c8_359e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l582_c8_359e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l582_c8_359e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l582_c8_359e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l583_c32_10b5]
signal BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l583_c16_1a96]
signal MUX_uxn_opcodes_h_l583_c16_1a96_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l583_c16_1a96_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l583_c16_1a96_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l583_c16_1a96_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l584_c16_d22c]
signal MUX_uxn_opcodes_h_l584_c16_d22c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c16_d22c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l584_c16_d22c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l584_c16_d22c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l585_c43_7e00]
signal sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l585_c30_887c]
signal MUX_uxn_opcodes_h_l585_c30_887c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c30_887c_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l585_c30_887c_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l585_c30_887c_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l586_c23_8321]
signal device_out_uxn_opcodes_h_l586_c23_8321_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_8321_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_8321_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_8321_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_8321_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_8321_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_8321_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l593_c24_581c]
signal BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l594_c3_16fc]
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l594_c3_16fc]
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l598_c4_6afd]
signal BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a258( ref_toks_0 : opcode_result_t;
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
      base.vram_write_layer := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04
BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_left,
BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_right,
BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48
deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48
device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- result_MUX_uxn_opcodes_h_l556_c2_2e48
result_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- l8_MUX_uxn_opcodes_h_l556_c2_2e48
l8_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
l8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
l8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48
is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48
is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48
is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- n8_MUX_uxn_opcodes_h_l556_c2_2e48
n8_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
n8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
n8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- t8_MUX_uxn_opcodes_h_l556_c2_2e48
t8_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
t8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
t8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48
deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_cond,
deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue,
deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse,
deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3
BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l571_c7_f904
deo_param1_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_cond,
deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l571_c7_f904
device_out_result_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_cond,
device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904
result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904
result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- l8_MUX_uxn_opcodes_h_l571_c7_f904
l8_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l571_c7_f904_cond,
l8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
l8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904
is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_cond,
is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904
is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_cond,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904
is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_cond,
is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_cond,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- n8_MUX_uxn_opcodes_h_l571_c7_f904
n8_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l571_c7_f904_cond,
n8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
n8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- t8_MUX_uxn_opcodes_h_l571_c7_f904
t8_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l571_c7_f904_cond,
t8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
t8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l571_c7_f904
deo_param0_MUX_uxn_opcodes_h_l571_c7_f904 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_cond,
deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iftrue,
deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iffalse,
deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e
BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1
deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1
device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1
result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1
result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- l8_MUX_uxn_opcodes_h_l574_c7_3ea1
l8_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1
is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1
is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1
is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_3ea1
n8_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_3ea1
t8_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1
deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_cond,
deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d
BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_left,
BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_right,
BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output);

-- MUX_uxn_opcodes_h_l579_c17_6798
MUX_uxn_opcodes_h_l579_c17_6798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l579_c17_6798_cond,
MUX_uxn_opcodes_h_l579_c17_6798_iftrue,
MUX_uxn_opcodes_h_l579_c17_6798_iffalse,
MUX_uxn_opcodes_h_l579_c17_6798_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735
BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_left,
BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_right,
BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output);

-- MUX_uxn_opcodes_h_l580_c17_4c93
MUX_uxn_opcodes_h_l580_c17_4c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l580_c17_4c93_cond,
MUX_uxn_opcodes_h_l580_c17_4c93_iftrue,
MUX_uxn_opcodes_h_l580_c17_4c93_iffalse,
MUX_uxn_opcodes_h_l580_c17_4c93_return_output);

-- MUX_uxn_opcodes_h_l581_c8_c1d3
MUX_uxn_opcodes_h_l581_c8_c1d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l581_c8_c1d3_cond,
MUX_uxn_opcodes_h_l581_c8_c1d3_iftrue,
MUX_uxn_opcodes_h_l581_c8_c1d3_iffalse,
MUX_uxn_opcodes_h_l581_c8_c1d3_return_output);

-- MUX_uxn_opcodes_h_l582_c8_359e
MUX_uxn_opcodes_h_l582_c8_359e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l582_c8_359e_cond,
MUX_uxn_opcodes_h_l582_c8_359e_iftrue,
MUX_uxn_opcodes_h_l582_c8_359e_iffalse,
MUX_uxn_opcodes_h_l582_c8_359e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_left,
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_right,
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output);

-- MUX_uxn_opcodes_h_l583_c16_1a96
MUX_uxn_opcodes_h_l583_c16_1a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l583_c16_1a96_cond,
MUX_uxn_opcodes_h_l583_c16_1a96_iftrue,
MUX_uxn_opcodes_h_l583_c16_1a96_iffalse,
MUX_uxn_opcodes_h_l583_c16_1a96_return_output);

-- MUX_uxn_opcodes_h_l584_c16_d22c
MUX_uxn_opcodes_h_l584_c16_d22c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l584_c16_d22c_cond,
MUX_uxn_opcodes_h_l584_c16_d22c_iftrue,
MUX_uxn_opcodes_h_l584_c16_d22c_iffalse,
MUX_uxn_opcodes_h_l584_c16_d22c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l585_c43_7e00
sp_relative_shift_uxn_opcodes_h_l585_c43_7e00 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_ins,
sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_x,
sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_y,
sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output);

-- MUX_uxn_opcodes_h_l585_c30_887c
MUX_uxn_opcodes_h_l585_c30_887c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l585_c30_887c_cond,
MUX_uxn_opcodes_h_l585_c30_887c_iftrue,
MUX_uxn_opcodes_h_l585_c30_887c_iffalse,
MUX_uxn_opcodes_h_l585_c30_887c_return_output);

-- device_out_uxn_opcodes_h_l586_c23_8321
device_out_uxn_opcodes_h_l586_c23_8321 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l586_c23_8321_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l586_c23_8321_device_address,
device_out_uxn_opcodes_h_l586_c23_8321_value,
device_out_uxn_opcodes_h_l586_c23_8321_phase,
device_out_uxn_opcodes_h_l586_c23_8321_previous_device_ram_read,
device_out_uxn_opcodes_h_l586_c23_8321_previous_ram_read,
device_out_uxn_opcodes_h_l586_c23_8321_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l593_c24_581c
BIN_OP_AND_uxn_opcodes_h_l593_c24_581c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_left,
BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_right,
BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc
is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_cond,
is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_cond,
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_left,
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_right,
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output,
 deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output,
 MUX_uxn_opcodes_h_l579_c17_6798_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output,
 MUX_uxn_opcodes_h_l580_c17_4c93_return_output,
 MUX_uxn_opcodes_h_l581_c8_c1d3_return_output,
 MUX_uxn_opcodes_h_l582_c8_359e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output,
 MUX_uxn_opcodes_h_l583_c16_1a96_return_output,
 MUX_uxn_opcodes_h_l584_c16_d22c_return_output,
 sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output,
 MUX_uxn_opcodes_h_l585_c30_887c_return_output,
 device_out_uxn_opcodes_h_l586_c23_8321_return_output,
 BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l556_c2_2e48_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258_uxn_opcodes_h_l556_c2_2e48_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l569_c3_4a4b : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l561_c3_eb78 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_532b : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_3e33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_5465 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l574_c7_3ea1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_6798_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_6798_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_6798_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_6798_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_4c93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_4c93_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_4c93_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_4c93_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_359e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_359e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_359e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_359e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_1a96_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_1a96_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_1a96_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_1a96_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_d22c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_d22c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_d22c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_d22c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_887c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_887c_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_887c_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_887c_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l587_c32_e715_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l588_c31_8fd3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l589_c26_4103_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l590_c29_5b3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l591_c22_1206_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l592_c21_23d8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l595_c4_daa5 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l598_c4_4430 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_451e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_8590_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_ff4b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_257c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_a75e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_87aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9bd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_7432_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l593_l594_DUPLICATE_5b01_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l580_c17_4c93_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_532b := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_3e33 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_3e33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_5465 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_5465;
     VAR_MUX_uxn_opcodes_h_l585_c30_887c_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l579_c17_6798_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l569_c3_4a4b := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l569_c3_4a4b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l580_c17_4c93_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l561_c3_eb78 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l579_c17_6798_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l595_c4_daa5 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l595_c4_daa5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l583_c16_1a96_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l584_c16_d22c_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l582_c8_359e_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l582_c8_359e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_left := t8;
     VAR_MUX_uxn_opcodes_h_l583_c16_1a96_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l574_c7_3ea1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_ff4b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_ff4b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_451e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_451e_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_8590 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_8590_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l571_c11_55b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l585_c43_7e00] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_ins;
     sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_x <= VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_x;
     sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_y <= VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output := sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_257c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_257c_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l580_c17_a735] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_left;
     BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output := BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l556_c6_ac04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_left;
     BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output := BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l556_c2_2e48_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l561_c3_eb78,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_532b,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_a75e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_a75e_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l579_c17_283d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_left;
     BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output := BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_7432 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_7432_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l583_c32_10b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l598_c4_6afd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_922e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9bd8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9bd8_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_87aa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_87aa_return_output := result.u16_value;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_ac04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_55b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_922e_return_output;
     VAR_MUX_uxn_opcodes_h_l579_c17_6798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_283d_return_output;
     VAR_MUX_uxn_opcodes_h_l580_c17_4c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_a735_return_output;
     VAR_MUX_uxn_opcodes_h_l583_c16_1a96_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_10b5_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l598_c4_4430 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_6afd_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_ff4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_ff4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_87aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_87aa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_a75e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_a75e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_8590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_8590_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_7432_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_7432_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_451e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_451e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_257c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_257c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9bd8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c30_887c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_7e00_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l598_c4_4430;
     -- MUX[uxn_opcodes_h_l583_c16_1a96] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l583_c16_1a96_cond <= VAR_MUX_uxn_opcodes_h_l583_c16_1a96_cond;
     MUX_uxn_opcodes_h_l583_c16_1a96_iftrue <= VAR_MUX_uxn_opcodes_h_l583_c16_1a96_iftrue;
     MUX_uxn_opcodes_h_l583_c16_1a96_iffalse <= VAR_MUX_uxn_opcodes_h_l583_c16_1a96_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l583_c16_1a96_return_output := MUX_uxn_opcodes_h_l583_c16_1a96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- t8_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- MUX[uxn_opcodes_h_l580_c17_4c93] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l580_c17_4c93_cond <= VAR_MUX_uxn_opcodes_h_l580_c17_4c93_cond;
     MUX_uxn_opcodes_h_l580_c17_4c93_iftrue <= VAR_MUX_uxn_opcodes_h_l580_c17_4c93_iftrue;
     MUX_uxn_opcodes_h_l580_c17_4c93_iffalse <= VAR_MUX_uxn_opcodes_h_l580_c17_4c93_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l580_c17_4c93_return_output := MUX_uxn_opcodes_h_l580_c17_4c93_return_output;

     -- MUX[uxn_opcodes_h_l579_c17_6798] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l579_c17_6798_cond <= VAR_MUX_uxn_opcodes_h_l579_c17_6798_cond;
     MUX_uxn_opcodes_h_l579_c17_6798_iftrue <= VAR_MUX_uxn_opcodes_h_l579_c17_6798_iftrue;
     MUX_uxn_opcodes_h_l579_c17_6798_iffalse <= VAR_MUX_uxn_opcodes_h_l579_c17_6798_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l579_c17_6798_return_output := MUX_uxn_opcodes_h_l579_c17_6798_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_cond := VAR_MUX_uxn_opcodes_h_l579_c17_6798_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c30_887c_cond := VAR_MUX_uxn_opcodes_h_l579_c17_6798_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l579_c17_6798_return_output;
     VAR_MUX_uxn_opcodes_h_l582_c8_359e_cond := VAR_MUX_uxn_opcodes_h_l580_c17_4c93_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l580_c17_4c93_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l583_c16_1a96_return_output;
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_device_address := VAR_MUX_uxn_opcodes_h_l583_c16_1a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     -- is_phase_3_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- t8_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     t8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     t8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output := t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- MUX[uxn_opcodes_h_l581_c8_c1d3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l581_c8_c1d3_cond <= VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_cond;
     MUX_uxn_opcodes_h_l581_c8_c1d3_iftrue <= VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_iftrue;
     MUX_uxn_opcodes_h_l581_c8_c1d3_iffalse <= VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_return_output := MUX_uxn_opcodes_h_l581_c8_c1d3_return_output;

     -- MUX[uxn_opcodes_h_l585_c30_887c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l585_c30_887c_cond <= VAR_MUX_uxn_opcodes_h_l585_c30_887c_cond;
     MUX_uxn_opcodes_h_l585_c30_887c_iftrue <= VAR_MUX_uxn_opcodes_h_l585_c30_887c_iftrue;
     MUX_uxn_opcodes_h_l585_c30_887c_iffalse <= VAR_MUX_uxn_opcodes_h_l585_c30_887c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l585_c30_887c_return_output := MUX_uxn_opcodes_h_l585_c30_887c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- MUX[uxn_opcodes_h_l582_c8_359e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l582_c8_359e_cond <= VAR_MUX_uxn_opcodes_h_l582_c8_359e_cond;
     MUX_uxn_opcodes_h_l582_c8_359e_iftrue <= VAR_MUX_uxn_opcodes_h_l582_c8_359e_iftrue;
     MUX_uxn_opcodes_h_l582_c8_359e_iffalse <= VAR_MUX_uxn_opcodes_h_l582_c8_359e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l582_c8_359e_return_output := MUX_uxn_opcodes_h_l582_c8_359e_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_MUX_uxn_opcodes_h_l584_c16_d22c_iffalse := VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l581_c8_c1d3_return_output;
     VAR_MUX_uxn_opcodes_h_l584_c16_d22c_iftrue := VAR_MUX_uxn_opcodes_h_l582_c8_359e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l582_c8_359e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l585_c30_887c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_t8_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output := deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_efa0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output := is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- MUX[uxn_opcodes_h_l584_c16_d22c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l584_c16_d22c_cond <= VAR_MUX_uxn_opcodes_h_l584_c16_d22c_cond;
     MUX_uxn_opcodes_h_l584_c16_d22c_iftrue <= VAR_MUX_uxn_opcodes_h_l584_c16_d22c_iftrue;
     MUX_uxn_opcodes_h_l584_c16_d22c_iffalse <= VAR_MUX_uxn_opcodes_h_l584_c16_d22c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l584_c16_d22c_return_output := MUX_uxn_opcodes_h_l584_c16_d22c_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output := is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- l8_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- t8_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     t8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     t8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_efa0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_MUX_uxn_opcodes_h_l584_c16_d22c_return_output;
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_value := VAR_MUX_uxn_opcodes_h_l584_c16_d22c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_l8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- l8_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     l8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     l8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output := l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- n8_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     n8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     n8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output := n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- device_out[uxn_opcodes_h_l586_c23_8321] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l586_c23_8321_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l586_c23_8321_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l586_c23_8321_device_address <= VAR_device_out_uxn_opcodes_h_l586_c23_8321_device_address;
     device_out_uxn_opcodes_h_l586_c23_8321_value <= VAR_device_out_uxn_opcodes_h_l586_c23_8321_value;
     device_out_uxn_opcodes_h_l586_c23_8321_phase <= VAR_device_out_uxn_opcodes_h_l586_c23_8321_phase;
     device_out_uxn_opcodes_h_l586_c23_8321_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l586_c23_8321_previous_device_ram_read;
     device_out_uxn_opcodes_h_l586_c23_8321_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l586_c23_8321_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output := device_out_uxn_opcodes_h_l586_c23_8321_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_l8_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_n8_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l592_c21_23d8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l592_c21_23d8_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.u8_value;

     -- deo_param1_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output := deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l590_c29_5b3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l590_c29_5b3b_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l587_c32_e715] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l587_c32_e715_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.is_device_ram_write;

     -- n8_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     n8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     n8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l591_c22_1206] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l591_c22_1206_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l593_l594_DUPLICATE_5b01 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l593_l594_DUPLICATE_5b01_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.is_deo_done;

     -- l8_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     l8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     l8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l589_c26_4103] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l589_c26_4103_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l588_c31_8fd3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l588_c31_8fd3_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_8321_return_output.device_ram_address;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l591_c22_1206_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l593_l594_DUPLICATE_5b01_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l593_l594_DUPLICATE_5b01_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l593_l594_DUPLICATE_5b01_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l587_c32_e715_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l589_c26_4103_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l590_c29_5b3b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l588_c31_8fd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l592_c21_23d8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l593_c24_581c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_left;
     BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output := BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l594_c3_16fc] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output := current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l594_c3_16fc] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_cond;
     is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output := is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output := device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_581c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_16fc_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_16fc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_3ea1_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output := is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output := current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_f904] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_f904_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258_uxn_opcodes_h_l556_c2_2e48_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a258(
     result,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_f904_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_f904_return_output);

     -- current_deo_phase_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258_uxn_opcodes_h_l556_c2_2e48_return_output;
     -- result_MUX[uxn_opcodes_h_l556_c2_2e48] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l556_c2_2e48_cond <= VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_cond;
     result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue <= VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_iftrue;
     result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse <= VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output := result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l556_c2_2e48_return_output;
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
