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
-- Submodules: 107
entity lth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_3a9c1537;
architecture arch of lth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2191_c6_ec76]
signal BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2191_c1_62a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal t16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2191_c2_47a2]
signal n16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2192_c3_e95c[uxn_opcodes_h_l2192_c3_e95c]
signal printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2197_c11_8ec4]
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal t16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2197_c7_44ae]
signal n16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_031c]
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal t16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2200_c7_46cc]
signal n16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_1dbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2205_c7_009c]
signal t16_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_009c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2205_c7_009c]
signal n16_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2208_c11_69c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal t16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2208_c7_95b2]
signal n16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2209_c3_aba3]
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2212_c11_bc4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2212_c7_a8e2]
signal n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2215_c11_d60c]
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2215_c7_b2d1]
signal n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_fb3e]
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2220_c7_d3d9]
signal n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2223_c11_5cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2223_c7_f2e5]
signal n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2224_c3_6294]
signal BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2227_c32_74ba]
signal BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2227_c32_f6b8]
signal BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2227_c32_3693]
signal MUX_uxn_opcodes_h_l2227_c32_3693_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2227_c32_3693_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2227_c32_3693_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2227_c32_3693_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_42c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_7a7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2229_c7_7a7b]
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_7a7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_7a7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_7a7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2233_c24_eaee]
signal BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2233_c24_4963]
signal MUX_uxn_opcodes_h_l2233_c24_4963_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2233_c24_4963_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2233_c24_4963_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2233_c24_4963_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2235_c11_1d10]
signal BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2235_c7_2031]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2235_c7_2031]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76
BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_left,
BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_right,
BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output);

-- t16_MUX_uxn_opcodes_h_l2191_c2_47a2
t16_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2
result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- n16_MUX_uxn_opcodes_h_l2191_c2_47a2
n16_MUX_uxn_opcodes_h_l2191_c2_47a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond,
n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue,
n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse,
n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

-- printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c
printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c : entity work.printf_uxn_opcodes_h_l2192_c3_e95c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_left,
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_right,
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output);

-- t16_MUX_uxn_opcodes_h_l2197_c7_44ae
t16_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae
result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2197_c7_44ae
n16_MUX_uxn_opcodes_h_l2197_c7_44ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond,
n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue,
n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse,
n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_left,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_right,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output);

-- t16_MUX_uxn_opcodes_h_l2200_c7_46cc
t16_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc
result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- n16_MUX_uxn_opcodes_h_l2200_c7_46cc
n16_MUX_uxn_opcodes_h_l2200_c7_46cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond,
n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue,
n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse,
n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output);

-- t16_MUX_uxn_opcodes_h_l2205_c7_009c
t16_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
t16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
t16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- n16_MUX_uxn_opcodes_h_l2205_c7_009c
n16_MUX_uxn_opcodes_h_l2205_c7_009c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2205_c7_009c_cond,
n16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue,
n16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse,
n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output);

-- t16_MUX_uxn_opcodes_h_l2208_c7_95b2
t16_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2
result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- n16_MUX_uxn_opcodes_h_l2208_c7_95b2
n16_MUX_uxn_opcodes_h_l2208_c7_95b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond,
n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue,
n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse,
n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3
BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_left,
BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_right,
BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- n16_MUX_uxn_opcodes_h_l2212_c7_a8e2
n16_MUX_uxn_opcodes_h_l2212_c7_a8e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond,
n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue,
n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse,
n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_left,
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_right,
BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- n16_MUX_uxn_opcodes_h_l2215_c7_b2d1
n16_MUX_uxn_opcodes_h_l2215_c7_b2d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond,
n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue,
n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse,
n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_left,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_right,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- n16_MUX_uxn_opcodes_h_l2220_c7_d3d9
n16_MUX_uxn_opcodes_h_l2220_c7_d3d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond,
n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue,
n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse,
n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- n16_MUX_uxn_opcodes_h_l2223_c7_f2e5
n16_MUX_uxn_opcodes_h_l2223_c7_f2e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond,
n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue,
n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse,
n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294
BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_left,
BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_right,
BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba
BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_left,
BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_right,
BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8
BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_left,
BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_right,
BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output);

-- MUX_uxn_opcodes_h_l2227_c32_3693
MUX_uxn_opcodes_h_l2227_c32_3693 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2227_c32_3693_cond,
MUX_uxn_opcodes_h_l2227_c32_3693_iftrue,
MUX_uxn_opcodes_h_l2227_c32_3693_iffalse,
MUX_uxn_opcodes_h_l2227_c32_3693_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee
BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_left,
BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_right,
BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output);

-- MUX_uxn_opcodes_h_l2233_c24_4963
MUX_uxn_opcodes_h_l2233_c24_4963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2233_c24_4963_cond,
MUX_uxn_opcodes_h_l2233_c24_4963_iftrue,
MUX_uxn_opcodes_h_l2233_c24_4963_iffalse,
MUX_uxn_opcodes_h_l2233_c24_4963_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_left,
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_right,
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031
result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output,
 t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output,
 t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output,
 t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output,
 t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output,
 t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output,
 MUX_uxn_opcodes_h_l2227_c32_3693_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output,
 MUX_uxn_opcodes_h_l2233_c24_4963_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_efaf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_d7cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_c245 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_2ebc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2210_c3_92f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_73b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2218_c3_3933 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_635c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2227_c32_3693_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2227_c32_3693_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2227_c32_3693_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2227_c32_3693_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_6abd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2233_c24_4963_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2233_c24_4963_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2233_c24_4963_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2233_c24_4963_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2216_l2209_l2224_DUPLICATE_3426_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2229_DUPLICATE_d35b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2240_l2187_DUPLICATE_21ba_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_73b7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2213_c3_73b7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2227_c32_3693_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2233_c24_4963_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_d7cc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_d7cc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_2ebc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_2ebc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_635c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_635c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_c245 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_c245;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l2227_c32_3693_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2210_c3_92f4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2210_c3_92f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_efaf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_efaf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_6abd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_6abd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2233_c24_4963_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2218_c3_3933 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2218_c3_3933;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2223_c11_5cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2191_c6_ec76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_031c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2235_c11_1d10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2227_c32_74ba] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_left;
     BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output := BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2216_l2209_l2224_DUPLICATE_3426 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2216_l2209_l2224_DUPLICATE_3426_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_1dbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2229_DUPLICATE_d35b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2229_DUPLICATE_d35b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2215_c11_d60c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_fb3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2197_c11_8ec4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2233_c24_eaee] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_left;
     BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output := BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2208_c11_69c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_42c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2212_c11_bc4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2227_c32_74ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c6_ec76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_8ec4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_031c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_1dbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_69c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2212_c11_bc4f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c11_d60c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_fb3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_5cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_42c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_1d10_return_output;
     VAR_MUX_uxn_opcodes_h_l2233_c24_4963_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2233_c24_eaee_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2216_l2209_l2224_DUPLICATE_3426_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2216_l2209_l2224_DUPLICATE_3426_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2201_l2216_l2209_l2224_DUPLICATE_3426_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_bf47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2235_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_2416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2197_l2220_DUPLICATE_c0f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2215_l2212_l2208_l2205_l2200_l2223_l2197_l2220_DUPLICATE_1d6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2235_l2205_l2200_l2223_l2197_l2220_DUPLICATE_695b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2229_DUPLICATE_d35b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2229_DUPLICATE_d35b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2191_l2215_l2212_l2208_l2205_l2229_l2200_l2223_l2197_l2220_DUPLICATE_0c96_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2224_c3_6294] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_left;
     BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output := BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2191_c1_62a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2209_c3_aba3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_left;
     BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output := BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_7a7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_7a7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2227_c32_f6b8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_left;
     BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output := BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output;

     -- MUX[uxn_opcodes_h_l2233_c24_4963] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2233_c24_4963_cond <= VAR_MUX_uxn_opcodes_h_l2233_c24_4963_cond;
     MUX_uxn_opcodes_h_l2233_c24_4963_iftrue <= VAR_MUX_uxn_opcodes_h_l2233_c24_4963_iftrue;
     MUX_uxn_opcodes_h_l2233_c24_4963_iffalse <= VAR_MUX_uxn_opcodes_h_l2233_c24_4963_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2233_c24_4963_return_output := MUX_uxn_opcodes_h_l2233_c24_4963_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2235_c7_2031] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2235_c7_2031] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2227_c32_3693_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2227_c32_f6b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_aba3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2224_c3_6294_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2217_DUPLICATE_cce4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue := VAR_MUX_uxn_opcodes_h_l2233_c24_4963_return_output;
     VAR_printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2191_c1_62a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_2031_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2235_c7_2031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;
     -- MUX[uxn_opcodes_h_l2227_c32_3693] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2227_c32_3693_cond <= VAR_MUX_uxn_opcodes_h_l2227_c32_3693_cond;
     MUX_uxn_opcodes_h_l2227_c32_3693_iftrue <= VAR_MUX_uxn_opcodes_h_l2227_c32_3693_iftrue;
     MUX_uxn_opcodes_h_l2227_c32_3693_iffalse <= VAR_MUX_uxn_opcodes_h_l2227_c32_3693_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2227_c32_3693_return_output := MUX_uxn_opcodes_h_l2227_c32_3693_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_7a7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_7a7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2229_c7_7a7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- printf_uxn_opcodes_h_l2192_c3_e95c[uxn_opcodes_h_l2192_c3_e95c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2192_c3_e95c_uxn_opcodes_h_l2192_c3_e95c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue := VAR_MUX_uxn_opcodes_h_l2227_c32_3693_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2229_c7_7a7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     t16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     t16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c7_f2e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2223_c7_f2e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2220_c7_d3d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_d3d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     -- n16_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2215_c7_b2d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2215_c7_b2d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     -- t16_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2212_c7_a8e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2212_c7_a8e2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     n16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     n16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2208_c7_95b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_95b2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_009c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_009c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2200_c7_46cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_46cc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2197_c7_44ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_44ae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2191_c2_47a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2240_l2187_DUPLICATE_21ba LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2240_l2187_DUPLICATE_21ba_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c2_47a2_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2240_l2187_DUPLICATE_21ba_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2240_l2187_DUPLICATE_21ba_return_output;
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
