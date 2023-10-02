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
-- Submodules: 186
entity rot2_0CLK_113f14d9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_113f14d9;
architecture arch of rot2_0CLK_113f14d9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1817_c6_48d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1817_c1_bf93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1817_c2_d6ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1818_c3_2385[uxn_opcodes_h_l1818_c3_2385]
signal printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_3965]
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1825_c7_6710]
signal l16_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1825_c7_6710]
signal t16_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1825_c7_6710]
signal n16_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1825_c7_6710]
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_9a86]
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal l16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal t16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal n16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_21d4]
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_10a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1835_c7_d501]
signal l16_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1835_c7_d501]
signal t16_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1835_c7_d501]
signal n16_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1835_c7_d501]
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_2545]
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal l16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal t16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal n16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1839_c7_03bd]
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1840_c3_dae0]
signal BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1844_c11_716b]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1844_c7_e600]
signal l16_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c7_e600]
signal n16_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1844_c7_e600]
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_6734]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal l16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal n16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1848_c7_9c49]
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_06f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1854_c7_463f]
signal l16_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1854_c7_463f]
signal n16_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_463f]
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_b4ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal l16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal n16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1858_c7_bbed]
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1859_c3_79ad]
signal BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_9389]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1863_c7_a272]
signal l16_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1863_c7_a272]
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_274f]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_0a1a]
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_5689]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal l16_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1873_c7_3fda]
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_6b4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal l16_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1877_c7_ed70]
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1878_c3_8958]
signal BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1881_c32_1a95]
signal BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1881_c32_f9e3]
signal BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1881_c32_aac0]
signal MUX_uxn_opcodes_h_l1881_c32_aac0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1881_c32_aac0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1881_c32_aac0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1881_c32_aac0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_ca93]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1883_c7_c024]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_c024]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_c024]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_c024]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1883_c7_c024]
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_3fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_1dae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_1dae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_1dae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1889_c7_1dae]
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1892_c34_2c12]
signal CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_7247]
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_e599]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_e599]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_e599]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1894_c7_e599]
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_8184]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_5b90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_5b90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_5b90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1899_c7_5b90]
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1902_c34_84d4]
signal CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_f3ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_9a3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_9a3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_9a3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_9a3c]
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_356a]
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_1bdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_1bdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1909_c7_1bdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1909_c7_1bdb]
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1912_c34_93f6]
signal CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_f978]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_13c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_13c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output);

-- l16_MUX_uxn_opcodes_h_l1817_c2_d6ec
l16_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- t16_MUX_uxn_opcodes_h_l1817_c2_d6ec
t16_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- n16_MUX_uxn_opcodes_h_l1817_c2_d6ec
n16_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

-- printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385
printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385 : entity work.printf_uxn_opcodes_h_l1818_c3_2385_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_left,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_right,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output);

-- l16_MUX_uxn_opcodes_h_l1825_c7_6710
l16_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
l16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
l16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- t16_MUX_uxn_opcodes_h_l1825_c7_6710
t16_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
t16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
t16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- n16_MUX_uxn_opcodes_h_l1825_c7_6710
n16_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
n16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
n16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_cond,
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_left,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_right,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output);

-- l16_MUX_uxn_opcodes_h_l1829_c7_21d4
l16_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- t16_MUX_uxn_opcodes_h_l1829_c7_21d4
t16_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- n16_MUX_uxn_opcodes_h_l1829_c7_21d4
n16_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output);

-- l16_MUX_uxn_opcodes_h_l1835_c7_d501
l16_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
l16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
l16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- t16_MUX_uxn_opcodes_h_l1835_c7_d501
t16_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
t16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
t16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- n16_MUX_uxn_opcodes_h_l1835_c7_d501
n16_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
n16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
n16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_cond,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_left,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_right,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output);

-- l16_MUX_uxn_opcodes_h_l1839_c7_03bd
l16_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- t16_MUX_uxn_opcodes_h_l1839_c7_03bd
t16_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- n16_MUX_uxn_opcodes_h_l1839_c7_03bd
n16_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0
BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_left,
BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_right,
BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output);

-- l16_MUX_uxn_opcodes_h_l1844_c7_e600
l16_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
l16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
l16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c7_e600
n16_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
n16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_cond,
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output);

-- l16_MUX_uxn_opcodes_h_l1848_c7_9c49
l16_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- n16_MUX_uxn_opcodes_h_l1848_c7_9c49
n16_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_cond,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output);

-- l16_MUX_uxn_opcodes_h_l1854_c7_463f
l16_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
l16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
l16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- n16_MUX_uxn_opcodes_h_l1854_c7_463f
n16_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
n16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
n16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output);

-- l16_MUX_uxn_opcodes_h_l1858_c7_bbed
l16_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- n16_MUX_uxn_opcodes_h_l1858_c7_bbed
n16_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad
BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_left,
BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_right,
BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output);

-- l16_MUX_uxn_opcodes_h_l1863_c7_a272
l16_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
l16_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
l16_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_cond,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output);

-- l16_MUX_uxn_opcodes_h_l1867_c7_0a1a
l16_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output);

-- l16_MUX_uxn_opcodes_h_l1873_c7_3fda
l16_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_cond,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output);

-- l16_MUX_uxn_opcodes_h_l1877_c7_ed70
l16_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_cond,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958
BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_left,
BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_right,
BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95
BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_left,
BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_right,
BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3
BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_left,
BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_right,
BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output);

-- MUX_uxn_opcodes_h_l1881_c32_aac0
MUX_uxn_opcodes_h_l1881_c32_aac0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1881_c32_aac0_cond,
MUX_uxn_opcodes_h_l1881_c32_aac0_iftrue,
MUX_uxn_opcodes_h_l1881_c32_aac0_iffalse,
MUX_uxn_opcodes_h_l1881_c32_aac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_cond,
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12
CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_x,
CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_left,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_right,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_cond,
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_cond,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4
CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_x,
CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_left,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_right,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6
CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_x,
CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634
CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output,
 l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output,
 l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output,
 l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output,
 l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output,
 l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output,
 l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output,
 l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output,
 l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output,
 l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output,
 l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output,
 l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output,
 l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output,
 l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output,
 MUX_uxn_opcodes_h_l1881_c32_aac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output,
 CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output,
 CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output,
 CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iffalse : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_a22e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_cea2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_7464 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_e878 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1842_c3_9a78 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_87cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_f0b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_5f92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_766e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_9ad4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_8031 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_36ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1877_c7_ed70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_d8a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_6b37_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1891_c3_ef79 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1892_c24_5ef3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1896_c3_039b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1897_c24_6648_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_deaa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c24_efb8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_928c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c24_ed36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1911_c3_5a44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1912_c24_ae21_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_5fea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1919_l1813_DUPLICATE_7359_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1842_c3_9a78 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1842_c3_9a78;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1896_c3_039b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1896_c3_039b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_87cb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_87cb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_7464 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_7464;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_d8a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_d8a0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1911_c3_5a44 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1911_c3_5a44;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_928c := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_928c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_a22e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_a22e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_36ee := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_36ee;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_f0b3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_f0b3;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_8031 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_8031;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_5f92 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_5f92;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_right := to_unsigned(18, 5);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_right := to_unsigned(16, 5);
     VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_cea2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_cea2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_e878 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_e878;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_9ad4 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_9ad4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_766e := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_766e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_right := to_unsigned(17, 5);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_right := to_unsigned(13, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_deaa := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_deaa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_right := to_unsigned(19, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1891_c3_ef79 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1891_c3_ef79;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_f3ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_10a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1892_c34_2c12] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output := CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1881_c32_1a95] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_left;
     BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output := BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_3965] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_left;
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output := BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1817_c2_d6ec_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_356a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_5689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c6_48d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_f978] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_b4ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c11_716b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1907_c24_ed36] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c24_ed36_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1877_c7_ed70_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_06f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_7247] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_left;
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output := BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1887_c24_6b37] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_6b37_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_ca93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_9a86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_left;
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output := BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_274f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1897_c24_6648] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1897_c24_6648_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_6b4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1912_c34_93f6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output := CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_9389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_5fea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_5fea_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_8184] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_3fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_2545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_left;
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output := BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_6734] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1902_c34_84d4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output := CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_1a95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_48d5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_3965_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_9a86_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_10a9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_2545_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_716b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_6734_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_06f1_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_b4ae_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_9389_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_274f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_5689_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_6b4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_ca93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_3fb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_7247_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_8184_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_f3ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_356a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f978_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_0f3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_6b37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1897_c24_6648_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c24_ed36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_5618_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_e297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_54cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_721c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_5fea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_5fea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_067d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1817_c2_d6ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1877_c7_ed70_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1883_c7_c024] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1817_c1_bf93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1892_c24_5ef3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1892_c24_5ef3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_2c12_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1912_c24_ae21] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1912_c24_ae21_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_93f6_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1859_c3_79ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_left;
     BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output := BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1881_c32_f9e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_left;
     BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output := BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1902_c24_efb8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c24_efb8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_84d4_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1840_c3_dae0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_left;
     BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output := BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_13c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1909_c7_1bdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_13c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1878_c3_8958] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_left;
     BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output := BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_f9e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_dae0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_79ad_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_8958_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1892_c24_5ef3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c24_efb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1912_c24_ae21_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1831_l1869_l1850_DUPLICATE_1634_return_output;
     VAR_printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_bf93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_13c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- n16_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_1bdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1909_c7_1bdb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;

     -- MUX[uxn_opcodes_h_l1881_c32_aac0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1881_c32_aac0_cond <= VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_cond;
     MUX_uxn_opcodes_h_l1881_c32_aac0_iftrue <= VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_iftrue;
     MUX_uxn_opcodes_h_l1881_c32_aac0_iffalse <= VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_return_output := MUX_uxn_opcodes_h_l1881_c32_aac0_return_output;

     -- l16_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- printf_uxn_opcodes_h_l1818_c3_2385[uxn_opcodes_h_l1818_c3_2385] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1818_c3_2385_uxn_opcodes_h_l1818_c3_2385_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_9a3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_1bdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue := VAR_MUX_uxn_opcodes_h_l1881_c32_aac0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1bdb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_9a3c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     n16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     n16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_9a3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     t16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     t16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- l16_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_9a3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_5b90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_9a3c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_e599] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1899_c7_5b90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output := result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_5b90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;

     -- t16_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_5b90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;

     -- n16_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- l16_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5b90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- t16_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     t16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     t16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1894_c7_e599] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output := result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- l16_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     l16_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     l16_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     n16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_1dae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_e599] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_e599] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_e599_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_1dae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_c024] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1889_c7_1dae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;

     -- t16_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- l16_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_1dae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_1dae_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- n16_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     n16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     n16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- l16_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     l16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     l16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1883_c7_c024] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output := result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_c024] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_c024] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_c024_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- n16_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- l16_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_ed70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_ed70_return_output;
     -- l16_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     l16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     l16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- n16_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     n16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     n16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_3fda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_3fda_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- l16_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_0a1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- n16_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_0a1a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- l16_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     l16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     l16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c7_a272] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_a272_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- l16_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_bbed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_bbed_return_output;
     -- l16_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     l16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     l16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_463f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_463f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_9c49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- l16_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_9c49_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1844_c7_e600] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output := result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_e600_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1839_c7_03bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_03bd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1835_c7_d501] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output := result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_d501_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_21d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_21d4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_6710] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_6710_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1817_c2_d6ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1919_l1813_DUPLICATE_7359 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1919_l1813_DUPLICATE_7359_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_d6ec_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1919_l1813_DUPLICATE_7359_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1919_l1813_DUPLICATE_7359_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
