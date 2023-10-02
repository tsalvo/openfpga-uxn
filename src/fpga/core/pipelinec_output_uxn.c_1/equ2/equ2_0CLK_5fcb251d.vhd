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
-- Submodules: 108
entity equ2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_5fcb251d;
architecture arch of equ2_0CLK_5fcb251d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l950_c6_202b]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l950_c1_4903]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l950_c2_ae04]
signal t16_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l950_c2_ae04]
signal n16_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l950_c2_ae04]
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l951_c3_425d[uxn_opcodes_h_l951_c3_425d]
signal printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l958_c11_7e12]
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal t16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal n16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l958_c7_c8f9]
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_7699]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l962_c7_548e]
signal t16_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c7_548e]
signal n16_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c7_548e]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_c4d3]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l968_c7_eb87]
signal t16_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_eb87]
signal n16_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l968_c7_eb87]
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l972_c11_0e6f]
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l972_c7_b5de]
signal t16_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l972_c7_b5de]
signal n16_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l972_c7_b5de]
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l973_c3_fb6e]
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_ac87]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_ad85]
signal n16_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_ad85]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l981_c11_a8ce]
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l981_c7_2848]
signal n16_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l981_c7_2848]
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_e909]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l987_c7_964f]
signal n16_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l987_c7_964f]
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_143d]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_5e58]
signal n16_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l991_c7_5e58]
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l992_c3_7021]
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l995_c32_df24]
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l995_c32_4ec4]
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l995_c32_9c36]
signal MUX_uxn_opcodes_h_l995_c32_9c36_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_9c36_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_9c36_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_9c36_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l997_c11_5b4e]
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_9b89]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_9b89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_9b89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_9b89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l997_c7_9b89]
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c24_afdd]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1001_c24_4df8]
signal MUX_uxn_opcodes_h_l1001_c24_4df8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_4df8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_4df8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_4df8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_1de7]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_76eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_76eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b
BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output);

-- t16_MUX_uxn_opcodes_h_l950_c2_ae04
t16_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
t16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
t16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- n16_MUX_uxn_opcodes_h_l950_c2_ae04
n16_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
n16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
n16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04
result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_cond,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

-- printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d
printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d : entity work.printf_uxn_opcodes_h_l951_c3_425d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12
BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_left,
BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_right,
BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output);

-- t16_MUX_uxn_opcodes_h_l958_c7_c8f9
t16_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- n16_MUX_uxn_opcodes_h_l958_c7_c8f9
n16_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9
result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699
BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output);

-- t16_MUX_uxn_opcodes_h_l962_c7_548e
t16_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l962_c7_548e_cond,
t16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
t16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c7_548e
n16_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c7_548e_cond,
n16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
n16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e
result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output);

-- t16_MUX_uxn_opcodes_h_l968_c7_eb87
t16_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
t16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
t16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_eb87
n16_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
n16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87
result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_cond,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f
BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_left,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_right,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output);

-- t16_MUX_uxn_opcodes_h_l972_c7_b5de
t16_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
t16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
t16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- n16_MUX_uxn_opcodes_h_l972_c7_b5de
n16_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
n16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
n16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de
result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_cond,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e
BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_left,
BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_right,
BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87
BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_ad85
n16_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
n16_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85
result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce
BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_left,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_right,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output);

-- n16_MUX_uxn_opcodes_h_l981_c7_2848
n16_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l981_c7_2848_cond,
n16_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
n16_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848
result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_cond,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output);

-- n16_MUX_uxn_opcodes_h_l987_c7_964f
n16_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l987_c7_964f_cond,
n16_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
n16_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f
result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_cond,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d
BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_5e58
n16_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
n16_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58
result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_cond,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l992_c3_7021
BIN_OP_OR_uxn_opcodes_h_l992_c3_7021 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_left,
BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_right,
BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l995_c32_df24
BIN_OP_AND_uxn_opcodes_h_l995_c32_df24 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_left,
BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_right,
BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4
BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_left,
BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_right,
BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output);

-- MUX_uxn_opcodes_h_l995_c32_9c36
MUX_uxn_opcodes_h_l995_c32_9c36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l995_c32_9c36_cond,
MUX_uxn_opcodes_h_l995_c32_9c36_iftrue,
MUX_uxn_opcodes_h_l995_c32_9c36_iffalse,
MUX_uxn_opcodes_h_l995_c32_9c36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e
BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_left,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_right,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89
result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_cond,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output);

-- MUX_uxn_opcodes_h_l1001_c24_4df8
MUX_uxn_opcodes_h_l1001_c24_4df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1001_c24_4df8_cond,
MUX_uxn_opcodes_h_l1001_c24_4df8_iftrue,
MUX_uxn_opcodes_h_l1001_c24_4df8_iffalse,
MUX_uxn_opcodes_h_l1001_c24_4df8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output);



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
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output,
 t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output,
 t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output,
 t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output,
 t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output,
 t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output,
 n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output,
 n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output,
 BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output,
 BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output,
 BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output,
 MUX_uxn_opcodes_h_l995_c32_9c36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output,
 MUX_uxn_opcodes_h_l1001_c24_4df8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_bb1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_78b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_d58f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_556e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_8d74 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_a717 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_f011 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_f0fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_5e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_9c36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_9c36_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_9c36_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_9c36_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_e71b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_685b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_32be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1008_l946_DUPLICATE_4ac3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_8d74 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_8d74;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l995_c32_9c36_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_e71b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_e71b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_bb1d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_bb1d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_f0fd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_f0fd;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_78b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_78b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_d58f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_d58f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_f011 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_f011;
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l995_c32_9c36_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_a717 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_a717;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_556e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_556e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l981_c11_a8ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_c4d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c24_afdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_32be LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_32be_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_685b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_685b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l995_c32_df24] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_left;
     BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output := BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_143d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_7699] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c6_202b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_e909] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_ae04_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_1de7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_ac87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l958_c11_7e12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_left;
     BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output := BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l972_c11_0e6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_5e58_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l997_c11_5b4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_df24_return_output;
     VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_afdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_1de7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_202b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_7e12_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_7699_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c4d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_0e6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_ac87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_a8ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_e909_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_143d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_5b4e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_685b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_685b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l992_l963_l973_DUPLICATE_685b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_DUPLICATE_3c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_l997_DUPLICATE_c8f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_29b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l991_l958_l987_l981_l977_l972_l1003_l968_DUPLICATE_ac48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_32be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_32be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l991_l958_l987_l950_l981_l977_l972_l968_l997_DUPLICATE_2260_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_ae04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_5e58_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l950_c1_4903] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_76eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l973_c3_fb6e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_left;
     BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output := BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l992_c3_7021] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_left;
     BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output := BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_76eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_9b89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_9b89] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;

     -- MUX[uxn_opcodes_h_l1001_c24_4df8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1001_c24_4df8_cond <= VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_cond;
     MUX_uxn_opcodes_h_l1001_c24_4df8_iftrue <= VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_iftrue;
     MUX_uxn_opcodes_h_l1001_c24_4df8_iffalse <= VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_return_output := MUX_uxn_opcodes_h_l1001_c24_4df8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l995_c32_4ec4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_left;
     BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output := BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l995_c32_9c36_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_4ec4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_fb6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_7021_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_d123_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue := VAR_MUX_uxn_opcodes_h_l1001_c24_4df8_return_output;
     VAR_printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_4903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_76eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- MUX[uxn_opcodes_h_l995_c32_9c36] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l995_c32_9c36_cond <= VAR_MUX_uxn_opcodes_h_l995_c32_9c36_cond;
     MUX_uxn_opcodes_h_l995_c32_9c36_iftrue <= VAR_MUX_uxn_opcodes_h_l995_c32_9c36_iftrue;
     MUX_uxn_opcodes_h_l995_c32_9c36_iffalse <= VAR_MUX_uxn_opcodes_h_l995_c32_9c36_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l995_c32_9c36_return_output := MUX_uxn_opcodes_h_l995_c32_9c36_return_output;

     -- t16_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     t16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     t16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_9b89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;

     -- printf_uxn_opcodes_h_l951_c3_425d[uxn_opcodes_h_l951_c3_425d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l951_c3_425d_uxn_opcodes_h_l951_c3_425d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l997_c7_9b89] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_cond;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output := result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_9b89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;

     -- n16_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue := VAR_MUX_uxn_opcodes_h_l995_c32_9c36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_9b89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_t16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- n16_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     n16_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     n16_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output := n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- t16_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     t16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     t16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_5e58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_n16_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_5e58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- t16_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     t16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     t16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output := t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_964f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output;

     -- n16_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     n16_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     n16_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output := n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_964f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- t16_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- n16_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_2848] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_2848_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_t16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- n16_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     n16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     n16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- t16_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     t16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     t16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_ad85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_n16_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_ad85_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_b5de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_b5de_return_output;
     -- n16_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     n16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output := n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_eb87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_eb87_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- n16_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_548e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_n16_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_548e_return_output;
     -- n16_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     n16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     n16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l958_c7_c8f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_c8f9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l950_c2_ae04] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_cond;
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output := result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1008_l946_DUPLICATE_4ac3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1008_l946_DUPLICATE_4ac3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_ae04_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_ae04_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1008_l946_DUPLICATE_4ac3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1008_l946_DUPLICATE_4ac3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
