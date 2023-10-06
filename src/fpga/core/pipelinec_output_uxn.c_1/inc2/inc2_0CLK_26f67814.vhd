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
-- Submodules: 77
entity inc2_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_26f67814;
architecture arch of inc2_0CLK_26f67814 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_393d]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_8e4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal t16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1560_c2_68e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1561_c3_26a7[uxn_opcodes_h_l1561_c3_26a7]
signal printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1566_c11_11de]
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1566_c7_6e0f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1569_c11_7293]
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1569_c7_436b]
signal t16_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1569_c7_436b]
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1569_c7_436b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1571_c3_ce7c]
signal CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_7bae]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_f2f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_6121]
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal t16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1577_c7_efcf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1578_c3_fe03]
signal BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1579_c11_90c0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1582_c32_02e1]
signal BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1582_c32_ed0c]
signal BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1582_c32_d4ab]
signal MUX_uxn_opcodes_h_l1582_c32_d4ab_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1582_c32_d4ab_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1582_c32_d4ab_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_121c]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1584_c7_d0a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1584_c7_d0a2]
signal result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1584_c7_d0a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1584_c7_d0a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_d0a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_a835]
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1590_c7_1c51]
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_1c51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_1c51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_1c51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1592_c34_09d5]
signal CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_f94c]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_db69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c7_db69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output);

-- t16_MUX_uxn_opcodes_h_l1560_c2_68e0
t16_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0
tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0
result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0
result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

-- printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7
printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7 : entity work.printf_uxn_opcodes_h_l1561_c3_26a7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_left,
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_right,
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output);

-- t16_MUX_uxn_opcodes_h_l1566_c7_6e0f
t16_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f
tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f
result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_left,
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_right,
BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output);

-- t16_MUX_uxn_opcodes_h_l1569_c7_436b
t16_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
t16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
t16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1569_c7_436b
tmp16_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b
result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c
CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_x,
CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output);

-- t16_MUX_uxn_opcodes_h_l1574_c7_f2f9
t16_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9
tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_left,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_right,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output);

-- t16_MUX_uxn_opcodes_h_l1577_c7_efcf
t16_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf
tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf
result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf
result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf
result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf
result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03
BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_left,
BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_right,
BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0
BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1
BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_left,
BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_right,
BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c
BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_left,
BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_right,
BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output);

-- MUX_uxn_opcodes_h_l1582_c32_d4ab
MUX_uxn_opcodes_h_l1582_c32_d4ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1582_c32_d4ab_cond,
MUX_uxn_opcodes_h_l1582_c32_d4ab_iftrue,
MUX_uxn_opcodes_h_l1582_c32_d4ab_iffalse,
MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2
result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2
result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_left,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_right,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_cond,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5
CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_x,
CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output,
 t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output,
 t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output,
 t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output,
 t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output,
 t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output,
 MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output,
 CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1563_c3_0f7b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_6edc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_e103 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_2076 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1579_c3_1f88 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_f717 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1588_c24_f23a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1591_c3_d771 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1592_c24_bca5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1570_l1578_DUPLICATE_d50f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1577_l1590_DUPLICATE_8bde_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1556_l1599_DUPLICATE_9979_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1563_c3_0f7b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1563_c3_0f7b;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_6edc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_6edc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_e103 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_e103;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_f717 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_f717;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_2076 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_2076;
     VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1591_c3_d771 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1591_c3_d771;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := to_unsigned(1, 1);

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l1582_c32_02e1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_left;
     BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output := BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1566_c11_11de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_7bae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1588_c24_f23a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1588_c24_f23a_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l1592_c34_09d5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output := CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_a835] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_left;
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output := BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1569_c11_7293] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_left;
     BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output := BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1577_l1590_DUPLICATE_8bde LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1577_l1590_DUPLICATE_8bde_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_f94c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_6121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_left;
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output := BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_393d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_121c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1570_l1578_DUPLICATE_d50f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1570_l1578_DUPLICATE_d50f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1582_c32_02e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_393d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_11de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c11_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7bae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_121c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_a835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_f94c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1570_l1578_DUPLICATE_d50f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1570_l1578_DUPLICATE_d50f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1588_c24_f23a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1560_DUPLICATE_0271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1584_l1577_l1574_l1569_l1594_l1566_l1590_DUPLICATE_bb95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1584_l1574_l1569_l1566_l1560_DUPLICATE_7ca8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1566_l1577_l1569_l1574_DUPLICATE_9577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1594_l1566_l1590_l1560_DUPLICATE_f7d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1577_l1590_DUPLICATE_8bde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1577_l1590_DUPLICATE_8bde_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1577_l1574_l1569_l1566_l1590_l1560_DUPLICATE_d0f7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1584_c7_d0a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1578_c3_fe03] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_left;
     BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output := BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1571_c3_ce7c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output := CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1592_c24_bca5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1592_c24_bca5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1592_c34_09d5_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c7_db69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_1c51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1582_c32_ed0c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_left;
     BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output := BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_8e4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_db69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1582_c32_ed0c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1578_c3_fe03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1592_c24_bca5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1571_c3_ce7c_return_output;
     VAR_printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_8e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_db69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c7_db69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_1c51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1584_c7_d0a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1579_c11_90c0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output;

     -- MUX[uxn_opcodes_h_l1582_c32_d4ab] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1582_c32_d4ab_cond <= VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_cond;
     MUX_uxn_opcodes_h_l1582_c32_d4ab_iftrue <= VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_iftrue;
     MUX_uxn_opcodes_h_l1582_c32_d4ab_iffalse <= VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output := MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1590_c7_1c51] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output := result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_1c51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;

     -- printf_uxn_opcodes_h_l1561_c3_26a7[uxn_opcodes_h_l1561_c3_26a7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1561_c3_26a7_uxn_opcodes_h_l1561_c3_26a7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1579_c3_1f88 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1579_c11_90c0_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_MUX_uxn_opcodes_h_l1582_c32_d4ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_1c51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue := VAR_tmp16_uxn_opcodes_h_l1579_c3_1f88;
     -- t16_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_d0a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1584_c7_d0a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1584_c7_d0a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1584_c7_d0a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     -- t16_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     t16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     t16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1577_c7_efcf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1577_c7_efcf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     -- t16_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_f2f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c7_436b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c7_436b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1566_c7_6e0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1566_c7_6e0f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1560_c2_68e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1556_l1599_DUPLICATE_9979 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1556_l1599_DUPLICATE_9979_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1560_c2_68e0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1556_l1599_DUPLICATE_9979_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1556_l1599_DUPLICATE_9979_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
