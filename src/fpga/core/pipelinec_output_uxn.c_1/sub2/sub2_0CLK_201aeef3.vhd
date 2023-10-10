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
-- Submodules: 123
entity sub2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_201aeef3;
architecture arch of sub2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2833_c6_d482]
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c1_8fd1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal n16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal t16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2833_c2_56c4]
signal tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2834_c3_fc55[uxn_opcodes_h_l2834_c3_fc55]
signal printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_8a29]
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal n16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal t16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2839_c7_ed80]
signal tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_6247]
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2842_c7_206c]
signal n16_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2842_c7_206c]
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2842_c7_206c]
signal t16_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2842_c7_206c]
signal tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_49c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2847_c7_5e4b]
signal tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_a3bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal n16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal t16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2850_c7_dde4]
signal tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2851_c3_909e]
signal BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_a3e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2854_c7_f3f8]
signal tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_2ae9]
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2857_c7_1937]
signal n16_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2857_c7_1937]
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2857_c7_1937]
signal tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_1281]
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2862_c7_5339]
signal n16_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2862_c7_5339]
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2862_c7_5339]
signal tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2865_c11_2a96]
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2865_c7_0313]
signal n16_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2865_c7_0313]
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2865_c7_0313]
signal tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2866_c3_f5b7]
signal BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2867_c11_9ef3]
signal BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2870_c32_c96f]
signal BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2870_c32_f66f]
signal BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2870_c32_77e2]
signal MUX_uxn_opcodes_h_l2870_c32_77e2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2870_c32_77e2_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2870_c32_77e2_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2870_c32_77e2_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_24e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2872_c7_4ad0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2872_c7_4ad0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2872_c7_4ad0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2872_c7_4ad0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2872_c7_4ad0]
signal result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_2142]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2878_c7_29a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2878_c7_29a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2878_c7_29a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2878_c7_29a1]
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2880_c34_559d]
signal CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_13a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_aee6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_aee6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482
BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_left,
BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_right,
BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output);

-- n16_MUX_uxn_opcodes_h_l2833_c2_56c4
n16_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4
result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- t16_MUX_uxn_opcodes_h_l2833_c2_56c4
t16_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4
tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond,
tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

-- printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55
printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55 : entity work.printf_uxn_opcodes_h_l2834_c3_fc55_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_left,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_right,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output);

-- n16_MUX_uxn_opcodes_h_l2839_c7_ed80
n16_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80
result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- t16_MUX_uxn_opcodes_h_l2839_c7_ed80
t16_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80
tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond,
tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue,
tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse,
tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_left,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_right,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output);

-- n16_MUX_uxn_opcodes_h_l2842_c7_206c
n16_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
n16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
n16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c
result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- t16_MUX_uxn_opcodes_h_l2842_c7_206c
t16_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
t16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
t16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2842_c7_206c
tmp16_MUX_uxn_opcodes_h_l2842_c7_206c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_cond,
tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output);

-- n16_MUX_uxn_opcodes_h_l2847_c7_5e4b
n16_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- t16_MUX_uxn_opcodes_h_l2847_c7_5e4b
t16_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b
tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond,
tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output);

-- n16_MUX_uxn_opcodes_h_l2850_c7_dde4
n16_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4
result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4
result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- t16_MUX_uxn_opcodes_h_l2850_c7_dde4
t16_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4
tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond,
tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e
BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_left,
BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_right,
BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output);

-- n16_MUX_uxn_opcodes_h_l2854_c7_f3f8
n16_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8
result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8
tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond,
tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_left,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_right,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output);

-- n16_MUX_uxn_opcodes_h_l2857_c7_1937
n16_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
n16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
n16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937
result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2857_c7_1937
tmp16_MUX_uxn_opcodes_h_l2857_c7_1937 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_cond,
tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue,
tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse,
tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_left,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_right,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output);

-- n16_MUX_uxn_opcodes_h_l2862_c7_5339
n16_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
n16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
n16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339
result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339
result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2862_c7_5339
tmp16_MUX_uxn_opcodes_h_l2862_c7_5339 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_cond,
tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue,
tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse,
tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_left,
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_right,
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output);

-- n16_MUX_uxn_opcodes_h_l2865_c7_0313
n16_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
n16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
n16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313
result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2865_c7_0313
tmp16_MUX_uxn_opcodes_h_l2865_c7_0313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_cond,
tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue,
tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse,
tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7
BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_left,
BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_right,
BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3
BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_left,
BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_right,
BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f
BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_left,
BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_right,
BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f
BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_left,
BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_right,
BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output);

-- MUX_uxn_opcodes_h_l2870_c32_77e2
MUX_uxn_opcodes_h_l2870_c32_77e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2870_c32_77e2_cond,
MUX_uxn_opcodes_h_l2870_c32_77e2_iftrue,
MUX_uxn_opcodes_h_l2870_c32_77e2_iffalse,
MUX_uxn_opcodes_h_l2870_c32_77e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0
result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0
result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0
result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0
result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2880_c34_559d
CONST_SR_8_uxn_opcodes_h_l2880_c34_559d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_x,
CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4
CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output,
 n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output,
 n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output,
 n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output,
 n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output,
 n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output,
 n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output,
 n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output,
 n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output,
 n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output,
 MUX_uxn_opcodes_h_l2870_c32_77e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2836_c3_1d54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2840_c3_96ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_30e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2848_c3_1f4b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2852_c3_51d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2855_c3_3cc0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2860_c3_f443 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_551a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2875_c3_d48c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2876_c24_2215_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_b9cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2880_c24_f52f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2843_l2858_l2866_l2851_DUPLICATE_5ab5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2878_l2865_DUPLICATE_899f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2887_l2829_DUPLICATE_44d1_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_551a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_551a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2840_c3_96ca := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2840_c3_96ca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2855_c3_3cc0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2855_c3_3cc0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_b9cf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_b9cf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2875_c3_d48c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2875_c3_d48c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2860_c3_f443 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2860_c3_f443;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2836_c3_1d54 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2836_c3_1d54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2852_c3_51d6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2852_c3_51d6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2848_c3_1f4b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2848_c3_1f4b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_30e7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_30e7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_iffalse := resize(to_signed(-2, 3), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_13a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_49c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_a3bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2876_c24_2215] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2876_c24_2215_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_1281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_left;
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output := BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_24e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_6247] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_left;
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output := BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2870_c32_c96f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_left;
     BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output := BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_2ae9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_2142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_a3e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2865_c11_2a96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_left;
     BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output := BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2843_l2858_l2866_l2851_DUPLICATE_5ab5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2843_l2858_l2866_l2851_DUPLICATE_5ab5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2880_c34_559d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output := CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_8a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2833_c6_d482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_left;
     BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output := BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2878_l2865_DUPLICATE_899f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2878_l2865_DUPLICATE_899f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2870_c32_c96f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c6_d482_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_8a29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_6247_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_49c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_a3bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_a3e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_2ae9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_1281_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_2a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_24e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_2142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_13a0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2843_l2858_l2866_l2851_DUPLICATE_5ab5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2843_l2858_l2866_l2851_DUPLICATE_5ab5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2843_l2858_l2866_l2851_DUPLICATE_5ab5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2876_c24_2215_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_6199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2872_l2842_l2865_l2839_l2862_l2857_l2854_l2882_DUPLICATE_79ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2850_l2847_l2872_l2842_l2839_l2862_l2833_l2857_l2854_DUPLICATE_5f3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2850_l2847_l2842_l2865_l2839_l2862_l2857_l2854_DUPLICATE_b09d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_l2882_DUPLICATE_1bdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2878_l2865_DUPLICATE_899f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2878_l2865_DUPLICATE_899f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2850_l2878_l2847_l2842_l2865_l2839_l2862_l2833_l2857_l2854_DUPLICATE_bd39_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_aee6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2872_c7_4ad0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2880_c24_f52f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2880_c24_f52f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2880_c34_559d_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2866_c3_f5b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_left;
     BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output := BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_aee6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2870_c32_f66f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_left;
     BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output := BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c1_8fd1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2878_c7_29a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2851_c3_909e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_left;
     BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output := BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2870_c32_f66f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2851_c3_909e_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c3_f5b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2880_c24_f52f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2859_l2844_DUPLICATE_5ae4_return_output;
     VAR_printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_aee6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;
     -- MUX[uxn_opcodes_h_l2870_c32_77e2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2870_c32_77e2_cond <= VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_cond;
     MUX_uxn_opcodes_h_l2870_c32_77e2_iftrue <= VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_iftrue;
     MUX_uxn_opcodes_h_l2870_c32_77e2_iffalse <= VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_return_output := MUX_uxn_opcodes_h_l2870_c32_77e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- t16_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2878_c7_29a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2872_c7_4ad0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2867_c11_9ef3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2878_c7_29a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2878_c7_29a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;

     -- printf_uxn_opcodes_h_l2834_c3_fc55[uxn_opcodes_h_l2834_c3_fc55] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2834_c3_fc55_uxn_opcodes_h_l2834_c3_fc55_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     n16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     n16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2867_c11_9ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue := VAR_MUX_uxn_opcodes_h_l2870_c32_77e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_29a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     -- n16_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     n16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     n16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2872_c7_4ad0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2872_c7_4ad0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2872_c7_4ad0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- t16_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2872_c7_4ad0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- n16_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     n16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     n16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- t16_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     t16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     t16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2865_c7_0313] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c7_0313_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     -- n16_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- t16_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2862_c7_5339] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_5339_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     -- n16_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2857_c7_1937] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2857_c7_1937_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2854_c7_f3f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2854_c7_f3f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- n16_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     n16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     n16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_dde4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2850_c7_dde4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2847_c7_5e4b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_5e4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2842_c7_206c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_206c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2839_c7_ed80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_ed80_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c2_56c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2887_l2829_DUPLICATE_44d1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2887_l2829_DUPLICATE_44d1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c2_56c4_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2887_l2829_DUPLICATE_44d1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2887_l2829_DUPLICATE_44d1_return_output;
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
