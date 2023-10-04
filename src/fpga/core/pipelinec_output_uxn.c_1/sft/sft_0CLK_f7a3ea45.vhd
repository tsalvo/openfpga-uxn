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
entity sft_0CLK_f7a3ea45 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_f7a3ea45;
architecture arch of sft_0CLK_f7a3ea45 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1949_c6_135d]
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1949_c1_0c8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1949_c2_1bb0]
signal n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1950_c3_ba41[uxn_opcodes_h_l1950_c3_ba41]
signal printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1955_c11_7eae]
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1955_c7_66db]
signal t8_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1955_c7_66db]
signal tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1955_c7_66db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1955_c7_66db]
signal n8_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_a0b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1958_c7_0141]
signal t8_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1958_c7_0141]
signal tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c7_0141]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1958_c7_0141]
signal n8_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_119a]
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1962_c7_2cdf]
signal n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_3c42]
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1965_c7_274d]
signal tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1965_c7_274d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1965_c7_274d]
signal n8_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1969_c32_8b9d]
signal BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1969_c32_38d7]
signal BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1969_c32_7fa7]
signal MUX_uxn_opcodes_h_l1969_c32_7fa7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1969_c32_7fa7_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1969_c32_7fa7_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_30af]
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1971_c7_339d]
signal tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_339d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1971_c7_339d]
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_339d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_339d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_339d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1972_c18_c6da]
signal BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1972_c11_32f4]
signal BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1972_c34_02e1]
signal CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1972_c11_2013]
signal BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_6942]
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_3141]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1978_c7_3141]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d
BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_left,
BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_right,
BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output);

-- t8_MUX_uxn_opcodes_h_l1949_c2_1bb0
t8_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0
tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0
result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- n8_MUX_uxn_opcodes_h_l1949_c2_1bb0
n8_MUX_uxn_opcodes_h_l1949_c2_1bb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond,
n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue,
n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse,
n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

-- printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41
printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41 : entity work.printf_uxn_opcodes_h_l1950_c3_ba41_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_left,
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_right,
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output);

-- t8_MUX_uxn_opcodes_h_l1955_c7_66db
t8_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
t8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
t8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1955_c7_66db
tmp8_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db
result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db
result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- n8_MUX_uxn_opcodes_h_l1955_c7_66db
n8_MUX_uxn_opcodes_h_l1955_c7_66db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1955_c7_66db_cond,
n8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue,
n8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse,
n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output);

-- t8_MUX_uxn_opcodes_h_l1958_c7_0141
t8_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
t8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
t8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1958_c7_0141
tmp8_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141
result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- n8_MUX_uxn_opcodes_h_l1958_c7_0141
n8_MUX_uxn_opcodes_h_l1958_c7_0141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1958_c7_0141_cond,
n8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue,
n8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse,
n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_left,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_right,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf
tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf
result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- n8_MUX_uxn_opcodes_h_l1962_c7_2cdf
n8_MUX_uxn_opcodes_h_l1962_c7_2cdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond,
n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue,
n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse,
n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_left,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_right,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1965_c7_274d
tmp8_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d
result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d
result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- n8_MUX_uxn_opcodes_h_l1965_c7_274d
n8_MUX_uxn_opcodes_h_l1965_c7_274d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1965_c7_274d_cond,
n8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue,
n8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse,
n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d
BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_left,
BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_right,
BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7
BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_left,
BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_right,
BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output);

-- MUX_uxn_opcodes_h_l1969_c32_7fa7
MUX_uxn_opcodes_h_l1969_c32_7fa7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1969_c32_7fa7_cond,
MUX_uxn_opcodes_h_l1969_c32_7fa7_iftrue,
MUX_uxn_opcodes_h_l1969_c32_7fa7_iffalse,
MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_left,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_right,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1971_c7_339d
tmp8_MUX_uxn_opcodes_h_l1971_c7_339d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_cond,
tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da
BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_left,
BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_right,
BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4
BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_left,
BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_right,
BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1
CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_x,
CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013
BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_left,
BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_right,
BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_left,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_right,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output,
 t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output,
 t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output,
 t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output,
 tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output,
 MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output,
 tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output,
 CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_3d62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_4a31 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_eb32 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_0f69 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_7417 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1965_l1971_DUPLICATE_d85c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1945_l1983_DUPLICATE_e05c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_eb32 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_eb32;
     VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_4a31 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_4a31;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_7417 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_7417;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_0f69 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_0f69;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_3d62 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_3d62;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_6942] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_left;
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output := BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1969_c32_8b9d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_left;
     BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output := BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_a0b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_3c42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_left;
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output := BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1949_c6_135d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1965_l1971_DUPLICATE_d85c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1965_l1971_DUPLICATE_d85c_return_output := result.stack_address_sp_offset;

     -- CONST_SR_4[uxn_opcodes_h_l1972_c34_02e1] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output := CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_119a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_30af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1972_c18_c6da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_left;
     BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output := BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1955_c11_7eae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_8b9d_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1972_c18_c6da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1949_c6_135d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_7eae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_a0b8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_119a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_3c42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_30af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_6942_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_DUPLICATE_5e0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1978_l1971_DUPLICATE_5cee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1962_l1958_l1955_l1949_l1971_DUPLICATE_edcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1965_l1958_l1962_l1955_DUPLICATE_f891_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1978_DUPLICATE_1dbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1965_l1971_DUPLICATE_d85c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1965_l1971_DUPLICATE_d85c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1965_l1962_l1958_l1955_l1949_l1971_DUPLICATE_f44d_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_right := VAR_CONST_SR_4_uxn_opcodes_h_l1972_c34_02e1_return_output;
     -- n8_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     n8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     n8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1949_c1_0c8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1972_c11_32f4] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_left;
     BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output := BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     t8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     t8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_339d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1969_c32_38d7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_left;
     BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output := BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1978_c7_3141] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_3141] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_339d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_38d7_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1972_c11_32f4_return_output;
     VAR_printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1949_c1_0c8f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_3141_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_3141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_339d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;

     -- MUX[uxn_opcodes_h_l1969_c32_7fa7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1969_c32_7fa7_cond <= VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_cond;
     MUX_uxn_opcodes_h_l1969_c32_7fa7_iftrue <= VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_iftrue;
     MUX_uxn_opcodes_h_l1969_c32_7fa7_iffalse <= VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output := MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_339d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;

     -- printf_uxn_opcodes_h_l1950_c3_ba41[uxn_opcodes_h_l1950_c3_ba41] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1950_c3_ba41_uxn_opcodes_h_l1950_c3_ba41_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_SL[uxn_opcodes_h_l1972_c11_2013] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_left;
     BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output := BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output;

     -- t8_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     t8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     t8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1972_c11_2013_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue := VAR_MUX_uxn_opcodes_h_l1969_c32_7fa7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1971_c7_339d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_cond;
     tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output := tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     n8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     n8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1971_c7_339d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1971_c7_339d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     n8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     n8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1965_c7_274d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_cond;
     tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output := tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1965_c7_274d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1962_c7_2cdf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1962_c7_2cdf_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1958_c7_0141] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_cond;
     tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output := tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1958_c7_0141_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1955_c7_66db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output := result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1955_c7_66db_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1949_c2_1bb0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1945_l1983_DUPLICATE_e05c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1945_l1983_DUPLICATE_e05c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1949_c2_1bb0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1945_l1983_DUPLICATE_e05c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1945_l1983_DUPLICATE_e05c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
