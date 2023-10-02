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
-- Submodules: 124
entity and2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_b14a5a36;
architecture arch of and2_0CLK_b14a5a36 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l718_c6_0a8f]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l718_c1_a3b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l718_c2_944f]
signal t16_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l718_c2_944f]
signal n16_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l718_c2_944f]
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l718_c2_944f]
signal tmp16_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l719_c3_f20d[uxn_opcodes_h_l719_c3_f20d]
signal printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_b04f]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_1d08]
signal t16_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l726_c7_1d08]
signal n16_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l726_c7_1d08]
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l726_c7_1d08]
signal tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l730_c11_f48b]
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l730_c7_bce4]
signal t16_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l730_c7_bce4]
signal n16_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l730_c7_bce4]
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l730_c7_bce4]
signal tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_de70]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_72ff]
signal t16_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l736_c7_72ff]
signal n16_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l736_c7_72ff]
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l736_c7_72ff]
signal tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l740_c11_5f1e]
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l740_c7_2b81]
signal t16_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l740_c7_2b81]
signal n16_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l740_c7_2b81]
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l740_c7_2b81]
signal tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l741_c3_0fd1]
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l745_c11_3050]
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l745_c7_5413]
signal n16_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l745_c7_5413]
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l745_c7_5413]
signal tmp16_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c11_67dc]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal n16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l749_c7_8fd0]
signal tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l755_c11_7d2d]
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l755_c7_151e]
signal n16_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l755_c7_151e]
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l755_c7_151e]
signal tmp16_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l759_c11_8c40]
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal n16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l759_c7_a0d4]
signal tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l760_c3_e36e]
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l761_c11_6a28]
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l764_c32_1947]
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l764_c32_f3f4]
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l764_c32_0e44]
signal MUX_uxn_opcodes_h_l764_c32_0e44_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_0e44_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_0e44_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l764_c32_0e44_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l766_c11_a04c]
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l766_c7_860f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l766_c7_860f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l766_c7_860f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l766_c7_860f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l766_c7_860f]
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_c4c4]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_efe2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_efe2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_efe2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l772_c7_efe2]
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l775_c34_1685]
signal CONST_SR_8_uxn_opcodes_h_l775_c34_1685_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_b33f]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_a117]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_a117]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f
BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output);

-- t16_MUX_uxn_opcodes_h_l718_c2_944f
t16_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l718_c2_944f_cond,
t16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
t16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- n16_MUX_uxn_opcodes_h_l718_c2_944f
n16_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l718_c2_944f_cond,
n16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
n16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f
result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_cond,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l718_c2_944f
tmp16_MUX_uxn_opcodes_h_l718_c2_944f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l718_c2_944f_cond,
tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue,
tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse,
tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

-- printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d
printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d : entity work.printf_uxn_opcodes_h_l719_c3_f20d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f
BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_1d08
t16_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
t16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- n16_MUX_uxn_opcodes_h_l726_c7_1d08
n16_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
n16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
n16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08
result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- tmp16_MUX_uxn_opcodes_h_l726_c7_1d08
tmp16_MUX_uxn_opcodes_h_l726_c7_1d08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_cond,
tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue,
tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse,
tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b
BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_left,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_right,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output);

-- t16_MUX_uxn_opcodes_h_l730_c7_bce4
t16_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
t16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
t16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- n16_MUX_uxn_opcodes_h_l730_c7_bce4
n16_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
n16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
n16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4
result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l730_c7_bce4
tmp16_MUX_uxn_opcodes_h_l730_c7_bce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_cond,
tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue,
tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse,
tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70
BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_72ff
t16_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
t16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- n16_MUX_uxn_opcodes_h_l736_c7_72ff
n16_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
n16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
n16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff
result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l736_c7_72ff
tmp16_MUX_uxn_opcodes_h_l736_c7_72ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_cond,
tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e
BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_left,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_right,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output);

-- t16_MUX_uxn_opcodes_h_l740_c7_2b81
t16_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
t16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
t16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- n16_MUX_uxn_opcodes_h_l740_c7_2b81
n16_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
n16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
n16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81
result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- tmp16_MUX_uxn_opcodes_h_l740_c7_2b81
tmp16_MUX_uxn_opcodes_h_l740_c7_2b81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_cond,
tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue,
tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse,
tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1
BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_left,
BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_right,
BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_left,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_right,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output);

-- n16_MUX_uxn_opcodes_h_l745_c7_5413
n16_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l745_c7_5413_cond,
n16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
n16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413
result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_cond,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- tmp16_MUX_uxn_opcodes_h_l745_c7_5413
tmp16_MUX_uxn_opcodes_h_l745_c7_5413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l745_c7_5413_cond,
tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue,
tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse,
tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc
BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output);

-- n16_MUX_uxn_opcodes_h_l749_c7_8fd0
n16_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0
result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0
tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond,
tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue,
tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse,
tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d
BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_left,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_right,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output);

-- n16_MUX_uxn_opcodes_h_l755_c7_151e
n16_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l755_c7_151e_cond,
n16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
n16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e
result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_cond,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l755_c7_151e
tmp16_MUX_uxn_opcodes_h_l755_c7_151e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l755_c7_151e_cond,
tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue,
tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse,
tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40
BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_left,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_right,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output);

-- n16_MUX_uxn_opcodes_h_l759_c7_a0d4
n16_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4
result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4
tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond,
tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue,
tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse,
tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e
BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_left,
BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_right,
BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28
BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_left,
BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_right,
BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l764_c32_1947
BIN_OP_AND_uxn_opcodes_h_l764_c32_1947 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_left,
BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_right,
BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4
BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_left,
BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_right,
BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output);

-- MUX_uxn_opcodes_h_l764_c32_0e44
MUX_uxn_opcodes_h_l764_c32_0e44 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l764_c32_0e44_cond,
MUX_uxn_opcodes_h_l764_c32_0e44_iftrue,
MUX_uxn_opcodes_h_l764_c32_0e44_iffalse,
MUX_uxn_opcodes_h_l764_c32_0e44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c
BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_left,
BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_right,
BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f
result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_cond,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4
BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2
result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_cond,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l775_c34_1685
CONST_SR_8_uxn_opcodes_h_l775_c34_1685 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l775_c34_1685_x,
CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f
BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660
CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output,
 t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output,
 t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output,
 t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output,
 BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output,
 n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output,
 n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output,
 n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output,
 n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output,
 BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output,
 BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output,
 MUX_uxn_opcodes_h_l764_c32_0e44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output,
 CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_6e6b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_48a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_02ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_1f92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_2c1a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_982e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_6e6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_e467 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_a0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_0e44_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_0e44_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_0e44_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l764_c32_0e44_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_f37b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_c095_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_4d06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_1685_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_9cba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l760_l731_l750_DUPLICATE_c159_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_0847_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l782_l714_DUPLICATE_f5bd_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_f37b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_f37b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_6e6e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_6e6e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_2c1a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_2c1a;
     VAR_MUX_uxn_opcodes_h_l764_c32_0e44_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_4d06 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_4d06;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_982e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_982e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_02ee := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_02ee;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l764_c32_0e44_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_6e6b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_6e6b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_e467 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_e467;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_1f92 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_1f92;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_48a4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_48a4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_1685_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l718_c6_0a8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l760_l731_l750_DUPLICATE_c159 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l760_l731_l750_DUPLICATE_c159_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_b04f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l766_c11_a04c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_left;
     BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output := BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l740_c11_5f1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_944f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_c4c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_b33f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l730_c11_f48b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_left;
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output := BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c11_67dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_de70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l770_c24_c095] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_c095_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_0847 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_0847_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l775_c34_1685] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l775_c34_1685_x <= VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_1685_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output := CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l755_c11_7d2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l764_c32_1947] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_left;
     BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output := BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output := result.is_sp_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_a0d4_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l745_c11_3050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_left;
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output := BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l759_c11_8c40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_left;
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output := BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l764_c32_1947_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c6_0a8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_b04f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_f48b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_de70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_5f1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3050_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_67dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_7d2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_8c40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l766_c11_a04c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_c4c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_b33f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l760_l731_l750_DUPLICATE_c159_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l760_l731_l750_DUPLICATE_c159_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l741_l760_l731_l750_DUPLICATE_c159_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l770_c24_c095_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_DUPLICATE_55b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l766_l730_l759_l726_l755_l749_l745_l777_l740_l772_DUPLICATE_c553_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l736_l766_l730_l726_l755_l718_l749_l745_l740_DUPLICATE_7690_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l749_l745_l777_l740_DUPLICATE_65ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_0847_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l759_l772_DUPLICATE_0847_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l736_l730_l759_l726_l755_l718_l749_l745_l740_l772_DUPLICATE_8ca7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l718_c2_944f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_c7_a0d4_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_a117] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_a117] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c24_9cba] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_9cba_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_1685_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l766_c7_860f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l764_c32_f3f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_left;
     BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output := BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l718_c1_a3b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_efe2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l760_c3_e36e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_left;
     BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output := BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l741_c3_0fd1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_left;
     BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output := BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l764_c32_0e44_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l764_c32_f3f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_0fd1_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_right := VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l760_c3_e36e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_9cba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l751_l732_DUPLICATE_9660_return_output;
     VAR_printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l718_c1_a3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_a117_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l766_c7_860f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_a117_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l761_c11_6a28] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_left;
     BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output := BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output;

     -- n16_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l766_c7_860f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l772_c7_efe2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output := result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_efe2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;

     -- printf_uxn_opcodes_h_l719_c3_f20d[uxn_opcodes_h_l719_c3_f20d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l719_c3_f20d_uxn_opcodes_h_l719_c3_f20d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     t16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     t16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_efe2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;

     -- MUX[uxn_opcodes_h_l764_c32_0e44] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l764_c32_0e44_cond <= VAR_MUX_uxn_opcodes_h_l764_c32_0e44_cond;
     MUX_uxn_opcodes_h_l764_c32_0e44_iftrue <= VAR_MUX_uxn_opcodes_h_l764_c32_0e44_iftrue;
     MUX_uxn_opcodes_h_l764_c32_0e44_iffalse <= VAR_MUX_uxn_opcodes_h_l764_c32_0e44_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l764_c32_0e44_return_output := MUX_uxn_opcodes_h_l764_c32_0e44_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l761_c11_6a28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue := VAR_MUX_uxn_opcodes_h_l764_c32_0e44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l766_c7_860f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_efe2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l766_c7_860f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l766_c7_860f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output := result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- n16_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     n16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     n16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output := n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l766_c7_860f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output;

     -- t16_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l766_c7_860f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l766_c7_860f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l766_c7_860f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     -- t16_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     t16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     t16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output := tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- n16_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l759_c7_a0d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_n16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_a0d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_t16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- t16_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- n16_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     n16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     n16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output := n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_151e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_n16_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l755_c7_151e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     n16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     n16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- t16_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     t16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     t16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output := t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l749_c7_8fd0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output := result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output := tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_8fd0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l718_c2_944f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_5413] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- n16_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     n16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     n16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_5413_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_2b81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     n16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     n16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l740_c7_2b81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l736_c7_72ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- n16_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     n16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     n16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c7_72ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- n16_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     n16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     n16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output := n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l730_c7_bce4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output := result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l718_c2_944f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l730_c7_bce4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output := tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l726_c7_1d08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output := result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l726_c7_1d08_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l718_c2_944f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l718_c2_944f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l782_l714_DUPLICATE_f5bd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l782_l714_DUPLICATE_f5bd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l718_c2_944f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l718_c2_944f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l782_l714_DUPLICATE_f5bd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l782_l714_DUPLICATE_f5bd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
