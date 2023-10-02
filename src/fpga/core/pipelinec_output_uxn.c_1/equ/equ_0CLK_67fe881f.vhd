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
-- Submodules: 66
entity equ_0CLK_67fe881f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_67fe881f;
architecture arch of equ_0CLK_67fe881f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_e7d0]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_4454]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l905_c2_89cd]
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_89cd]
signal t8_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_89cd]
signal n8_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l906_c3_8351[uxn_opcodes_h_l906_c3_8351]
signal printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_0af9]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l913_c7_ef32]
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l913_c7_ef32]
signal t8_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l913_c7_ef32]
signal n8_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_3d4a]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l917_c7_f88c]
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_f88c]
signal t8_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_f88c]
signal n8_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_086a]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l922_c7_3326]
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l922_c7_3326]
signal n8_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_ed52]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l926_c7_f4aa]
signal n8_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l930_c32_e541]
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l930_c32_c781]
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l930_c32_f3f0]
signal MUX_uxn_opcodes_h_l930_c32_f3f0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_f3f0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_f3f0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_f3f0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l932_c11_f8b9]
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l932_c7_bfc8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_bfc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_bfc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_bfc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l932_c7_bfc8]
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l936_c24_b267]
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l936_c24_02ce]
signal MUX_uxn_opcodes_h_l936_c24_02ce_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_02ce_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_02ce_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_02ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l938_c11_8519]
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_0174]
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_0174]
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0
BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd
result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_89cd
t8_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
t8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_89cd
n8_MUX_uxn_opcodes_h_l905_c2_89cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_89cd_cond,
n8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

-- printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351
printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351 : entity work.printf_uxn_opcodes_h_l906_c3_8351_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32
result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- t8_MUX_uxn_opcodes_h_l913_c7_ef32
t8_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
t8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
t8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- n8_MUX_uxn_opcodes_h_l913_c7_ef32
n8_MUX_uxn_opcodes_h_l913_c7_ef32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l913_c7_ef32_cond,
n8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue,
n8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse,
n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a
BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c
result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_f88c
t8_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
t8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_f88c
n8_MUX_uxn_opcodes_h_l917_c7_f88c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_f88c_cond,
n8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a
BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326
result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_cond,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- n8_MUX_uxn_opcodes_h_l922_c7_3326
n8_MUX_uxn_opcodes_h_l922_c7_3326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l922_c7_3326_cond,
n8_MUX_uxn_opcodes_h_l922_c7_3326_iftrue,
n8_MUX_uxn_opcodes_h_l922_c7_3326_iffalse,
n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa
result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- n8_MUX_uxn_opcodes_h_l926_c7_f4aa
n8_MUX_uxn_opcodes_h_l926_c7_f4aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l926_c7_f4aa_cond,
n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue,
n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse,
n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l930_c32_e541
BIN_OP_AND_uxn_opcodes_h_l930_c32_e541 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_left,
BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_right,
BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l930_c32_c781
BIN_OP_GT_uxn_opcodes_h_l930_c32_c781 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_left,
BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_right,
BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output);

-- MUX_uxn_opcodes_h_l930_c32_f3f0
MUX_uxn_opcodes_h_l930_c32_f3f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l930_c32_f3f0_cond,
MUX_uxn_opcodes_h_l930_c32_f3f0_iftrue,
MUX_uxn_opcodes_h_l930_c32_f3f0_iffalse,
MUX_uxn_opcodes_h_l930_c32_f3f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9
BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_left,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_right,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8
result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_cond,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267
BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_left,
BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_right,
BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output);

-- MUX_uxn_opcodes_h_l936_c24_02ce
MUX_uxn_opcodes_h_l936_c24_02ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l936_c24_02ce_cond,
MUX_uxn_opcodes_h_l936_c24_02ce_iftrue,
MUX_uxn_opcodes_h_l936_c24_02ce_iffalse,
MUX_uxn_opcodes_h_l936_c24_02ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519
BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_left,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_right,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output,
 BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output,
 MUX_uxn_opcodes_h_l930_c32_f3f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output,
 MUX_uxn_opcodes_h_l936_c24_02ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_3cc2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_73b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_5ef0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_h_l918_c3_d61f : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_e643 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_f4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue : unsigned(15 downto 0);
 variable VAR_n8_uxn_opcodes_h_l927_c3_a4a8 : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_7736 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_02ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_02ce_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_02ce_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_02ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_a89a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l943_l901_DUPLICATE_f9ef_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_3cc2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_3cc2;
     VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l936_c24_02ce_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_5ef0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_5ef0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_73b4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_73b4;
     VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l936_c24_02ce_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_7736 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_7736;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_e643 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_e643;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_left := VAR_phase;
     VAR_n8_uxn_opcodes_h_l927_c3_a4a8 := resize(VAR_previous_stack_read, 16);
     VAR_t8_uxn_opcodes_h_l918_c3_d61f := resize(VAR_previous_stack_read, 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := t8;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := VAR_n8_uxn_opcodes_h_l927_c3_a4a8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_t8_uxn_opcodes_h_l918_c3_d61f;
     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_ed52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_89cd_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_3d4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_e7d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l936_c24_b267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_left;
     BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output := BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_0af9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_a89a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_a89a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l930_c32_e541] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_left;
     BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output := BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_f4aa_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_086a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l932_c11_f8b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l938_c11_8519] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_left;
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output := BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_left := VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_e541_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_e7d0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0af9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_3d4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_086a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ed52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_f8b9_return_output;
     VAR_MUX_uxn_opcodes_h_l936_c24_02ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_b267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_8519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_9262_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_f145_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_cae8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_fb0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_a89a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_a89a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_8936_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_89cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_f4aa_return_output;
     -- t8_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l932_c7_bfc8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_bfc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_0174] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- MUX[uxn_opcodes_h_l936_c24_02ce] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l936_c24_02ce_cond <= VAR_MUX_uxn_opcodes_h_l936_c24_02ce_cond;
     MUX_uxn_opcodes_h_l936_c24_02ce_iftrue <= VAR_MUX_uxn_opcodes_h_l936_c24_02ce_iftrue;
     MUX_uxn_opcodes_h_l936_c24_02ce_iffalse <= VAR_MUX_uxn_opcodes_h_l936_c24_02ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l936_c24_02ce_return_output := MUX_uxn_opcodes_h_l936_c24_02ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_0174] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l930_c32_c781] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_left;
     BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output := BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_4454] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output;

     -- n8_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_c781_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue := VAR_MUX_uxn_opcodes_h_l936_c24_02ce_return_output;
     VAR_printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_4454_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_n8_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_0174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_0174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     -- MUX[uxn_opcodes_h_l930_c32_f3f0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l930_c32_f3f0_cond <= VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_cond;
     MUX_uxn_opcodes_h_l930_c32_f3f0_iftrue <= VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_iftrue;
     MUX_uxn_opcodes_h_l930_c32_f3f0_iffalse <= VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_return_output := MUX_uxn_opcodes_h_l930_c32_f3f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_bfc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- t8_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     t8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     t8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- printf_uxn_opcodes_h_l906_c3_8351[uxn_opcodes_h_l906_c3_8351] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l906_c3_8351_uxn_opcodes_h_l906_c3_8351_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     n8_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     n8_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output := n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l932_c7_bfc8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output := result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_bfc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue := VAR_MUX_uxn_opcodes_h_l930_c32_f3f0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_bfc8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_f4aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_f4aa_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- n8_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     n8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     n8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l922_c7_3326] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_cond;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output := result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_3326_return_output;
     -- n8_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_f88c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_f88c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l913_c7_ef32] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_cond;
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output := result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_ef32_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l905_c2_89cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l943_l901_DUPLICATE_f9ef LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l943_l901_DUPLICATE_f9ef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_89cd_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_89cd_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l943_l901_DUPLICATE_f9ef_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l943_l901_DUPLICATE_f9ef_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
