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
-- Submodules: 66
entity lth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_302e9520;
architecture arch of lth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1824_c6_712a]
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1824_c1_9755]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1824_c2_529b]
signal n16_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1824_c2_529b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1824_c2_529b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c2_529b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1824_c2_529b]
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c2_529b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c2_529b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1824_c2_529b]
signal t16_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1825_c3_504e[uxn_opcodes_h_l1825_c3_504e]
signal printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_ab3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal n16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1829_c7_48c4]
signal t16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_f064]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c7_8926]
signal n16_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c7_8926]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_8926]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_8926]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_8926]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_8926]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_8926]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1832_c7_8926]
signal t16_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_4d71]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal n16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1837_c7_10f0]
signal t16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1838_c3_0d4e]
signal BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_61e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1841_c7_781f]
signal n16_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_781f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1841_c7_781f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1841_c7_781f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1841_c7_781f]
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_781f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1841_c7_781f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_0e4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c7_248b]
signal n16_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_248b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_248b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_248b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_248b]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_248b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_248b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1846_c3_0207]
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1848_c30_71c6]
signal sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1851_c21_8d69]
signal BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1851_c21_08e6]
signal MUX_uxn_opcodes_h_l1851_c21_08e6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1851_c21_08e6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1851_c21_08e6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1851_c21_08e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_535e]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_7286]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_7286]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_7286]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a
BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_left,
BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_right,
BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output);

-- n16_MUX_uxn_opcodes_h_l1824_c2_529b
n16_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
n16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
n16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b
result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b
result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- t16_MUX_uxn_opcodes_h_l1824_c2_529b
t16_MUX_uxn_opcodes_h_l1824_c2_529b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1824_c2_529b_cond,
t16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue,
t16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse,
t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

-- printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e
printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e : entity work.printf_uxn_opcodes_h_l1825_c3_504e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output);

-- n16_MUX_uxn_opcodes_h_l1829_c7_48c4
n16_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- t16_MUX_uxn_opcodes_h_l1829_c7_48c4
t16_MUX_uxn_opcodes_h_l1829_c7_48c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond,
t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue,
t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse,
t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c7_8926
n16_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
n16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- t16_MUX_uxn_opcodes_h_l1832_c7_8926
t16_MUX_uxn_opcodes_h_l1832_c7_8926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1832_c7_8926_cond,
t16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue,
t16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse,
t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_10f0
n16_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- t16_MUX_uxn_opcodes_h_l1837_c7_10f0
t16_MUX_uxn_opcodes_h_l1837_c7_10f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond,
t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue,
t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse,
t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e
BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_left,
BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_right,
BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output);

-- n16_MUX_uxn_opcodes_h_l1841_c7_781f
n16_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
n16_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
n16_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c7_248b
n16_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
n16_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207
BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_left,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_right,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6
sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_ins,
sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_x,
sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_y,
sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69
BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_left,
BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_right,
BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output);

-- MUX_uxn_opcodes_h_l1851_c21_08e6
MUX_uxn_opcodes_h_l1851_c21_08e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1851_c21_08e6_cond,
MUX_uxn_opcodes_h_l1851_c21_08e6_iftrue,
MUX_uxn_opcodes_h_l1851_c21_08e6_iffalse,
MUX_uxn_opcodes_h_l1851_c21_08e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output,
 n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output,
 n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output,
 n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output,
 sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output,
 MUX_uxn_opcodes_h_l1851_c21_08e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_7166 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_7b11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_dbd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_d842 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1850_c3_bbdd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1833_l1846_l1838_l1842_DUPLICATE_f073_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1845_l1841_DUPLICATE_e7c9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1859_l1820_DUPLICATE_54e4_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_7b11 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1830_c3_7b11;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_7166 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_7166;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_dbd0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_dbd0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_d842 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_d842;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1850_c3_bbdd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1850_c3_bbdd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_0e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_f064] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_4d71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1824_c6_712a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_61e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_ab3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_535e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1833_l1846_l1838_l1842_DUPLICATE_f073 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1833_l1846_l1838_l1842_DUPLICATE_f073_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1848_c30_71c6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_ins;
     sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_x;
     sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output := sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1845_l1841_DUPLICATE_e7c9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1845_l1841_DUPLICATE_e7c9_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c6_712a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_ab3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f064_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_4d71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_61e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_0e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_535e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1833_l1846_l1838_l1842_DUPLICATE_f073_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1833_l1846_l1838_l1842_DUPLICATE_f073_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1833_l1846_l1838_l1842_DUPLICATE_f073_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_04c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1853_l1845_l1841_DUPLICATE_92a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_cd71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1853_l1841_DUPLICATE_2bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1845_l1841_DUPLICATE_e7c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1845_l1841_DUPLICATE_e7c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1832_l1829_l1824_l1845_l1841_DUPLICATE_72a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1848_c30_71c6_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1838_c3_0d4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_left;
     BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output := BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1824_c1_9755] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1846_c3_0207] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_left;
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output := BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_7286] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_7286] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_7286] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1838_c3_0d4e_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_0207_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1843_l1834_DUPLICATE_7d0f_return_output;
     VAR_printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1824_c1_9755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_7286_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_7286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_7286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     n16_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1851_c21_8d69] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_left;
     BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output := BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- printf_uxn_opcodes_h_l1825_c3_504e[uxn_opcodes_h_l1825_c3_504e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1825_c3_504e_uxn_opcodes_h_l1825_c3_504e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1851_c21_8d69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- MUX[uxn_opcodes_h_l1851_c21_08e6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1851_c21_08e6_cond <= VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_cond;
     MUX_uxn_opcodes_h_l1851_c21_08e6_iftrue <= VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_iftrue;
     MUX_uxn_opcodes_h_l1851_c21_08e6_iffalse <= VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_return_output := MUX_uxn_opcodes_h_l1851_c21_08e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     n16_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     n16_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     t16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     t16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue := VAR_MUX_uxn_opcodes_h_l1851_c21_08e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- n16_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_248b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_248b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     t16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     t16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1841_c7_781f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     n16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_781f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_10f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_10f0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c7_8926] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     n16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     n16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c7_8926_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1829_c7_48c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1829_c7_48c4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1824_c2_529b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1859_l1820_DUPLICATE_54e4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1859_l1820_DUPLICATE_54e4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c2_529b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c2_529b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1859_l1820_DUPLICATE_54e4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1859_l1820_DUPLICATE_54e4_return_output;
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
