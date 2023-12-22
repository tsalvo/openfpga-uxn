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
entity deo2_0CLK_563c42d4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_563c42d4;
architecture arch of deo2_0CLK_563c42d4 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l556_c6_92d9]
signal BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l556_c2_5927]
signal t8_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l556_c2_5927]
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l556_c2_5927]
signal n8_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l556_c2_5927]
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l556_c2_5927]
signal result_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l556_c2_5927_return_output : opcode_result_t;

-- l8_MUX[uxn_opcodes_h_l556_c2_5927]
signal l8_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l556_c2_5927]
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l556_c2_5927]
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l556_c2_5927]
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l556_c2_5927]
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l556_c2_5927]
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l571_c11_131d]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal t8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal n8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : signed(3 downto 0);

-- l8_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal l8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_e3a4]
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_9fa7]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_7f8e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal t8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal n8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : signed(3 downto 0);

-- l8_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal l8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_bb5c]
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l579_c17_17a0]
signal BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l579_c17_aec3]
signal MUX_uxn_opcodes_h_l579_c17_aec3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l579_c17_aec3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l579_c17_aec3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l579_c17_aec3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l580_c17_0af9]
signal BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l580_c17_28a4]
signal MUX_uxn_opcodes_h_l580_c17_28a4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l580_c17_28a4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l580_c17_28a4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l580_c17_28a4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l581_c8_9e0c]
signal MUX_uxn_opcodes_h_l581_c8_9e0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l581_c8_9e0c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l581_c8_9e0c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l581_c8_9e0c_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l582_c8_ddc1]
signal MUX_uxn_opcodes_h_l582_c8_ddc1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l582_c8_ddc1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l582_c8_ddc1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l582_c8_ddc1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l583_c32_2448]
signal BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l583_c16_0e78]
signal MUX_uxn_opcodes_h_l583_c16_0e78_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l583_c16_0e78_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l583_c16_0e78_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l583_c16_0e78_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l584_c16_bbfe]
signal MUX_uxn_opcodes_h_l584_c16_bbfe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c16_bbfe_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l584_c16_bbfe_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l584_c16_bbfe_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l585_c43_8853]
signal sp_relative_shift_uxn_opcodes_h_l585_c43_8853_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l585_c43_8853_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l585_c43_8853_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l585_c30_5dd9]
signal MUX_uxn_opcodes_h_l585_c30_5dd9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c30_5dd9_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l585_c30_5dd9_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l585_c30_5dd9_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l586_c23_ae7a]
signal device_out_uxn_opcodes_h_l586_c23_ae7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_ae7a_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_ae7a_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_ae7a_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_ae7a_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_ae7a_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l586_c23_ae7a_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l593_c24_2e8f]
signal BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l594_c3_fb88]
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l594_c3_fb88]
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l598_c4_43ce]
signal BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_82d1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9
BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_left,
BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_right,
BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- t8_MUX_uxn_opcodes_h_l556_c2_5927
t8_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l556_c2_5927_cond,
t8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
t8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927
is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_cond,
is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- n8_MUX_uxn_opcodes_h_l556_c2_5927
n8_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l556_c2_5927_cond,
n8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
n8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l556_c2_5927
deo_param1_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_cond,
deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- result_MUX_uxn_opcodes_h_l556_c2_5927
result_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l556_c2_5927_cond,
result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
result_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- l8_MUX_uxn_opcodes_h_l556_c2_5927
l8_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l556_c2_5927_cond,
l8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
l8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l556_c2_5927
deo_param0_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_cond,
deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927
is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_cond,
is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927
is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_cond,
is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l556_c2_5927
device_out_result_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_cond,
device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_cond,
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d
BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- t8_MUX_uxn_opcodes_h_l571_c7_e3a4
t8_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4
is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- n8_MUX_uxn_opcodes_h_l571_c7_e3a4
n8_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4
deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4
result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4
result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- l8_MUX_uxn_opcodes_h_l571_c7_e3a4
l8_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4
deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4
is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4
is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4
device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7
BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_bb5c
t8_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c
is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_bb5c
n8_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c
deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c
result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c
result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- l8_MUX_uxn_opcodes_h_l574_c7_bb5c
l8_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c
deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c
is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c
is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c
device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0
BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_left,
BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_right,
BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output);

-- MUX_uxn_opcodes_h_l579_c17_aec3
MUX_uxn_opcodes_h_l579_c17_aec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l579_c17_aec3_cond,
MUX_uxn_opcodes_h_l579_c17_aec3_iftrue,
MUX_uxn_opcodes_h_l579_c17_aec3_iffalse,
MUX_uxn_opcodes_h_l579_c17_aec3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9
BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_left,
BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_right,
BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output);

-- MUX_uxn_opcodes_h_l580_c17_28a4
MUX_uxn_opcodes_h_l580_c17_28a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l580_c17_28a4_cond,
MUX_uxn_opcodes_h_l580_c17_28a4_iftrue,
MUX_uxn_opcodes_h_l580_c17_28a4_iffalse,
MUX_uxn_opcodes_h_l580_c17_28a4_return_output);

-- MUX_uxn_opcodes_h_l581_c8_9e0c
MUX_uxn_opcodes_h_l581_c8_9e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l581_c8_9e0c_cond,
MUX_uxn_opcodes_h_l581_c8_9e0c_iftrue,
MUX_uxn_opcodes_h_l581_c8_9e0c_iffalse,
MUX_uxn_opcodes_h_l581_c8_9e0c_return_output);

-- MUX_uxn_opcodes_h_l582_c8_ddc1
MUX_uxn_opcodes_h_l582_c8_ddc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l582_c8_ddc1_cond,
MUX_uxn_opcodes_h_l582_c8_ddc1_iftrue,
MUX_uxn_opcodes_h_l582_c8_ddc1_iffalse,
MUX_uxn_opcodes_h_l582_c8_ddc1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_left,
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_right,
BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output);

-- MUX_uxn_opcodes_h_l583_c16_0e78
MUX_uxn_opcodes_h_l583_c16_0e78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l583_c16_0e78_cond,
MUX_uxn_opcodes_h_l583_c16_0e78_iftrue,
MUX_uxn_opcodes_h_l583_c16_0e78_iffalse,
MUX_uxn_opcodes_h_l583_c16_0e78_return_output);

-- MUX_uxn_opcodes_h_l584_c16_bbfe
MUX_uxn_opcodes_h_l584_c16_bbfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l584_c16_bbfe_cond,
MUX_uxn_opcodes_h_l584_c16_bbfe_iftrue,
MUX_uxn_opcodes_h_l584_c16_bbfe_iffalse,
MUX_uxn_opcodes_h_l584_c16_bbfe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l585_c43_8853
sp_relative_shift_uxn_opcodes_h_l585_c43_8853 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l585_c43_8853_ins,
sp_relative_shift_uxn_opcodes_h_l585_c43_8853_x,
sp_relative_shift_uxn_opcodes_h_l585_c43_8853_y,
sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output);

-- MUX_uxn_opcodes_h_l585_c30_5dd9
MUX_uxn_opcodes_h_l585_c30_5dd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l585_c30_5dd9_cond,
MUX_uxn_opcodes_h_l585_c30_5dd9_iftrue,
MUX_uxn_opcodes_h_l585_c30_5dd9_iffalse,
MUX_uxn_opcodes_h_l585_c30_5dd9_return_output);

-- device_out_uxn_opcodes_h_l586_c23_ae7a
device_out_uxn_opcodes_h_l586_c23_ae7a : entity work.device_out_0CLK_6ed52cc1 port map (
clk,
device_out_uxn_opcodes_h_l586_c23_ae7a_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l586_c23_ae7a_device_address,
device_out_uxn_opcodes_h_l586_c23_ae7a_value,
device_out_uxn_opcodes_h_l586_c23_ae7a_phase,
device_out_uxn_opcodes_h_l586_c23_ae7a_previous_device_ram_read,
device_out_uxn_opcodes_h_l586_c23_ae7a_previous_ram_read,
device_out_uxn_opcodes_h_l586_c23_ae7a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f
BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_left,
BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_right,
BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88
is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_cond,
is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_cond,
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_left,
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_right,
BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 result_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output,
 MUX_uxn_opcodes_h_l579_c17_aec3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output,
 MUX_uxn_opcodes_h_l580_c17_28a4_return_output,
 MUX_uxn_opcodes_h_l581_c8_9e0c_return_output,
 MUX_uxn_opcodes_h_l582_c8_ddc1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output,
 MUX_uxn_opcodes_h_l583_c16_0e78_return_output,
 MUX_uxn_opcodes_h_l584_c16_bbfe_return_output,
 sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output,
 MUX_uxn_opcodes_h_l585_c30_5dd9_return_output,
 device_out_uxn_opcodes_h_l586_c23_ae7a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l556_c2_5927_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1_uxn_opcodes_h_l556_c2_5927_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l569_c3_df15 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l561_c3_1676 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_d28a : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_4860 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_f253 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l574_c7_bb5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_aec3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_aec3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_aec3_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l579_c17_aec3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_28a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_28a4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_28a4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l580_c17_28a4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_0e78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_0e78_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_0e78_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l583_c16_0e78_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l587_c32_e29a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l588_c31_c88e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l589_c26_d04f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l590_c29_2462_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l591_c22_304e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l592_c21_8ba9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l595_c4_30f0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l598_c4_fd06 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_1142_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_3b4b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9815_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9e61_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_34ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_70fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_cf73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_4f94_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l594_l593_DUPLICATE_e0aa_return_output : unsigned(0 downto 0);
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
     VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_right := to_unsigned(2, 2);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l561_c3_1676 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_MUX_uxn_opcodes_h_l580_c17_28a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_d28a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_f253 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_f253;
     VAR_MUX_uxn_opcodes_h_l579_c17_aec3_iffalse := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_4860 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_4860;
     VAR_MUX_uxn_opcodes_h_l579_c17_aec3_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l569_c3_df15 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l569_c3_df15;
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l580_c17_28a4_iffalse := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l595_c4_30f0 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l595_c4_30f0;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l583_c16_0e78_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_left := t8;
     VAR_MUX_uxn_opcodes_h_l583_c16_0e78_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l556_c6_92d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l579_c17_17a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l580_c17_0af9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_left;
     BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output := BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_4f94 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_4f94_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_34ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_34ba_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l583_c32_2448] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_left;
     BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output := BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_1142 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_1142_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_3b4b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_3b4b_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_70fc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_70fc_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l585_c43_8853] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l585_c43_8853_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_ins;
     sp_relative_shift_uxn_opcodes_h_l585_c43_8853_x <= VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_x;
     sp_relative_shift_uxn_opcodes_h_l585_c43_8853_y <= VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output := sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l571_c11_131d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9815 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9815_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_cf73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_cf73_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_9fa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9e61 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9e61_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l556_c2_5927_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l561_c3_1676,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_d28a,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_opcodes_h_l598_c4_43ce] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_left;
     BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output := BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l574_c7_bb5c_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c6_92d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_131d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_9fa7_return_output;
     VAR_MUX_uxn_opcodes_h_l579_c17_aec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c17_17a0_return_output;
     VAR_MUX_uxn_opcodes_h_l580_c17_28a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c17_0af9_return_output;
     VAR_MUX_uxn_opcodes_h_l583_c16_0e78_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l583_c32_2448_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l598_c4_fd06 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l598_c4_43ce_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_4f94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_4f94_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_70fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_70fc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_cf73_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_cf73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_1142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_1142_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9815_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9815_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_3b4b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_3b4b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9e61_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_9e61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_34ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l571_l574_DUPLICATE_34ba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l585_c43_8853_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l598_c4_fd06;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- MUX[uxn_opcodes_h_l583_c16_0e78] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l583_c16_0e78_cond <= VAR_MUX_uxn_opcodes_h_l583_c16_0e78_cond;
     MUX_uxn_opcodes_h_l583_c16_0e78_iftrue <= VAR_MUX_uxn_opcodes_h_l583_c16_0e78_iftrue;
     MUX_uxn_opcodes_h_l583_c16_0e78_iffalse <= VAR_MUX_uxn_opcodes_h_l583_c16_0e78_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l583_c16_0e78_return_output := MUX_uxn_opcodes_h_l583_c16_0e78_return_output;

     -- t8_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- MUX[uxn_opcodes_h_l580_c17_28a4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l580_c17_28a4_cond <= VAR_MUX_uxn_opcodes_h_l580_c17_28a4_cond;
     MUX_uxn_opcodes_h_l580_c17_28a4_iftrue <= VAR_MUX_uxn_opcodes_h_l580_c17_28a4_iftrue;
     MUX_uxn_opcodes_h_l580_c17_28a4_iffalse <= VAR_MUX_uxn_opcodes_h_l580_c17_28a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l580_c17_28a4_return_output := MUX_uxn_opcodes_h_l580_c17_28a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- MUX[uxn_opcodes_h_l579_c17_aec3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l579_c17_aec3_cond <= VAR_MUX_uxn_opcodes_h_l579_c17_aec3_cond;
     MUX_uxn_opcodes_h_l579_c17_aec3_iftrue <= VAR_MUX_uxn_opcodes_h_l579_c17_aec3_iftrue;
     MUX_uxn_opcodes_h_l579_c17_aec3_iffalse <= VAR_MUX_uxn_opcodes_h_l579_c17_aec3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l579_c17_aec3_return_output := MUX_uxn_opcodes_h_l579_c17_aec3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_cond := VAR_MUX_uxn_opcodes_h_l579_c17_aec3_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_cond := VAR_MUX_uxn_opcodes_h_l579_c17_aec3_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l579_c17_aec3_return_output;
     VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_cond := VAR_MUX_uxn_opcodes_h_l580_c17_28a4_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l580_c17_28a4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l583_c16_0e78_return_output;
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_device_address := VAR_MUX_uxn_opcodes_h_l583_c16_0e78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     -- MUX[uxn_opcodes_h_l581_c8_9e0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l581_c8_9e0c_cond <= VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_cond;
     MUX_uxn_opcodes_h_l581_c8_9e0c_iftrue <= VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_iftrue;
     MUX_uxn_opcodes_h_l581_c8_9e0c_iffalse <= VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_return_output := MUX_uxn_opcodes_h_l581_c8_9e0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- MUX[uxn_opcodes_h_l585_c30_5dd9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l585_c30_5dd9_cond <= VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_cond;
     MUX_uxn_opcodes_h_l585_c30_5dd9_iftrue <= VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_iftrue;
     MUX_uxn_opcodes_h_l585_c30_5dd9_iffalse <= VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_return_output := MUX_uxn_opcodes_h_l585_c30_5dd9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- MUX[uxn_opcodes_h_l582_c8_ddc1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l582_c8_ddc1_cond <= VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_cond;
     MUX_uxn_opcodes_h_l582_c8_ddc1_iftrue <= VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_iftrue;
     MUX_uxn_opcodes_h_l582_c8_ddc1_iffalse <= VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_return_output := MUX_uxn_opcodes_h_l582_c8_ddc1_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_iffalse := VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l581_c8_9e0c_return_output;
     VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_iftrue := VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l582_c8_ddc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l585_c30_5dd9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_t8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     -- l8_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- MUX[uxn_opcodes_h_l584_c16_bbfe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l584_c16_bbfe_cond <= VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_cond;
     MUX_uxn_opcodes_h_l584_c16_bbfe_iftrue <= VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_iftrue;
     MUX_uxn_opcodes_h_l584_c16_bbfe_iffalse <= VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_return_output := MUX_uxn_opcodes_h_l584_c16_bbfe_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- t8_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     t8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     t8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output := t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_7f8e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_7f8e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_return_output;
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_value := VAR_MUX_uxn_opcodes_h_l584_c16_bbfe_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     -- l8_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- device_out[uxn_opcodes_h_l586_c23_ae7a] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l586_c23_ae7a_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l586_c23_ae7a_device_address <= VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_device_address;
     device_out_uxn_opcodes_h_l586_c23_ae7a_value <= VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_value;
     device_out_uxn_opcodes_h_l586_c23_ae7a_phase <= VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_phase;
     device_out_uxn_opcodes_h_l586_c23_ae7a_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_previous_device_ram_read;
     device_out_uxn_opcodes_h_l586_c23_ae7a_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output := device_out_uxn_opcodes_h_l586_c23_ae7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output := is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output := is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output := deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_l8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_n8_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l589_c26_d04f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l589_c26_d04f_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.is_vram_write;

     -- deo_param1_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l592_c21_8ba9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l592_c21_8ba9_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.u8_value;

     -- l8_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     l8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     l8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output := l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l591_c22_304e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l591_c22_304e_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.u16_addr;

     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- n8_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     n8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     n8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output := n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l587_c32_e29a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l587_c32_e29a_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l588_c31_c88e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l588_c31_c88e_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l594_l593_DUPLICATE_e0aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l594_l593_DUPLICATE_e0aa_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l590_c29_2462] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l590_c29_2462_return_output := VAR_device_out_uxn_opcodes_h_l586_c23_ae7a_return_output.vram_write_layer;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l591_c22_304e_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l594_l593_DUPLICATE_e0aa_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l594_l593_DUPLICATE_e0aa_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l594_l593_DUPLICATE_e0aa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l587_c32_e29a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l589_c26_d04f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l590_c29_2462_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l588_c31_c88e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l592_c21_8ba9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l594_c3_fb88] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_cond;
     is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output := is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l593_c24_2e8f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_left;
     BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output := BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l594_c3_fb88] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output := current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output := deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l593_c24_2e8f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c3_fb88_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c3_fb88_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_bb5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output := device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_bb5c_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_e3a4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output := is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output := current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1_uxn_opcodes_h_l556_c2_5927_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_82d1(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_e3a4_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1_uxn_opcodes_h_l556_c2_5927_return_output;
     -- result_MUX[uxn_opcodes_h_l556_c2_5927] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l556_c2_5927_cond <= VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_cond;
     result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue <= VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_iftrue;
     result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse <= VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output := result_MUX_uxn_opcodes_h_l556_c2_5927_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l556_c2_5927_return_output;
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
