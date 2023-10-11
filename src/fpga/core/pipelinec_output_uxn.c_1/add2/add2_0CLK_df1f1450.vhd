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
-- Submodules: 114
entity add2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_df1f1450;
architecture arch of add2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l899_c6_4e41]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l899_c1_b121]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l899_c2_03bb]
signal n16_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c2_03bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c2_03bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c2_03bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c2_03bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l899_c2_03bb]
signal result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c2_03bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l899_c2_03bb]
signal tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l899_c2_03bb]
signal t16_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l900_c3_4d37[uxn_opcodes_h_l900_c3_4d37]
signal printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l904_c11_53c5]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l904_c7_758e]
signal n16_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c7_758e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c7_758e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c7_758e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c7_758e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l904_c7_758e]
signal result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l904_c7_758e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l904_c7_758e]
signal tmp16_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l904_c7_758e]
signal t16_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l907_c11_d7e2]
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l907_c7_5911]
signal n16_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l907_c7_5911]
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_5911]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_5911]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_5911]
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l907_c7_5911]
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l907_c7_5911]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l907_c7_5911]
signal tmp16_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l907_c7_5911]
signal t16_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l912_c11_8204]
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l912_c7_2d97]
signal n16_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l912_c7_2d97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l912_c7_2d97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l912_c7_2d97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l912_c7_2d97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l912_c7_2d97]
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l912_c7_2d97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l912_c7_2d97]
signal tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l912_c7_2d97]
signal t16_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l915_c11_f3b6]
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l915_c7_aced]
signal n16_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l915_c7_aced]
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l915_c7_aced]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l915_c7_aced]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l915_c7_aced]
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l915_c7_aced]
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l915_c7_aced]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l915_c7_aced]
signal tmp16_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l915_c7_aced]
signal t16_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l916_c3_2b48]
signal BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l919_c11_4a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l919_c7_7aad]
signal n16_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l919_c7_7aad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l919_c7_7aad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l919_c7_7aad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l919_c7_7aad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l919_c7_7aad]
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l919_c7_7aad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l919_c7_7aad]
signal tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_ca51]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l922_c7_281a]
signal n16_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_281a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_281a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_281a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_281a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l922_c7_281a]
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_281a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l922_c7_281a]
signal tmp16_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l927_c11_ffc0]
signal BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l927_c7_1155]
signal n16_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l927_c7_1155]
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l927_c7_1155]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l927_c7_1155]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l927_c7_1155]
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l927_c7_1155]
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l927_c7_1155]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l927_c7_1155]
signal tmp16_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_3204]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l930_c7_2816]
signal n16_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_2816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_2816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_2816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_2816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l930_c7_2816]
signal result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_2816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l930_c7_2816]
signal tmp16_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l931_c3_8443]
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l932_c11_81db]
signal BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l934_c32_f521]
signal BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l934_c32_b42f]
signal BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l934_c32_0199]
signal MUX_uxn_opcodes_h_l934_c32_0199_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l934_c32_0199_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l934_c32_0199_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l934_c32_0199_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l936_c11_ffbc]
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l936_c7_ca07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l936_c7_ca07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l936_c7_ca07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l936_c7_ca07]
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l936_c7_ca07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l942_c11_3ac3]
signal BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l942_c7_5c9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l942_c7_5c9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l942_c7_5c9d]
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l942_c7_5c9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l944_c34_11f6]
signal CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l946_c11_8079]
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l946_c7_4c2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l946_c7_4c2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41
BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output);

-- n16_MUX_uxn_opcodes_h_l899_c2_03bb
n16_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
n16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
n16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb
result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb
result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb
result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l899_c2_03bb
tmp16_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- t16_MUX_uxn_opcodes_h_l899_c2_03bb
t16_MUX_uxn_opcodes_h_l899_c2_03bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l899_c2_03bb_cond,
t16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue,
t16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse,
t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

-- printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37
printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37 : entity work.printf_uxn_opcodes_h_l900_c3_4d37_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5
BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output);

-- n16_MUX_uxn_opcodes_h_l904_c7_758e
n16_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l904_c7_758e_cond,
n16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
n16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e
result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_cond,
result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e
result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l904_c7_758e
tmp16_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l904_c7_758e_cond,
tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- t16_MUX_uxn_opcodes_h_l904_c7_758e
t16_MUX_uxn_opcodes_h_l904_c7_758e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l904_c7_758e_cond,
t16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue,
t16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse,
t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2
BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_left,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_right,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output);

-- n16_MUX_uxn_opcodes_h_l907_c7_5911
n16_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l907_c7_5911_cond,
n16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
n16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911
result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_cond,
result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- tmp16_MUX_uxn_opcodes_h_l907_c7_5911
tmp16_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l907_c7_5911_cond,
tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- t16_MUX_uxn_opcodes_h_l907_c7_5911
t16_MUX_uxn_opcodes_h_l907_c7_5911 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l907_c7_5911_cond,
t16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue,
t16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse,
t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204
BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_left,
BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_right,
BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output);

-- n16_MUX_uxn_opcodes_h_l912_c7_2d97
n16_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
n16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
n16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97
result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- tmp16_MUX_uxn_opcodes_h_l912_c7_2d97
tmp16_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- t16_MUX_uxn_opcodes_h_l912_c7_2d97
t16_MUX_uxn_opcodes_h_l912_c7_2d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l912_c7_2d97_cond,
t16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue,
t16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse,
t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_left,
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_right,
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output);

-- n16_MUX_uxn_opcodes_h_l915_c7_aced
n16_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l915_c7_aced_cond,
n16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
n16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced
result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_cond,
result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- tmp16_MUX_uxn_opcodes_h_l915_c7_aced
tmp16_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l915_c7_aced_cond,
tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- t16_MUX_uxn_opcodes_h_l915_c7_aced
t16_MUX_uxn_opcodes_h_l915_c7_aced : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l915_c7_aced_cond,
t16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue,
t16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse,
t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48
BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_left,
BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_right,
BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e
BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output);

-- n16_MUX_uxn_opcodes_h_l919_c7_7aad
n16_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
n16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
n16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad
result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l919_c7_7aad
tmp16_MUX_uxn_opcodes_h_l919_c7_7aad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_cond,
tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue,
tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse,
tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51
BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output);

-- n16_MUX_uxn_opcodes_h_l922_c7_281a
n16_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l922_c7_281a_cond,
n16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
n16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a
result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_cond,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l922_c7_281a
tmp16_MUX_uxn_opcodes_h_l922_c7_281a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l922_c7_281a_cond,
tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue,
tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse,
tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0
BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_left,
BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_right,
BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output);

-- n16_MUX_uxn_opcodes_h_l927_c7_1155
n16_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l927_c7_1155_cond,
n16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
n16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155
result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155
result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_cond,
result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- tmp16_MUX_uxn_opcodes_h_l927_c7_1155
tmp16_MUX_uxn_opcodes_h_l927_c7_1155 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l927_c7_1155_cond,
tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue,
tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse,
tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output);

-- n16_MUX_uxn_opcodes_h_l930_c7_2816
n16_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l930_c7_2816_cond,
n16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
n16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816
result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_cond,
result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- tmp16_MUX_uxn_opcodes_h_l930_c7_2816
tmp16_MUX_uxn_opcodes_h_l930_c7_2816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l930_c7_2816_cond,
tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue,
tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse,
tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l931_c3_8443
BIN_OP_OR_uxn_opcodes_h_l931_c3_8443 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_left,
BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_right,
BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db
BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_left,
BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_right,
BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l934_c32_f521
BIN_OP_AND_uxn_opcodes_h_l934_c32_f521 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_left,
BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_right,
BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f
BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_left,
BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_right,
BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output);

-- MUX_uxn_opcodes_h_l934_c32_0199
MUX_uxn_opcodes_h_l934_c32_0199 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l934_c32_0199_cond,
MUX_uxn_opcodes_h_l934_c32_0199_iftrue,
MUX_uxn_opcodes_h_l934_c32_0199_iffalse,
MUX_uxn_opcodes_h_l934_c32_0199_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc
BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_left,
BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_right,
BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07
result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_cond,
result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3
BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_left,
BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_right,
BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d
result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_cond,
result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l944_c34_11f6
CONST_SR_8_uxn_opcodes_h_l944_c34_11f6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_x,
CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079
BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_left,
BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_right,
BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3
CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output,
 n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output,
 n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output,
 n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output,
 n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output,
 n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output,
 BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output,
 n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output,
 n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output,
 n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output,
 n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output,
 BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output,
 BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output,
 BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output,
 MUX_uxn_opcodes_h_l934_c32_0199_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output,
 CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_ec92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_3d01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_0e40 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l913_c3_858d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_3df9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_a622 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l925_c3_6a18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_b1f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l932_c3_593c : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l934_c32_0199_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l934_c32_0199_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l934_c32_0199_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l934_c32_0199_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l939_c3_b0a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l940_c24_1984_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_a349 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_52f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l908_l916_l931_l923_DUPLICATE_416f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l942_l930_DUPLICATE_4840_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l951_l895_DUPLICATE_ad81_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_a349 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l943_c3_a349;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l913_c3_858d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l913_c3_858d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_ec92 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_ec92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_3df9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l917_c3_3df9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_0e40 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_0e40;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l925_c3_6a18 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l925_c3_6a18;
     VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_b1f1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_b1f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l934_c32_0199_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_a622 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_a622;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_3d01 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_3d01;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l939_c3_b0a1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l939_c3_b0a1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l934_c32_0199_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l946_c11_8079] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_left;
     BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output := BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c11_53c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l912_c11_8204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_left;
     BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output := BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l944_c34_11f6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output := CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l940_c24_1984] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l940_c24_1984_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_AND[uxn_opcodes_h_l934_c32_f521] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_left;
     BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output := BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c6_4e41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l908_l916_l931_l923_DUPLICATE_416f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l908_l916_l931_l923_DUPLICATE_416f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l942_c11_3ac3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_left;
     BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output := BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l919_c11_4a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_3204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l936_c11_ffbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l927_c11_ffc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l915_c11_f3b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l907_c11_d7e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_ca51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l942_l930_DUPLICATE_4840 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l942_l930_DUPLICATE_4840_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l934_c32_f521_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c6_4e41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_53c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_d7e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_8204_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f3b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l919_c11_4a5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_ca51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_ffc0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_3204_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_ffbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l942_c11_3ac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l946_c11_8079_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l908_l916_l931_l923_DUPLICATE_416f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l908_l916_l931_l923_DUPLICATE_416f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l908_l916_l931_l923_DUPLICATE_416f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l940_c24_1984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_9faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l936_l907_l930_l904_l927_l922_l919_l946_l915_l942_l912_DUPLICATE_6d52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l936_l907_l904_l927_l899_l922_l919_l915_l912_DUPLICATE_d9c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l946_l915_l942_l912_DUPLICATE_1f79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l942_l930_DUPLICATE_4840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l942_l930_DUPLICATE_4840_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l907_l930_l904_l927_l899_l922_l919_l915_l942_l912_DUPLICATE_68e9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l942_c7_5c9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l916_c3_2b48] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_left;
     BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output := BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l946_c7_4c2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l934_c32_b42f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_left;
     BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output := BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l899_c1_b121] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l946_c7_4c2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l931_c3_8443] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_left;
     BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output := BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l944_c24_52f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_52f6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l944_c34_11f6_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l936_c7_ca07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l934_c32_0199_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l934_c32_b42f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l916_c3_2b48_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_right := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_8443_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l944_c24_52f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l909_l924_DUPLICATE_72c3_return_output;
     VAR_printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l899_c1_b121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l946_c7_4c2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;
     -- MUX[uxn_opcodes_h_l934_c32_0199] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l934_c32_0199_cond <= VAR_MUX_uxn_opcodes_h_l934_c32_0199_cond;
     MUX_uxn_opcodes_h_l934_c32_0199_iftrue <= VAR_MUX_uxn_opcodes_h_l934_c32_0199_iftrue;
     MUX_uxn_opcodes_h_l934_c32_0199_iffalse <= VAR_MUX_uxn_opcodes_h_l934_c32_0199_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l934_c32_0199_return_output := MUX_uxn_opcodes_h_l934_c32_0199_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- printf_uxn_opcodes_h_l900_c3_4d37[uxn_opcodes_h_l900_c3_4d37] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l900_c3_4d37_uxn_opcodes_h_l900_c3_4d37_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l936_c7_ca07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l942_c7_5c9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l932_c11_81db] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_left;
     BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output := BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output;

     -- t16_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     t16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     t16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output := t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- n16_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     n16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     n16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output := n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l942_c7_5c9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l942_c7_5c9d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output := result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l932_c3_593c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l932_c11_81db_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_MUX_uxn_opcodes_h_l934_c32_0199_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_n16_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l942_c7_5c9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_t16_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue := VAR_tmp16_uxn_opcodes_h_l932_c3_593c;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l936_c7_ca07] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_cond;
     result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output := result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output := tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l936_c7_ca07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l936_c7_ca07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;

     -- n16_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     n16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     n16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output := n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- t16_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     t16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     t16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_ca07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_t16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- n16_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     n16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     n16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output := n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output := tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- t16_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     t16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     t16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output := t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output := result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_2816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c7_2816_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- t16_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     t16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     t16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output := t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output := tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- n16_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     n16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     n16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l927_c7_1155] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_cond;
     result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output := result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_n16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_1155_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     -- n16_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     n16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     n16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output := n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- t16_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     t16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     t16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l922_c7_281a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output := result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_281a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output := tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l919_c7_7aad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output := result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;

     -- n16_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     n16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     n16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_n16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l919_c7_7aad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output := result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l915_c7_aced] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output;

     -- n16_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     n16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     n16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output := n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_aced_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- n16_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     n16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     n16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output := n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output := tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l912_c7_2d97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_2d97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output := result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- n16_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     n16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     n16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l907_c7_5911] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output := tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_5911_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l904_c7_758e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output := result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l904_c7_758e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c2_03bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l951_l895_DUPLICATE_ad81 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l951_l895_DUPLICATE_ad81_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c2_03bb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c2_03bb_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l951_l895_DUPLICATE_ad81_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l951_l895_DUPLICATE_ad81_return_output;
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
