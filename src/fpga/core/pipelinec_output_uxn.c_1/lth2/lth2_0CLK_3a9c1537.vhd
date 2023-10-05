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
-- BIN_OP_EQ[uxn_opcodes_h_l1757_c6_83c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1757_c1_f2be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal n16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1757_c2_76a6]
signal t16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1758_c3_5d4c[uxn_opcodes_h_l1758_c3_5d4c]
signal printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_479e]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_e859]
signal n16_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_e859]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1763_c7_e859]
signal t16_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_9833]
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1766_c7_8825]
signal n16_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_8825]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1766_c7_8825]
signal t16_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_25ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_4489]
signal n16_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_4489]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1771_c7_4489]
signal t16_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_5f45]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1774_c7_f695]
signal n16_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_f695]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1774_c7_f695]
signal t16_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1775_c3_1f89]
signal BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1778_c11_f555]
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal n16_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c7_1c35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_5178]
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_7c2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_f13e]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_6ac0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_816d]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_b6bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1790_c3_0279]
signal BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1793_c32_d2c7]
signal BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1793_c32_c4bc]
signal BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1793_c32_11b8]
signal MUX_uxn_opcodes_h_l1793_c32_11b8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1793_c32_11b8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1793_c32_11b8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1793_c32_11b8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_fc05]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1795_c7_4197]
signal result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_4197]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1795_c7_4197]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1795_c7_4197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_4197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1799_c24_cb1c]
signal BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1799_c24_55d0]
signal MUX_uxn_opcodes_h_l1799_c24_55d0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1799_c24_55d0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1799_c24_55d0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1799_c24_55d0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_3dcb]
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_949f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_949f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5
BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output);

-- n16_MUX_uxn_opcodes_h_l1757_c2_76a6
n16_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6
result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- t16_MUX_uxn_opcodes_h_l1757_c2_76a6
t16_MUX_uxn_opcodes_h_l1757_c2_76a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond,
t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue,
t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse,
t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

-- printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c
printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c : entity work.printf_uxn_opcodes_h_l1758_c3_5d4c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_e859
n16_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- t16_MUX_uxn_opcodes_h_l1763_c7_e859
t16_MUX_uxn_opcodes_h_l1763_c7_e859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1763_c7_e859_cond,
t16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue,
t16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse,
t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_left,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_right,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output);

-- n16_MUX_uxn_opcodes_h_l1766_c7_8825
n16_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
n16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
n16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825
result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- t16_MUX_uxn_opcodes_h_l1766_c7_8825
t16_MUX_uxn_opcodes_h_l1766_c7_8825 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1766_c7_8825_cond,
t16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue,
t16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse,
t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_4489
n16_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489
result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- t16_MUX_uxn_opcodes_h_l1771_c7_4489
t16_MUX_uxn_opcodes_h_l1771_c7_4489 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1771_c7_4489_cond,
t16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue,
t16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse,
t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output);

-- n16_MUX_uxn_opcodes_h_l1774_c7_f695
n16_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
n16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
n16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695
result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695
result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- t16_MUX_uxn_opcodes_h_l1774_c7_f695
t16_MUX_uxn_opcodes_h_l1774_c7_f695 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1774_c7_f695_cond,
t16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue,
t16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse,
t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89
BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_left,
BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_right,
BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_left,
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_right,
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output);

-- n16_MUX_uxn_opcodes_h_l1778_c7_1c35
n16_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_left,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_right,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output);

-- n16_MUX_uxn_opcodes_h_l1781_c7_7c2d
n16_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output);

-- n16_MUX_uxn_opcodes_h_l1786_c7_6ac0
n16_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output);

-- n16_MUX_uxn_opcodes_h_l1789_c7_b6bc
n16_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279
BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_left,
BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_right,
BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7
BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_left,
BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_right,
BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc
BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_left,
BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_right,
BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output);

-- MUX_uxn_opcodes_h_l1793_c32_11b8
MUX_uxn_opcodes_h_l1793_c32_11b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1793_c32_11b8_cond,
MUX_uxn_opcodes_h_l1793_c32_11b8_iftrue,
MUX_uxn_opcodes_h_l1793_c32_11b8_iffalse,
MUX_uxn_opcodes_h_l1793_c32_11b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197
result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_cond,
result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197
result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c
BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_left,
BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_right,
BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output);

-- MUX_uxn_opcodes_h_l1799_c24_55d0
MUX_uxn_opcodes_h_l1799_c24_55d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1799_c24_55d0_cond,
MUX_uxn_opcodes_h_l1799_c24_55d0_iftrue,
MUX_uxn_opcodes_h_l1799_c24_55d0_iffalse,
MUX_uxn_opcodes_h_l1799_c24_55d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_left,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_right,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output,
 n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output,
 n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output,
 n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output,
 n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output,
 n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output,
 n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output,
 n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output,
 MUX_uxn_opcodes_h_l1793_c32_11b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output,
 MUX_uxn_opcodes_h_l1799_c24_55d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_a712 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_2a29 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_7316 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1772_c3_4284 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_e919 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_7ed9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_765f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_e289 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_5b9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1782_l1775_l1790_DUPLICATE_63a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_l1795_DUPLICATE_2794_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1806_l1753_DUPLICATE_8ec5_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_2a29 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_2a29;
     VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_a712 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_a712;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_5b9d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_5b9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_e919 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_e919;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_765f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_765f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1772_c3_4284 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1772_c3_4284;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_e289 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_e289;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_7316 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_7316;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_7ed9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_7ed9;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_9833] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_left;
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output := BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_fc05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_l1795_DUPLICATE_2794 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_l1795_DUPLICATE_2794_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_25ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1793_c32_d2c7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_left;
     BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output := BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1757_c6_83c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_479e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_5178] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_left;
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output := BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1778_c11_f555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_left;
     BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output := BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1799_c24_cb1c] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_left;
     BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output := BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_3dcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_5f45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_f13e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1782_l1775_l1790_DUPLICATE_63a3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1782_l1775_l1790_DUPLICATE_63a3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_816d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1793_c32_d2c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c6_83c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_479e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_9833_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_25ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5f45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_f555_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_5178_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f13e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_816d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_fc05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_3dcb_return_output;
     VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1799_c24_cb1c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1782_l1775_l1790_DUPLICATE_63a3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1782_l1775_l1790_DUPLICATE_63a3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1782_l1775_l1790_DUPLICATE_63a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_b52d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1801_l1771_l1795_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_56a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_e7ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1771_l1766_l1789_l1763_l1786_l1781_l1778_l1774_DUPLICATE_04bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1801_l1771_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_5b86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_l1795_DUPLICATE_2794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_l1795_DUPLICATE_2794_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1771_l1795_l1766_l1789_l1763_l1786_l1757_l1781_l1778_l1774_DUPLICATE_d917_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_949f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1775_c3_1f89] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_left;
     BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output := BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1757_c1_f2be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output;

     -- MUX[uxn_opcodes_h_l1799_c24_55d0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1799_c24_55d0_cond <= VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_cond;
     MUX_uxn_opcodes_h_l1799_c24_55d0_iftrue <= VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_iftrue;
     MUX_uxn_opcodes_h_l1799_c24_55d0_iffalse <= VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_return_output := MUX_uxn_opcodes_h_l1799_c24_55d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_4197] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_949f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1795_c7_4197] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1793_c32_c4bc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_left;
     BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output := BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1790_c3_0279] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_left;
     BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output := BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1793_c32_c4bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1775_c3_1f89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1790_c3_0279_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1768_l1783_DUPLICATE_0a1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue := VAR_MUX_uxn_opcodes_h_l1799_c24_55d0_return_output;
     VAR_printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1757_c1_f2be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_949f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_949f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1795_c7_4197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;

     -- n16_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_4197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;

     -- MUX[uxn_opcodes_h_l1793_c32_11b8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1793_c32_11b8_cond <= VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_cond;
     MUX_uxn_opcodes_h_l1793_c32_11b8_iftrue <= VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_iftrue;
     MUX_uxn_opcodes_h_l1793_c32_11b8_iffalse <= VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_return_output := MUX_uxn_opcodes_h_l1793_c32_11b8_return_output;

     -- printf_uxn_opcodes_h_l1758_c3_5d4c[uxn_opcodes_h_l1758_c3_5d4c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1758_c3_5d4c_uxn_opcodes_h_l1758_c3_5d4c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1795_c7_4197] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output := result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;

     -- t16_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     t16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     t16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue := VAR_MUX_uxn_opcodes_h_l1793_c32_11b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1795_c7_4197_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_b6bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     t16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     t16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_b6bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_6ac0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     t16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     t16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- n16_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1786_c7_6ac0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     -- t16_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     t16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     t16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- n16_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1781_c7_7c2d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1781_c7_7c2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- t16_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     n16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     n16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1778_c7_1c35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_1c35_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_f695] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1774_c7_f695_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- n16_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     n16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     n16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_4489] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1771_c7_4489_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_8825] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_8825_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_e859] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_e859_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1757_c2_76a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1806_l1753_DUPLICATE_8ec5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1806_l1753_DUPLICATE_8ec5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c2_76a6_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1806_l1753_DUPLICATE_8ec5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1806_l1753_DUPLICATE_8ec5_return_output;
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
