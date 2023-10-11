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
entity mul2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_df1f1450;
architecture arch of mul2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2177_c6_c075]
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2177_c1_1f22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal t16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal n16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2177_c2_56ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2178_c3_44f5[uxn_opcodes_h_l2178_c3_44f5]
signal printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2182_c11_5b55]
signal BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal t16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal n16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2182_c7_ee01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2185_c11_e768]
signal BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal t16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal n16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2185_c7_14d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2190_c11_19bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal t16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal n16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2190_c7_6d30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_c32e]
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal t16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal n16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_a85c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2194_c3_dc5d]
signal BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2197_c11_e9d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2197_c7_a9c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_841b]
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal n16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_dde4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_efd5]
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2205_c7_438c]
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2205_c7_438c]
signal n16_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_438c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_438c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_438c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_438c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_438c]
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_438c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2208_c11_621e]
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2208_c7_0fc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2209_c3_ea47]
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2210_c11_3c97]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2212_c32_4be3]
signal BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2212_c32_b147]
signal BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2212_c32_cd7d]
signal MUX_uxn_opcodes_h_l2212_c32_cd7d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2212_c32_cd7d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2212_c32_cd7d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2214_c11_a86b]
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2214_c7_cf9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c7_cf9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2214_c7_cf9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2214_c7_cf9d]
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c7_cf9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_00eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_e82c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2220_c7_e82c]
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_e82c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_e82c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2222_c34_f9bb]
signal CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2224_c11_b062]
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c7_d82d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c7_d82d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_left,
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_right,
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec
tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- t16_MUX_uxn_opcodes_h_l2177_c2_56ec
t16_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- n16_MUX_uxn_opcodes_h_l2177_c2_56ec
n16_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

-- printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5
printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5 : entity work.printf_uxn_opcodes_h_l2178_c3_44f5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_left,
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_right,
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01
tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- t16_MUX_uxn_opcodes_h_l2182_c7_ee01
t16_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- n16_MUX_uxn_opcodes_h_l2182_c7_ee01
n16_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_left,
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_right,
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0
tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- t16_MUX_uxn_opcodes_h_l2185_c7_14d0
t16_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- n16_MUX_uxn_opcodes_h_l2185_c7_14d0
n16_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30
tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- t16_MUX_uxn_opcodes_h_l2190_c7_6d30
t16_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- n16_MUX_uxn_opcodes_h_l2190_c7_6d30
n16_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_left,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_right,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c
tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- t16_MUX_uxn_opcodes_h_l2193_c7_a85c
t16_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- n16_MUX_uxn_opcodes_h_l2193_c7_a85c
n16_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d
BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_left,
BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_right,
BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1
tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- n16_MUX_uxn_opcodes_h_l2197_c7_a9c1
n16_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_left,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_right,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4
tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- n16_MUX_uxn_opcodes_h_l2200_c7_dde4
n16_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_left,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_right,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2205_c7_438c
tmp16_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- n16_MUX_uxn_opcodes_h_l2205_c7_438c
n16_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
n16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
n16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_left,
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_right,
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1
tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- n16_MUX_uxn_opcodes_h_l2208_c7_0fc1
n16_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47
BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_left,
BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_right,
BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3
BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_left,
BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_right,
BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147
BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_left,
BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_right,
BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output);

-- MUX_uxn_opcodes_h_l2212_c32_cd7d
MUX_uxn_opcodes_h_l2212_c32_cd7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2212_c32_cd7d_cond,
MUX_uxn_opcodes_h_l2212_c32_cd7d_iftrue,
MUX_uxn_opcodes_h_l2212_c32_cd7d_iffalse,
MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_left,
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_right,
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb
CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_x,
CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_left,
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_right,
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output,
 tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output,
 tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output,
 tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output,
 MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_ea13 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2183_c3_435f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2188_c3_98ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_4cb3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2195_c3_94de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_b934 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_c2f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_7723 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2210_c3_fd26 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_0d6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_87bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_8f85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2222_c24_4b0a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2186_l2194_l2209_DUPLICATE_6064_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2220_l2208_DUPLICATE_1d32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2229_l2173_DUPLICATE_574f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_7723 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_7723;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_4cb3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_4cb3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_b934 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_b934;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_0d6f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_0d6f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2188_c3_98ba := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2188_c3_98ba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_ea13 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_ea13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_c2f2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_c2f2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2195_c3_94de := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2195_c3_94de;
     VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2183_c3_435f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2183_c3_435f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_8f85 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_8f85;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l2212_c32_4be3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_left;
     BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output := BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2218_c24_87bc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_87bc_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_c32e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_00eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2182_c11_5b55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_left;
     BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output := BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2214_c11_a86b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2190_c11_19bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2208_c11_621e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2185_c11_e768] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_left;
     BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output := BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2224_c11_b062] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_left;
     BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output := BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_841b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2177_c6_c075] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_left;
     BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output := BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_efd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2186_l2194_l2209_DUPLICATE_6064 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2186_l2194_l2209_DUPLICATE_6064_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2222_c34_f9bb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output := CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2197_c11_e9d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2220_l2208_DUPLICATE_1d32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2220_l2208_DUPLICATE_1d32_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_4be3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_c075_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_5b55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_e768_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_19bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_c32e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_e9d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_841b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_efd5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_621e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_a86b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_00eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_b062_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2186_l2194_l2209_DUPLICATE_6064_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2186_l2194_l2209_DUPLICATE_6064_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2186_l2194_l2209_DUPLICATE_6064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_87bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_12fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2214_l2185_l2208_l2182_l2205_l2200_DUPLICATE_616c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2197_l2193_l2190_l2214_l2185_l2182_l2205_l2177_l2200_DUPLICATE_1769_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2197_l2224_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_e961_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2220_l2208_DUPLICATE_1d32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2220_l2208_DUPLICATE_1d32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2197_l2193_l2220_l2190_l2185_l2208_l2182_l2205_l2177_l2200_DUPLICATE_ea02_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c7_cf9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2194_c3_dc5d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_left;
     BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output := BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_e82c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2212_c32_b147] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_left;
     BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output := BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2177_c1_1f22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2209_c3_ea47] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_left;
     BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output := BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2222_c24_4b0a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2222_c24_4b0a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_f9bb_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c7_d82d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c7_d82d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_b147_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_dc5d_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_ea47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2222_c24_4b0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_e977_return_output;
     VAR_printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2177_c1_1f22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_d82d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2210_c11_3c97] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output;

     -- printf_uxn_opcodes_h_l2178_c3_44f5[uxn_opcodes_h_l2178_c3_44f5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2178_c3_44f5_uxn_opcodes_h_l2178_c3_44f5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2214_c7_cf9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2220_c7_e82c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_e82c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_e82c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- MUX[uxn_opcodes_h_l2212_c32_cd7d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2212_c32_cd7d_cond <= VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_cond;
     MUX_uxn_opcodes_h_l2212_c32_cd7d_iftrue <= VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_iftrue;
     MUX_uxn_opcodes_h_l2212_c32_cd7d_iffalse <= VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output := MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2210_c3_fd26 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_3c97_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_MUX_uxn_opcodes_h_l2212_c32_cd7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_e82c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue := VAR_tmp16_uxn_opcodes_h_l2210_c3_fd26;
     -- result_stack_value_MUX[uxn_opcodes_h_l2214_c7_cf9d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- n16_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     n16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     n16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2214_c7_cf9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c7_cf9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_cf9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2208_c7_0fc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_0fc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_438c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_438c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2200_c7_dde4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_dde4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2197_c7_a9c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a9c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_a85c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_a85c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2190_c7_6d30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_6d30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- n16_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2185_c7_14d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_14d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2182_c7_ee01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_ee01_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2177_c2_56ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2229_l2173_DUPLICATE_574f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2229_l2173_DUPLICATE_574f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_56ec_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2229_l2173_DUPLICATE_574f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2229_l2173_DUPLICATE_574f_return_output;
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
