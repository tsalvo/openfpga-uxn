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
-- Submodules: 98
entity lth2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_5ccafc54;
architecture arch of lth2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2085_c6_24e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2085_c1_0148]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal t16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal n16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2085_c2_0e53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2086_c3_17fc[uxn_opcodes_h_l2086_c3_17fc]
signal printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2090_c11_8d28]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c7_554c]
signal t16_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c7_554c]
signal n16_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c7_554c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2090_c7_554c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c7_554c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c7_554c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2090_c7_554c]
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c7_554c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2093_c11_670f]
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal t16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal n16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2093_c7_ade0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2098_c11_607d]
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal t16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal n16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2098_c7_c4be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_810b]
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_b1b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2102_c3_4406]
signal BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2105_c11_d1e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2105_c7_5797]
signal n16_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2105_c7_5797]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2105_c7_5797]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2105_c7_5797]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2105_c7_5797]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2105_c7_5797]
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2105_c7_5797]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2108_c11_73a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2108_c7_2175]
signal n16_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2108_c7_2175]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2108_c7_2175]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2108_c7_2175]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2108_c7_2175]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2108_c7_2175]
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2108_c7_2175]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_73b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2113_c7_0697]
signal n16_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_0697]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2113_c7_0697]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_0697]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_0697]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2113_c7_0697]
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_0697]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_1ae1]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_1fe0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2117_c3_b3ad]
signal BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2119_c32_4edb]
signal BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2119_c32_6035]
signal BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2119_c32_c880]
signal MUX_uxn_opcodes_h_l2119_c32_c880_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2119_c32_c880_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2119_c32_c880_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2119_c32_c880_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_1bb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2121_c7_4e87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2121_c7_4e87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2121_c7_4e87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2121_c7_4e87]
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2121_c7_4e87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2125_c24_1611]
signal BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2125_c24_f42c]
signal MUX_uxn_opcodes_h_l2125_c24_f42c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2125_c24_f42c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2125_c24_f42c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2125_c24_f42c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_e51b]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c7_ad9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_ad9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output);

-- t16_MUX_uxn_opcodes_h_l2085_c2_0e53
t16_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- n16_MUX_uxn_opcodes_h_l2085_c2_0e53
n16_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

-- printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc
printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc : entity work.printf_uxn_opcodes_h_l2086_c3_17fc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c7_554c
t16_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
t16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c7_554c
n16_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
n16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_left,
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_right,
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output);

-- t16_MUX_uxn_opcodes_h_l2093_c7_ade0
t16_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- n16_MUX_uxn_opcodes_h_l2093_c7_ade0
n16_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_left,
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_right,
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output);

-- t16_MUX_uxn_opcodes_h_l2098_c7_c4be
t16_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- n16_MUX_uxn_opcodes_h_l2098_c7_c4be
n16_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_left,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_right,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output);

-- t16_MUX_uxn_opcodes_h_l2101_c7_b1b3
t16_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- n16_MUX_uxn_opcodes_h_l2101_c7_b1b3
n16_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406
BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_left,
BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_right,
BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output);

-- n16_MUX_uxn_opcodes_h_l2105_c7_5797
n16_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
n16_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
n16_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output);

-- n16_MUX_uxn_opcodes_h_l2108_c7_2175
n16_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
n16_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
n16_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output);

-- n16_MUX_uxn_opcodes_h_l2113_c7_0697
n16_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
n16_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
n16_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_1fe0
n16_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad
BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_left,
BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_right,
BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb
BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_left,
BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_right,
BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035
BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_left,
BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_right,
BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output);

-- MUX_uxn_opcodes_h_l2119_c32_c880
MUX_uxn_opcodes_h_l2119_c32_c880 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2119_c32_c880_cond,
MUX_uxn_opcodes_h_l2119_c32_c880_iftrue,
MUX_uxn_opcodes_h_l2119_c32_c880_iffalse,
MUX_uxn_opcodes_h_l2119_c32_c880_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_cond,
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_left,
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_right,
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output);

-- MUX_uxn_opcodes_h_l2125_c24_f42c
MUX_uxn_opcodes_h_l2125_c24_f42c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2125_c24_f42c_cond,
MUX_uxn_opcodes_h_l2125_c24_f42c_iftrue,
MUX_uxn_opcodes_h_l2125_c24_f42c_iffalse,
MUX_uxn_opcodes_h_l2125_c24_f42c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output,
 t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output,
 t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output,
 t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output,
 t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output,
 n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output,
 n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output,
 n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output,
 MUX_uxn_opcodes_h_l2119_c32_c880_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output,
 MUX_uxn_opcodes_h_l2125_c24_f42c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_74e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_76cd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_9255 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_def4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_1df0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2106_c3_96ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_02ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_607d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_c880_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_c880_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_c880_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_c880_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_7d12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2102_l2109_l2094_l2117_DUPLICATE_ac1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2121_DUPLICATE_aff0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2132_l2081_DUPLICATE_1e1c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2119_c32_c880_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_7d12 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_7d12;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_607d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_607d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_def4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_def4;
     VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_9255 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_9255;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_1df0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_1df0;
     VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_76cd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_76cd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2106_c3_96ee := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2106_c3_96ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2119_c32_c880_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_02ee := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_02ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_74e9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_74e9;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2119_c32_4edb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_left;
     BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output := BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_810b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_73b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_e51b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_1ae1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c11_8d28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2085_c6_24e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2121_DUPLICATE_aff0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2121_DUPLICATE_aff0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2108_c11_73a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_1bb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2098_c11_607d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2105_c11_d1e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2102_l2109_l2094_l2117_DUPLICATE_ac1c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2102_l2109_l2094_l2117_DUPLICATE_ac1c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2093_c11_670f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2125_c24_1611] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_left;
     BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output := BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_4edb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_24e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_8d28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_670f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_607d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_810b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_d1e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_73a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_73b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_1ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1bb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_e51b_return_output;
     VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1611_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2102_l2109_l2094_l2117_DUPLICATE_ac1c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2102_l2109_l2094_l2117_DUPLICATE_ac1c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2102_l2109_l2094_l2117_DUPLICATE_ac1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9e53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2108_l2105_l2101_l2127_DUPLICATE_44ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_b555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2098_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_l2127_DUPLICATE_54d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2121_DUPLICATE_aff0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2121_DUPLICATE_aff0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2098_l2121_l2093_l2116_l2090_l2113_l2085_l2108_l2105_l2101_DUPLICATE_9fb7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2102_c3_4406] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_left;
     BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output := BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output;

     -- MUX[uxn_opcodes_h_l2125_c24_f42c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2125_c24_f42c_cond <= VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_cond;
     MUX_uxn_opcodes_h_l2125_c24_f42c_iftrue <= VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_iftrue;
     MUX_uxn_opcodes_h_l2125_c24_f42c_iffalse <= VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_return_output := MUX_uxn_opcodes_h_l2125_c24_f42c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2121_c7_4e87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2121_c7_4e87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2085_c1_0148] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c7_ad9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2119_c32_6035] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_left;
     BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output := BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2117_c3_b3ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_left;
     BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output := BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_ad9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2119_c32_c880_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_6035_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_4406_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_b3ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2095_l2110_DUPLICATE_1c8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue := VAR_MUX_uxn_opcodes_h_l2125_c24_f42c_return_output;
     VAR_printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2085_c1_0148_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_ad9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2121_c7_4e87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;

     -- printf_uxn_opcodes_h_l2086_c3_17fc[uxn_opcodes_h_l2086_c3_17fc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2086_c3_17fc_uxn_opcodes_h_l2086_c3_17fc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2121_c7_4e87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;

     -- t16_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2121_c7_4e87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output := result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;

     -- MUX[uxn_opcodes_h_l2119_c32_c880] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2119_c32_c880_cond <= VAR_MUX_uxn_opcodes_h_l2119_c32_c880_cond;
     MUX_uxn_opcodes_h_l2119_c32_c880_iftrue <= VAR_MUX_uxn_opcodes_h_l2119_c32_c880_iftrue;
     MUX_uxn_opcodes_h_l2119_c32_c880_iffalse <= VAR_MUX_uxn_opcodes_h_l2119_c32_c880_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2119_c32_c880_return_output := MUX_uxn_opcodes_h_l2119_c32_c880_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue := VAR_MUX_uxn_opcodes_h_l2119_c32_c880_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_4e87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     n16_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     n16_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_1fe0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_1fe0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_0697] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;

     -- n16_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     n16_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     n16_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- t16_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_0697_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     t16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2108_c7_2175] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;

     -- n16_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     n16_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     n16_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_2175_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     -- t16_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2105_c7_5797] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;

     -- n16_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_5797_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_b1b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_b1b3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- n16_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2098_c7_c4be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_c4be_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     n16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2093_c7_ade0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_ade0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c7_554c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_554c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2085_c2_0e53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output := result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2132_l2081_DUPLICATE_1e1c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2132_l2081_DUPLICATE_1e1c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_0e53_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2132_l2081_DUPLICATE_1e1c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2132_l2081_DUPLICATE_1e1c_return_output;
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
