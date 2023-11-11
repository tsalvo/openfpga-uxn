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
entity gth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_302e9520;
architecture arch of gth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_e6ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_46c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c2_2828]
signal n16_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_2828]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_2828]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_2828]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_2828]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_2828]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_2828]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c2_2828]
signal t16_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1759_c3_1f94[uxn_opcodes_h_l1759_c3_1f94]
signal printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_c4f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal n16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1763_c7_61f1]
signal t16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_133f]
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1766_c7_7d4d]
signal t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_3f0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1771_c7_b0bc]
signal t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1772_c3_f3d6]
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_9bd7]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_4a8e]
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_03b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1779_c7_063d]
signal n16_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_063d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_063d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_063d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_063d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_063d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_063d]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1780_c3_a851]
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_5ad9]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1785_c21_4144]
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1785_c21_b128]
signal MUX_uxn_opcodes_h_l1785_c21_b128_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_b128_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_b128_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_b128_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_70f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_5e86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_5e86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_5e86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c2_2828
n16_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
n16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c2_2828
t16_MUX_uxn_opcodes_h_l1758_c2_2828 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c2_2828_cond,
t16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

-- printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94
printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94 : entity work.printf_uxn_opcodes_h_l1759_c3_1f94_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_61f1
n16_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- t16_MUX_uxn_opcodes_h_l1763_c7_61f1
t16_MUX_uxn_opcodes_h_l1763_c7_61f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond,
t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue,
t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse,
t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_left,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_right,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output);

-- n16_MUX_uxn_opcodes_h_l1766_c7_7d4d
n16_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- t16_MUX_uxn_opcodes_h_l1766_c7_7d4d
t16_MUX_uxn_opcodes_h_l1766_c7_7d4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond,
t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue,
t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse,
t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_b0bc
n16_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- t16_MUX_uxn_opcodes_h_l1771_c7_b0bc
t16_MUX_uxn_opcodes_h_l1771_c7_b0bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond,
t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue,
t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse,
t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6
BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_left,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_right,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output);

-- n16_MUX_uxn_opcodes_h_l1775_c7_4a8e
n16_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output);

-- n16_MUX_uxn_opcodes_h_l1779_c7_063d
n16_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
n16_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
n16_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851
BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_left,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_right,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9
sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144
BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_left,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_right,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output);

-- MUX_uxn_opcodes_h_l1785_c21_b128
MUX_uxn_opcodes_h_l1785_c21_b128 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1785_c21_b128_cond,
MUX_uxn_opcodes_h_l1785_c21_b128_iftrue,
MUX_uxn_opcodes_h_l1785_c21_b128_iffalse,
MUX_uxn_opcodes_h_l1785_c21_b128_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output,
 n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output,
 n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output,
 n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output,
 MUX_uxn_opcodes_h_l1785_c21_b128_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_23e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_e12e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_90e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_53a6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_3d35 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_b128_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_b128_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_b128_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_b128_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_9e1e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1779_l1775_DUPLICATE_2c61_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1793_l1754_DUPLICATE_4818_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_23e4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_23e4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1785_c21_b128_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1785_c21_b128_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_3d35 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_3d35;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_53a6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_53a6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_e12e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_e12e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_90e3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_90e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_y := resize(to_signed(-3, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_c4f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_3f0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1779_l1775_DUPLICATE_2c61 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1779_l1775_DUPLICATE_2c61_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_e6ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_133f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_9e1e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_9e1e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_9bd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_5ad9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_03b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_70f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_e6ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_c4f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_133f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_3f0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_9bd7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_03b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_70f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_9e1e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_9e1e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_9e1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_05c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1766_l1763_l1787_l1779_l1775_l1771_DUPLICATE_24dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_026e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1787_l1775_l1771_DUPLICATE_0547_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1779_l1775_DUPLICATE_2c61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1779_l1775_DUPLICATE_2c61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1766_l1763_l1758_l1779_l1775_l1771_DUPLICATE_367b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5ad9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_5e86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_5e86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_5e86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1780_c3_a851] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_left;
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output := BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1772_c3_f3d6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_left;
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output := BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_46c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_f3d6_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_a851_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_65bf_return_output;
     VAR_printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_46c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_5e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     -- t16_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- printf_uxn_opcodes_h_l1759_c3_1f94[uxn_opcodes_h_l1759_c3_1f94] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1759_c3_1f94_uxn_opcodes_h_l1759_c3_1f94_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1785_c21_4144] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_left;
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output := BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     n16_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     n16_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1785_c21_b128_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_4144_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     -- MUX[uxn_opcodes_h_l1785_c21_b128] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1785_c21_b128_cond <= VAR_MUX_uxn_opcodes_h_l1785_c21_b128_cond;
     MUX_uxn_opcodes_h_l1785_c21_b128_iftrue <= VAR_MUX_uxn_opcodes_h_l1785_c21_b128_iftrue;
     MUX_uxn_opcodes_h_l1785_c21_b128_iffalse <= VAR_MUX_uxn_opcodes_h_l1785_c21_b128_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1785_c21_b128_return_output := MUX_uxn_opcodes_h_l1785_c21_b128_return_output;

     -- t16_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue := VAR_MUX_uxn_opcodes_h_l1785_c21_b128_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_063d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_063d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_4a8e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     t16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_4a8e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;
     -- n16_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_b0bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_b0bc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_7d4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     n16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_7d4d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_61f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_61f1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_2828] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1793_l1754_DUPLICATE_4818 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1793_l1754_DUPLICATE_4818_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_2828_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_2828_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1793_l1754_DUPLICATE_4818_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1793_l1754_DUPLICATE_4818_return_output;
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
