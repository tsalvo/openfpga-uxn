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
-- Submodules: 125
entity div2_0CLK_444c40b9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_444c40b9;
architecture arch of div2_0CLK_444c40b9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1954_c6_34de]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1954_c1_53b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c2_2408]
signal n16_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c2_2408]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1954_c2_2408]
signal tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1954_c2_2408]
signal t16_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1955_c3_372a[uxn_opcodes_h_l1955_c3_372a]
signal printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_16fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal n16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1960_c7_90d5]
signal t16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_2890]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal n16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1963_c7_71aa]
signal t16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_6362]
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal n16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1968_c7_44ec]
signal t16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_b43f]
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1971_c7_8b7b]
signal t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1972_c3_fd10]
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_69a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1975_c7_187c]
signal n16_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_187c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1975_c7_187c]
signal tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_f174]
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1978_c7_0267]
signal n16_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_0267]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1978_c7_0267]
signal tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_9ccb]
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1983_c7_f694]
signal n16_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_f694]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1983_c7_f694]
signal tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1986_c11_34a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1986_c7_6ed5]
signal tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1987_c3_f749]
signal BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1988_c11_6c02]
signal BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l1988_c26_d5fa]
signal BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l1988_c11_154d]
signal MUX_uxn_opcodes_h_l1988_c11_154d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1988_c11_154d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l1988_c11_154d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l1988_c11_154d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1991_c32_f0d1]
signal BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1991_c32_1205]
signal BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1991_c32_c719]
signal MUX_uxn_opcodes_h_l1991_c32_c719_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1991_c32_c719_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1991_c32_c719_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1991_c32_c719_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_5ced]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1993_c7_207f]
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_207f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_207f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_207f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_207f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1999_c11_b250]
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1999_c7_ad46]
signal result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1999_c7_ad46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1999_c7_ad46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1999_c7_ad46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2001_c34_8778]
signal CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2003_c11_b50a]
signal BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2003_c7_dbd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2003_c7_dbd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de
BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c2_2408
n16_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
n16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408
result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1954_c2_2408
tmp16_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- t16_MUX_uxn_opcodes_h_l1954_c2_2408
t16_MUX_uxn_opcodes_h_l1954_c2_2408 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1954_c2_2408_cond,
t16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue,
t16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse,
t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

-- printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a
printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a : entity work.printf_uxn_opcodes_h_l1955_c3_372a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output);

-- n16_MUX_uxn_opcodes_h_l1960_c7_90d5
n16_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5
result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5
tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- t16_MUX_uxn_opcodes_h_l1960_c7_90d5
t16_MUX_uxn_opcodes_h_l1960_c7_90d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond,
t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue,
t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse,
t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output);

-- n16_MUX_uxn_opcodes_h_l1963_c7_71aa
n16_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa
result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa
tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- t16_MUX_uxn_opcodes_h_l1963_c7_71aa
t16_MUX_uxn_opcodes_h_l1963_c7_71aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond,
t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue,
t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse,
t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_left,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_right,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output);

-- n16_MUX_uxn_opcodes_h_l1968_c7_44ec
n16_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec
result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec
result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec
tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- t16_MUX_uxn_opcodes_h_l1968_c7_44ec
t16_MUX_uxn_opcodes_h_l1968_c7_44ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond,
t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue,
t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse,
t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_left,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_right,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output);

-- n16_MUX_uxn_opcodes_h_l1971_c7_8b7b
n16_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b
tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- t16_MUX_uxn_opcodes_h_l1971_c7_8b7b
t16_MUX_uxn_opcodes_h_l1971_c7_8b7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond,
t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue,
t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse,
t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10
BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_left,
BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_right,
BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output);

-- n16_MUX_uxn_opcodes_h_l1975_c7_187c
n16_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
n16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
n16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1975_c7_187c
tmp16_MUX_uxn_opcodes_h_l1975_c7_187c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_cond,
tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_left,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_right,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output);

-- n16_MUX_uxn_opcodes_h_l1978_c7_0267
n16_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
n16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
n16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267
result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267
result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1978_c7_0267
tmp16_MUX_uxn_opcodes_h_l1978_c7_0267 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_cond,
tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue,
tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse,
tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_left,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_right,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output);

-- n16_MUX_uxn_opcodes_h_l1983_c7_f694
n16_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
n16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
n16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694
result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694
result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1983_c7_f694
tmp16_MUX_uxn_opcodes_h_l1983_c7_f694 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_cond,
tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue,
tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse,
tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1986_c7_6ed5
n16_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5
tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond,
tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_left,
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_right,
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_left,
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_right,
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa
BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_left,
BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_right,
BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output);

-- MUX_uxn_opcodes_h_l1988_c11_154d
MUX_uxn_opcodes_h_l1988_c11_154d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1988_c11_154d_cond,
MUX_uxn_opcodes_h_l1988_c11_154d_iftrue,
MUX_uxn_opcodes_h_l1988_c11_154d_iffalse,
MUX_uxn_opcodes_h_l1988_c11_154d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1
BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_left,
BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_right,
BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205
BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_left,
BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_right,
BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output);

-- MUX_uxn_opcodes_h_l1991_c32_c719
MUX_uxn_opcodes_h_l1991_c32_c719 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1991_c32_c719_cond,
MUX_uxn_opcodes_h_l1991_c32_c719_iftrue,
MUX_uxn_opcodes_h_l1991_c32_c719_iffalse,
MUX_uxn_opcodes_h_l1991_c32_c719_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f
result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_left,
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_right,
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46
result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_cond,
result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2001_c34_8778
CONST_SR_8_uxn_opcodes_h_l2001_c34_8778 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_x,
CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a
BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_left,
BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_right,
BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9
result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9
result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output,
 n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output,
 n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output,
 n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output,
 n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output,
 n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output,
 n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output,
 n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output,
 n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output,
 MUX_uxn_opcodes_h_l1988_c11_154d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output,
 MUX_uxn_opcodes_h_l1991_c32_c719_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output,
 CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_0062 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_a1fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_783e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_3d2a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_cbb5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_9ebd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_7689 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_9a27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1988_c11_154d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1988_c11_154d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1988_c11_154d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1988_c11_154d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1991_c32_c719_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1991_c32_c719_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1991_c32_c719_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1991_c32_c719_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_0a69 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1997_c24_264f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_4a71 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2001_c24_759f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1972_l1987_l1979_DUPLICATE_ff63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1999_l1986_DUPLICATE_4e4d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1950_l2008_DUPLICATE_8a48_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1991_c32_c719_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_a1fc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_a1fc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_cbb5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_cbb5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_7689 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_7689;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1991_c32_c719_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_3d2a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_3d2a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_0a69 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_0a69;
     VAR_MUX_uxn_opcodes_h_l1988_c11_154d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_9ebd := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_9ebd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_9a27 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_9a27;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_783e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_783e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_0062 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_0062;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_4a71 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_4a71;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_b43f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1972_l1987_l1979_DUPLICATE_ff63 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1972_l1987_l1979_DUPLICATE_ff63_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_69a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_16fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1997_c24_264f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1997_c24_264f_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l2001_c34_8778] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output := CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1988_c11_6c02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_9ccb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1986_c11_34a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1999_c11_b250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_left;
     BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output := BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_6362] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_left;
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output := BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_2890] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2003_c11_b50a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c6_34de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1999_l1986_DUPLICATE_4e4d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1999_l1986_DUPLICATE_4e4d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c11_5ced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_f174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_left;
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output := BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1991_c32_f0d1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_left;
     BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output := BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1991_c32_f0d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c6_34de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_16fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_2890_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_6362_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_b43f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_69a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_f174_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_9ccb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_34a6_return_output;
     VAR_MUX_uxn_opcodes_h_l1988_c11_154d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_6c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c11_5ced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_b250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2003_c11_b50a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1972_l1987_l1979_DUPLICATE_ff63_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1972_l1987_l1979_DUPLICATE_ff63_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1972_l1987_l1979_DUPLICATE_ff63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1997_c24_264f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1968_DUPLICATE_adde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l2003_l1971_l1999_l1968_l1993_DUPLICATE_9fda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1954_l1978_l1975_l1971_l1968_l1993_DUPLICATE_7699_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1968_DUPLICATE_5cb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l2003_l1971_l1999_l1968_DUPLICATE_fa38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1999_l1986_DUPLICATE_4e4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1999_l1986_DUPLICATE_4e4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1954_l1978_l1975_l1971_l1999_l1968_DUPLICATE_0338_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2003_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1954_c1_53b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2001_c24_759f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2001_c24_759f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2001_c34_8778_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2003_c7_dbd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1999_c7_ad46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1987_c3_f749] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_left;
     BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output := BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1972_c3_fd10] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_left;
     BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output := BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1991_c32_1205] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_left;
     BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output := BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c7_207f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1991_c32_c719_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1991_c32_1205_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_fd10_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f749_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2001_c24_759f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_a320_return_output;
     VAR_printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1954_c1_53b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2003_c7_dbd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1999_c7_ad46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;

     -- n16_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1999_c7_ad46] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output := result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;

     -- printf_uxn_opcodes_h_l1955_c3_372a[uxn_opcodes_h_l1955_c3_372a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1955_c3_372a_uxn_opcodes_h_l1955_c3_372a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1991_c32_c719] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1991_c32_c719_cond <= VAR_MUX_uxn_opcodes_h_l1991_c32_c719_cond;
     MUX_uxn_opcodes_h_l1991_c32_c719_iftrue <= VAR_MUX_uxn_opcodes_h_l1991_c32_c719_iftrue;
     MUX_uxn_opcodes_h_l1991_c32_c719_iffalse <= VAR_MUX_uxn_opcodes_h_l1991_c32_c719_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1991_c32_c719_return_output := MUX_uxn_opcodes_h_l1991_c32_c719_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1999_c7_ad46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c7_207f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l1988_c26_d5fa] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_left;
     BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output := BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1988_c11_154d_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l1988_c26_d5fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_MUX_uxn_opcodes_h_l1991_c32_c719_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1999_c7_ad46_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1993_c7_207f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c7_207f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c7_207f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     n16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     n16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- MUX[uxn_opcodes_h_l1988_c11_154d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1988_c11_154d_cond <= VAR_MUX_uxn_opcodes_h_l1988_c11_154d_cond;
     MUX_uxn_opcodes_h_l1988_c11_154d_iftrue <= VAR_MUX_uxn_opcodes_h_l1988_c11_154d_iftrue;
     MUX_uxn_opcodes_h_l1988_c11_154d_iffalse <= VAR_MUX_uxn_opcodes_h_l1988_c11_154d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1988_c11_154d_return_output := MUX_uxn_opcodes_h_l1988_c11_154d_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue := VAR_MUX_uxn_opcodes_h_l1988_c11_154d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c7_207f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     n16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     n16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1986_c7_6ed5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1986_c7_6ed5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- t16_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     n16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     n16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1983_c7_f694] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output := result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1983_c7_f694_return_output;
     -- t16_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     t16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     t16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- n16_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_0267] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1978_c7_0267_return_output;
     -- n16_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_187c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1975_c7_187c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_8b7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1971_c7_8b7b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1968_c7_44ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1968_c7_44ec_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     n16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1963_c7_71aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_cond;
     tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output := tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1963_c7_71aa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1960_c7_90d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1960_c7_90d5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c2_2408] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1954_c2_2408_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1950_l2008_DUPLICATE_8a48 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1950_l2008_DUPLICATE_8a48_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c2_2408_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c2_2408_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1950_l2008_DUPLICATE_8a48_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1950_l2008_DUPLICATE_8a48_return_output;
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
